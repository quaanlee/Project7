package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import model.*;

/**
 *
 * @author LENOVO
 */
public class FinalMarkDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;

    public FinalMark getFinalMarkByEmail(String email) {
        FinalMark fm = null;
        try {
            String strSQL = "SELECT fm.*\n"
                    + "  FROM [FinalMark] fm\n"
                    + "  left join Students st on st.studentId = fm.studentId\n"
                    + "  where st.email = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                String stId = rs.getString("studentId");
                String teamId = rs.getString("teamId");
                double personal = rs.getDouble("markPersonal");
                double total = rs.getDouble("total");
                System.out.println(personal);
                fm = new FinalMark(stId, teamId, personal, total);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return fm;
    }
}
