/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class FinalMark {
    private String studentId, teamId;
    private String markPersonal, total;

    public FinalMark(String studentId, String teamId, String markPersonal, String total) {
        this.studentId = studentId;
        this.teamId = teamId;
        this.markPersonal = markPersonal;
        this.total = total;
    }

    public String getStudentId() {
        return studentId;
    }

    public String getTeamId() {
        return teamId;
    }

    public String getMarkPersonal() {
        return markPersonal;
    }

    public String getTotal() {
        return total;
    }

    
    
    
}
