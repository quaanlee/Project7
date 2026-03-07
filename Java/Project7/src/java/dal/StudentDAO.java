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
public class StudentDAO extends DBContext{
    private PreparedStatement stm;
    private ResultSet rs;
    
    public Student getStudentByEmail(String iEmail){
        Student student = null;
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
    
    public Student getStudentByID(String id){
        Student student = null;
        try {
            String strSQL = "select * from Students where studentId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
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
    public List getStudentsById(String id){
        List<Student> stList = new ArrayList<>();
        try {
            String strSQL = "select * from Students where studentId like ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, '%'+id+'%');
            rs = stm.executeQuery();
            while(rs.next()){
                String stId = rs.getString("studentId");
                String stName = rs.getString("studentName");
                String stClass = rs.getString("class");
                String stMajor = rs.getString("major");
                String stEmail = rs.getString("email");
                Student student = new Student(stClass, stMajor, stId, stName, stEmail);
                stList.add(student);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("hello");
        }
        return stList;
    }
}
