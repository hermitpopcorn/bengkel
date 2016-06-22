package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nugraha
 */
public class DBModel {
    Connection c = null;
    int idKaryawan = 0;
    
    public DBModel(Connection c, int idKaryawan) {
        if(c == null) {
            System.out.println("DB Connection tidak valid (null).");
            System.exit(1);
        } else {
            this.c = c;
        }
        
        this.idKaryawan = idKaryawan;
    }
    
    public boolean log(String action) {
        try {
            PreparedStatement ps = c.prepareStatement("INSERT INTO log (id_karyawan, aktivitas, waktu) VALUES (?, ?, NOW())");
            ps.setInt(1, this.idKaryawan);
            ps.setString(2, action);
            
            return ps.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk log aktivitas user.");
            return false;
        }
    }
}
