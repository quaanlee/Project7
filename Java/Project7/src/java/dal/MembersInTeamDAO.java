/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.*;

/**
 *
 * @author LENOVO
 */
public class MembersInTeamDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;

    public boolean checkMemberInTeam(String iEmail) {
        Account account = null;
        try {
            String strSQL = "select * from MembersInTeam where studentId = "
                    + "(select studentId from Students where email = ?)";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, iEmail);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
