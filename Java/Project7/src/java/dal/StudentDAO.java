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
public class StudentDAO extends DBContext{
    private PreparedStatement stm;
    private ResultSet rs;
    
    public Person getStudentByEmail(String iEmail){
        Person student = null;
        try {
            String strSQL = "select * from Students where email = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, iEmail);
            rs = stm.executeQuery();
            while(rs.next()){
                String stId = rs.getString("studentId");
                String stName = rs.getString("studentName");
                String stClass = rs.getString("class");
                String stMajor = rs.getString("major");
                String stEmail = rs.getString("email");
                student = new Student(stClass, stMajor, stId, stName, stEmail);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return student;
    }
    
}
