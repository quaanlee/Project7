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
                double proposal = rs.getDouble("proposal");
                double report1 = rs.getDouble("report_1");
                double report2 = rs.getDouble("report_2");
                double finalReport = rs.getDouble("finalReport");
                double total = rs.getDouble("total");
                markTeam = new MarkTeam(teamId, proposal, report1, report2, finalReport, total);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return markTeam;
    }
}