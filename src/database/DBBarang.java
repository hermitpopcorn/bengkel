package database;

import com.mysql.jdbc.MysqlDataTruncation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author nugraha
 */
public class DBBarang extends DBModel {
    public DBBarang(Connection c, int idKaryawan) {
        super(c, idKaryawan);
    }
    
    public boolean getTBarang(DefaultTableModel tm, String findbycol, String searchstr) {
        try {
            PreparedStatement ps = c.prepareStatement("SELECT id, nama, merk, kategori, harga, stok FROM barang WHERE barang.`"+findbycol+"` LIKE ? ORDER BY barang.id ASC");
            ps.setString(1, "%"+searchstr+"%");
            ResultSet r = ps.executeQuery();
            while(r.next()) {
                Object[] data = {
                    r.getString(1), r.getString(2), r.getString(3), r.getString(4), r.getString(5), r.getString(6)
                };
                tm.addRow(data);
            }
            
            return true;
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk pengambilan data barang.");
            return false;
        }
    }
    
    public String[] getBarang(int id) {
        try {
            String[] details = new String[6];
            
            PreparedStatement ps = c.prepareStatement("SELECT id, nama, merk, kategori, harga, stok FROM barang WHERE id=?");
            ps.setInt(1, id);
            ResultSet r = ps.executeQuery();
            if(r.first()) {
                details[0] = r.getString(1);
                details[1] = r.getString(2);
                details[2] = r.getString(3);
                details[3] = r.getString(4);
                details[4] = r.getString(5);
                details[5] = r.getString(6);
            }
            
            return details;
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk pengambilan data karyawan.");
            return null;
        }
    }
    
    public boolean saveBarang(String[] data) {
        try {
            String queryString = "";
            if(data[0].length() > 0) {
                // Edit
                queryString = "REPLACE INTO barang (nama, merk, kategori, harga, stok, id) VALUES (?, ?, ?, ?, ?, ?)";
            } else {
                // Tambah
                queryString = "INSERT INTO barang (nama, merk, kategori, harga, stok) VALUES (?, ?, ?, ?, ?)";
            }
            
            PreparedStatement ps = c.prepareStatement(queryString, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, data[1]);
            ps.setString(2, data[2]);
            ps.setString(3, data[3]);
            ps.setString(4, data[4]);
            ps.setString(5, data[5]);
            if(data[0].length() > 0) {
                // Edit
                ps.setInt(6, Integer.valueOf(data[0]));   
            }
            
            int modifiedRows = ps.executeUpdate();
            
            if(modifiedRows > 0) {
                if(data[0].length() > 0) {
                    // Edit
                    this.log("mengedit data barang dengan ID " + data[0]);
                } else {
                    // Tambah
                    ResultSet key = ps.getGeneratedKeys();
                    key.first();
                    this.log("menyimpan data barang baru (ID: " + String.valueOf(key.getInt(1)) + ")");
                }
            }
            
            return modifiedRows > 0;
        } catch(MysqlDataTruncation e) {
            JOptionPane.showMessageDialog(null, "Ada data yang terlalu panjang (" + e + ")");
            return false;
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk menyimpan data barang.");
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteBarang(int id) {
        try {      
            PreparedStatement ps = c.prepareStatement("DELETE FROM barang WHERE id=?");
            ps.setInt(1, id);
            
            int modifiedRows = ps.executeUpdate();
            
            if(modifiedRows > 0) {
                this.log("menghapus data barang dengan ID " + String.valueOf(id));
            }
            
            return modifiedRows > 0;
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk penghapusan data barang.");
            return false;
        }
    }
}
