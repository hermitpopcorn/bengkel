package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nugraha
 */
public class DBUser extends DBModel {
    public DBUser(Connection c) {
        super(c, 0);
    }
    
    public DBUser(Connection c, int idKaryawan) {
        super(c, idKaryawan);
    }
    
    public int auth(String username, String password) {
        if(this.idKaryawan != 0) {
            return this.idKaryawan;
        }
        
        try {
            int id_user = 0;
            
            PreparedStatement ps = c.prepareStatement("SELECT id FROM user WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, Database.hash(password));
            ResultSet r = ps.executeQuery();
            if(r.first()) {
                id_user = r.getInt(1);
                this.idKaryawan = id_user;
                this.log("login");
            }
            
            return id_user;
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk login.");
            return 0;
        }
    }
    
    public String getLevel(int id) {
        try {
            PreparedStatement ps = c.prepareStatement("SELECT level FROM user WHERE id=?");
            ps.setInt(1, id);
            ResultSet r = ps.executeQuery();
            if(r.first()) {
                return r.getString(1);
            } else {
                return "karyawan";
            }
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk login.");
        }
        
        return "karyawan";
    }
    
    public String[] getDetails() {
        return this.getDetails(this.idKaryawan);
    }
    
    public String[] getDetails(int id) {
        String[] details = new String[1];
        
        try {
            PreparedStatement ps = c.prepareStatement("SELECT username FROM user WHERE id=?");
            ps.setInt(1, id);
            ResultSet r = ps.executeQuery();
            if(r.first()) {
                details[0] = r.getString(1);
            }
        } catch(SQLException e) {
            System.out.println("Terjadi kesalahan pada kueri SQL untuk login.");
        }
        
        return details;
    }
}
