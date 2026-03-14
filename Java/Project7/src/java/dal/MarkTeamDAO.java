package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import model.*;

/**
 *
 * @author LENOVO
 */
public class MarkTeamDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;

    public MarkTeam getMarkTeamByTeamId(String teamID) {
        MarkTeam markTeam = null;
        try {
            String strSQL = "select * from MarkTeam where teamId=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String teamId = rs.getString("teamId");
                String proposal = rs.getString("proposal");
                String report1 = rs.getString("report_1");
                String report2 = rs.getString("report_2");
                String finalReport = rs.getString("finalReport");
                String total = rs.getString("total");
                markTeam = new MarkTeam(teamId, proposal, report1, report2, finalReport, total);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return markTeam;
    }
    public String checkNullMark(String teamId, String category){
        String c = null;
        if(category.equals("Proposal")){
            c = "proposal";
        } else if(category.equals("Report 1")){
            c = "report_1";
        } else if(category.equals("Report 2")){
            c = "report_2";
        }else{
            c = "finalReport";
        }
        String mark = null;
        try {
            String strSQL = "select " + c + " from MarkTeam where teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, teamId);
            rs = stm.executeQuery();
            while(rs.next()){
                mark = rs.getString(c);
                System.out.println(mark);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return mark;
    }
    public boolean updateMark(String teamId, String category, String mark){
        String c = null;
        if(category.equals("Proposal")){
            c = "proposal";
        } else if(category.equals("Report 1")){
            c = "report_1";
        } else if(category.equals("Report 2")){
            c = "report_2";
        }else{
            c = "finalReport";
        }
    
        try {
            String strSQL = "update MarkTeam set " + c + " = ? where teamId = ?";
            stm = connection.prepareStatement(strSQL);
            
            stm.setString(1, mark);
            stm.setString(2, teamId);
            if(stm.executeUpdate() != 0){
                
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}