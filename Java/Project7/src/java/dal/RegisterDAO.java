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
public class RegisterDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    
    public Register getRegisterByTeamId(String id) {
        Register r = null;
        try {
            String strSQL = "select r.*"
                    + "from Registers r\n"
                    + "where teamId = ?\n";
                   
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while(rs.next()){
                String registerId = rs.getString("registerId");
                String teamId = rs.getString("teamId");
                String topicId = rs.getString("topicId");
                String registerDate = rs.getString("registerDate");
                String status = rs.getString("registerStatus");
                
                r = new Register(registerId, teamId, topicId, registerDate, status);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return r;
    }
    public List getRegisterList(String teacherId) {
        List<Register> list = new ArrayList<>();
        try {
            String strSQL = "select r.registerId, r.teamId, r.topicId,"
                    + " cast(r.registerDate as date) as registerDate, r.registerStatus\n"
                    + "from Registers r\n"
                    + "inner join (SELECT *\n"
                    + "  FROM [Topics] t\n"
                    + "  where t.teacherId = ?) t on t.topicId = r.topicId";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teacherId);
            rs = stm.executeQuery();
            while(rs.next()){
                String registerId = rs.getString("registerId");
                String teamId = rs.getString("teamId");
                String topicId = rs.getString("topicId");
                String registerDate = rs.getString("registerDate");
                String status = rs.getString("registerStatus");
                
                list.add(new Register(registerId, teamId, topicId, registerDate, status));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public boolean setRegisterStatus(String teamId, String status) {
        Topic topic = null;
        try {
            String strSQL = "update Registers\n"
                    + " set registerStatus = ?\n"
                    + "  where teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, status);
            stm.setString(2, teamId);
            if (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    
    public boolean setRegister(String teamId, String topicId) {
        Topic topic = null;
        try {
            String strSQL = "update Registers\n"
                    + " set registerStatus = 'Awaiting Approval', "
                    + "topicId = ?\n"
                    + "  where teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, topicId);
            stm.setString(2, teamId);
            if (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean deleteRegisterByTeamId(String teamId) {
        Topic topic = null;
        try {
            String strSQL = "delete Registers\n"
                    + "  where teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamId);
            if (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public Topic getTopicByTeamId(String teamId) {
        Topic topic = null;
        try {
            String strSQL = "SELECT t.*\n"
                    + "  FROM [Registers] r\n"
                    + "  left join Topics t on t.topicId = r.topicId\n"
                    + "  where r.teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamId);
            rs = stm.executeQuery();
            while (rs.next()) {
                String topicId = rs.getString("topicId");
                String topicName = rs.getString("topicName");
                String teacherId = rs.getString("teacherId");
                String status = rs.getString("topicStatus");

                topic = new Topic(topicId, topicName, teacherId, status);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return topic;
    }

    public boolean checkRegistedTeam(String teamId) {
        try {
            String strSQL = "select * from Registers where teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean checkRegisterStatus(String teamId, String status) {
        try {
            String strSQL = "select * from Registers where teamId = ? and registerStatus=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamId);
            stm.setString(2, status);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean addRegister(String teamId, String topicId) {
        try {
            String idRegister = getLastRegisterId();
            if (idRegister == null) {
                return false;
            }
            int stt = Integer.parseInt(idRegister.substring(1));
            stt++;
            idRegister = "R" + ((stt < 10) ? "0" + stt : stt);
            String strSQL = "INSERT INTO Registers (registerId, teamId, topicId, registerDate)\n"
                    + "VALUES (?, ?, ?, GETDATE());";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, idRegister);
            stm.setString(2, teamId);
            stm.setString(3, topicId);
            if (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public String getLastRegisterId() {
        String id = null;
        try {
            String strSQL = "SELECT top 1 registerId\n"
                    + "  FROM Registers\n"
                    + "  order by registerId desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            if (rs.next()) {
                id = rs.getString("registerId");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return id;
    }

    public boolean checkFull(String topicId) {
        try {
            String strSQL = "SELECT *\n"
                    + "  FROM [Registers]\n"
                    + "  where topicId=? and registerStatus='Approved'";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, topicId);
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
