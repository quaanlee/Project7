/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;
import model.Role;
/**
 *
 * @author LENOVO
 */
public class RoleDAO extends DBContext{
    private PreparedStatement stm;
    private ResultSet rs;
    
    public Role getRoleById(int id){
        Role role = null;
        try {
            String strSQL = "select * from Roles where roleId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while(rs.next()){
                int roleId = rs.getInt("roleId");
                String roleName = rs.getString("roleName");
                role = new Role(roleId, roleName);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return role;
    }
}
