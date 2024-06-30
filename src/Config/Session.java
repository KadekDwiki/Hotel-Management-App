/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

/**
 *
 * @author kadek dwiki
 */
public class Session {
    private static String username;
    private static Integer idUserLogin;
    
    public static String getUsername(){
        return username;
    }
    
    public static void setUsername(String userName){
        Session.username = userName;
    }
    
    public static Integer getIdUserLogin(){
        return idUserLogin;
    }
    
    public static void setIdUserLogin(Integer idUser){
        Session.idUserLogin = idUser;
    }
}
