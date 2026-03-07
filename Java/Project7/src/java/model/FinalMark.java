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
    private double markPersonal, total;

    public FinalMark(String studentId, String teamId, double markPersonal, double total) {
        this.studentId = studentId;
        this.teamId = teamId;
        this.markPersonal = markPersonal;
        this.total = total;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    public double getMarkPersonal() {
        return markPersonal;
    }

    public void setMarkPersonal(double markPersonal) {
        this.markPersonal = markPersonal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
