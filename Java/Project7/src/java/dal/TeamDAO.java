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
public class TeamDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    
    public Team getTeamByTeamId(String id) {
        Team team = null;
        try {
            String strSQL = "select *"
                    + "from Teams\n"
                    + "where teamId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String teamId = rs.getString("teamId");
                String teamName = rs.getString("teamName");
                String leaderId = rs.getString("leaderId");

                team = new Team(teamId, teamName, leaderId);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return team;
    }
    public Team getTeamByEmail(String email) {
        Team team = null;
        try {
            String strSQL = "select t.*\n"
                    + "from MembersInTeam m\n"
                    + "left join Students st on m.studentId = st.studentId\n"
                    + "left join Teams t on t.teamId = m.teamId\n"
                    + "where st.email = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                String teamId = rs.getString("teamId");
                String teamName = rs.getString("teamName");
                String leaderId = rs.getString("leaderId");

                team = new Team(teamId, teamName, leaderId);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return team;
    }

    public Team getLastTeam() {
        Team team = null;
        try {
            String strSQL = "select top 1 * from Teams order by teamId desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String teamId = rs.getString("teamId");
                String teamName = rs.getString("teamName");
                String leaderId = rs.getString("leaderId");

                team = new Team(teamId, teamName, leaderId);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return team;
    }

    public boolean addTeam(Team team) {
        try {
            String strSQL = "insert into Teams values (?, ?, ?)";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, team.getId());
            stm.setString(2, team.getName());
            stm.setString(3, team.getLeaderId());
            if (stm.executeUpdate() != 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean isLeader(String email) {
        try {
            String strSQL = "select t.*\n"
                    + "from Teams t\n"
                    + "left join Students st on t.leaderId = st.studentId\n"
                    + "where st.email = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, email);
            if (stm.executeQuery().next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
