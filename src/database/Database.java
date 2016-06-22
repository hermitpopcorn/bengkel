package database;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;

/**
 *
 * @author nugraha
 */
public final class Database {
    static String host = "localhost";
    static String db = "proto_bengkel";
    static String dbuser = "root";
    static String dbpass = "";
    static String salt = "_what we do here is go back";
    
    static Connection c;
    
    public static void establish() {
        Database.c = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Database.c = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, dbuser, dbpass);
        } catch (ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "Koneksi ke DB gagal.");
            System.out.println("Driver JDBC tidak terdeteksi!");
            System.exit(1);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Koneksi ke Database gagal.");
            System.out.println("Koneksi ke Database gagal.");
            System.exit(1);
        }
    }
    
    public static Connection getConnection() {
        if(Database.c != null) {
            return Database.c;
        } else {
            return null;
        }
    }
    
    public static String hash(String pass) {
        String hashed = null;
        
        pass = pass + salt;
        
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(pass.getBytes());
            
            byte byteData[] = md.digest();
            
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            
            hashed = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            System.out.println("Sistem hashing SHA256 tidak ditemukan pada sistem.");
            System.exit(1);
        }
            
        return hashed;
    }
    
    public static String mysqlize_date(Date d) {
        try {
            return String.valueOf(d.getYear()+1900) + "-" + String.valueOf(d.getMonth()+1) + "-" + String.valueOf(d.getDate());
        } catch(Exception e) {
            return "";
        }
    }
    
    public static String datize_mysql(Date d) {
        java.util.Date ndate = new java.util.Date(d.getYear(), d.getMonth(), d.getDate());
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        return df.format(ndate);
    }
}
