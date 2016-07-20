package database;

import com.mysql.jdbc.MysqlDataTruncation;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author nugraha
 */
public class DBTransaksi extends DBModel {
    public DBTransaksi(Connection c, int idKaryawan) {
        super(c, idKaryawan);
    }

    public boolean savePenjualan(int id, String nama, BigDecimal biaya, Date tanggal, ArrayList<Integer> barangList, ArrayList<Integer> jumlahList, ArrayList<BigDecimal> hargaList) {
        try {
            String queryString = "";
            
            if(id != 0) {
                // Edit
                queryString = "REPLACE INTO penjualan (tanggal, nama_pembeli, karyawan_pencatat, biaya_service, id) VALUES (?, ?, ?, ?, ?)";
            } else {
                // Tambah
                queryString = "INSERT INTO penjualan (tanggal, nama_pembeli, karyawan_pencatat, biaya_service) VALUES (?, ?, ?, ?)";
            }
            
            PreparedStatement ps = c.prepareStatement(queryString, Statement.RETURN_GENERATED_KEYS);
            ps.setTimestamp(1, new java.sql.Timestamp(tanggal.getTime()));
            ps.setString(2, nama);
            ps.setInt(3, this.idKaryawan);
            ps.setBigDecimal(4, biaya);
            if(id != 0) {
                // Edit
                ps.setInt(5, id);
            }
            
            int modifiedRows = ps.executeUpdate();
            
            if(modifiedRows > 0) {
                if(id != 0) {
                    // Edit
                    this.log("mengedit transaksi penjualan dengan ID " + id);
                } else {
                    // Tambah
                    ResultSet key = ps.getGeneratedKeys();
                    key.first();
                    id = key.getInt(1);
                    this.log("menyimpan data transaksi penjualan (ID: " + String.valueOf(id) + ")");
                }
            } else {
                return false;
            }
            
            ps = c.prepareStatement("DELETE FROM penjualan_barang WHERE id_penjualan = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            
            for(int i = 0; i < barangList.size(); i++) {
                ps = c.prepareStatement("INSERT INTO penjualan_barang (id_penjualan, id_barang, harga_satuan, jumlah) VALUES (?, ?, ?, ?)");
                ps.setInt(1, id);
                ps.setInt(2, barangList.get(i));
                ps.setBigDecimal(3, hargaList.get(i));
                ps.setInt(4, jumlahList.get(i));
                ps.executeUpdate();
            }
            
            return true;
        } catch(MysqlDataTruncation e) {
            JOptionPane.showMessageDialog(null, "Ada data yang terlalu panjang (" + e + ")");
            return false;
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk menyimpan data barang.");
            e.printStackTrace();
            return false;
        }
    }
}
