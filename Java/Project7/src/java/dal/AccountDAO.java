/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;
/**
 *
 * @author LENOVO
 */
public class AccountDAO extends DBContext{
    private PreparedStatement stm;
    private ResultSet rs;
    
    public Account getAccountByEmail(String iEmail){
        Account account = null;
        try {
            String strSQL = "select * from Accounts where email = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, iEmail);
            rs = stm.executeQuery();
            while(rs.next()){
                String oEmail = rs.getString("email");
                String oPassword = rs.getString("password");
                int roleId = rs.getInt("roleId");
                account = new Account(oEmail, oPassword, roleId);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return account;
    }
    
}
