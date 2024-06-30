/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author kadek dwiki
 */
public class DBConnection {
    public Connection connect(){
        Connection con = null;
        String url = "jdbc:mysql://127.0.0.1/db_manajemen_hotel";
        String username = "root";
        String password = "";
        
        if(con == null){
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            
            }catch(Exception e){
                System.out.print("Error koneksi ke database : \n" + e + "\n\n");
            }
        }
        
        return con;
    }
    
}
