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
public class TeacherDAO extends DBContext{
    private PreparedStatement stm;
    private ResultSet rs;
    
    public Teacher getTeacherById(String id){
        Teacher teacher = null;
        try {
            String strSQL = "select * from Teachers where teacherId=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while(rs.next()){
                String tId = rs.getString("teacherId");
                String tName = rs.getString("teacherName");
       
                String tEmail = rs.getString("email");
                teacher = new Teacher(tId, tName, tEmail);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return teacher;
    }
}
