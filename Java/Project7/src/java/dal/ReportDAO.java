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
public class ReportDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;

    public Report getReport(String teamID, String item) {
        Report report = null;
        try {
            String strSQL = "select  [teamId]\n"
                    + "      ,[category]\n"
                    + "      ,[filePath]\n"
                    + "      ,[submitDate]\n"
                    + "      ,cast (deadline as date) as deadline"
                    + " from Reports where teamId = ? and category = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamID);
            stm.setString(2, item);
            rs = stm.executeQuery();
            while (rs.next()) {
                String teamId = rs.getString("teamId");
                String category = rs.getString("category");
                String filePath = rs.getString("filePath");
                String submitDate = rs.getString("submitDate");
                String deadline = rs.getString("deadline");

                report = new Report(teamId, category, filePath, submitDate, deadline);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return report;
    }

    public List getSubmittedList(String teacherId, String icategory) {
        List<Report> rL = new ArrayList<>();
        try {
            String strSQL = "select  [teamId]\n"
                    + "      ,[category]\n"
                    + "      ,[filePath]\n"
                    + "      ,cast([submitDate] as date) as submitDate\n"
                    + "      ,cast([deadline] as date) as deadline from Reports r \n"
                    + "where r.teamId in (select r.teamId from Registers r where r.registerStatus='Approved' \n"
                    + "  and r.topicId in (select t.topicId from Topics t where t.teacherId = ?))\n"
                    + "and r.category = ? and r.filePath is not null";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teacherId);
            stm.setString(2, icategory);
            rs = stm.executeQuery();
            while (rs.next()) {
                String teamId = rs.getString("teamId");
                String category = rs.getString("category");
                String filePath = rs.getString("filePath");
                String submitDate = rs.getString("submitDate");
                String deadline = rs.getString("deadline");
                rL.add(new Report(teamId, category, filePath, submitDate, deadline));

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rL;
    }

    public List getNotYetSubmittedList(String teacherId, String icategory) {
        List<Report> rL = new ArrayList<>();
        try {
            String strSQL = "select * from Reports r \n"
                    + "where r.teamId in (select r.teamId from Registers r where r.registerStatus='Approved' \n"
                    + "  and r.topicId in (select t.topicId from Topics t where t.teacherId = ?))\n"
                    + "and r.category = ? and r.filePath is null";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teacherId);
            stm.setString(2, icategory);
            rs = stm.executeQuery();
            while (rs.next()) {
                String teamId = rs.getString("teamId");
                String category = rs.getString("category");
                String filePath = rs.getString("filePath");
                String submitDate = rs.getString("submitDate");
                String deadline = rs.getString("deadline");
                rL.add(new Report(teamId, category, filePath, submitDate, deadline));

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rL;
    }

    public boolean submit(String teamID, String item, String filePath) {
        try {
            String strSQL = "update Reports set filePath = ? , submitDate = getdate()"
                    + "where teamId = ? and category = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, filePath);
            stm.setString(2, teamID);
            stm.setString(3, item);
            if (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    public String getDeadline(String teamID, String item) {
        String deadline = null;
        try {
            String strSQL = "select cast(deadline as date) as deadline "
                    + "from Reports where teamId = ? and category = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamID);
            stm.setString(2, item);
            rs = stm.executeQuery();
            if (rs.next()) {
                deadline = rs.getString("deadline");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return deadline;
    }
}
