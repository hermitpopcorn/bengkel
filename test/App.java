/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import database.DBUser;
import database.Database;

/**
 *
 * @author nugraha
 */
public class App {
    public static void main(String args[]) {
        Database.establish();
        DBUser UserModel = new DBUser(Database.getConnection());
        
        if(UserModel.auth("admin", "admin") != 0) {
            System.out.println("Login admin default: sukes");
        }
        
        if(UserModel.auth("karyawan", "karyawan") != 0) {
            System.out.println("Login karyawan default: sukes");
        }
    }
}
