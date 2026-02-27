/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
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

    public boolean addMember(String studentId, String teamId) {
        try {
            String strSQL = "insert into MembersInTeam values (?, ?)";

            stm = connection.prepareStatement(strSQL);
            stm.setString(1, studentId);
            stm.setString(2, teamId);
            if (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public List getAllMember(String teamId) {
        List<Student> studentList = new ArrayList<>();
        try {
            String strSQL = "select st.*\n"
                    + "from MembersInTeam m\n"
                    + "left join Students st on m.studentId= st.studentId\n"
                    + "where m.teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamId);
            rs = stm.executeQuery();
            while (rs.next()) {
                String stId = rs.getString("studentId");
                String stName = rs.getString("studentName");
                String stClass = rs.getString("class");
                String stMajor = rs.getString("major");
                String stEmail = rs.getString("email");
                studentList.add(new Student(stClass, stMajor, stId, stName, stEmail));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return studentList;
    }
}
