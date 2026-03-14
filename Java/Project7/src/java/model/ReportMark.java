/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class ReportMark {
    private Report report;
    private String mark;

    public ReportMark(Report report, String mark) {
        this.report = report;
        this.mark = mark;
    }

    public Report getReport() {
        return report;
    }

    public String getMark() {
        return mark;
    }
    
    
}
