/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class MarkTeam {
    private String teamId;
    private double proposal, report1, report2, finalReport, total;

    public MarkTeam(String teamId, double proposal, double report1, double report2, double finalReport, double total) {
        this.teamId = teamId;
        this.proposal = proposal;
        this.report1 = report1;
        this.report2 = report2;
        this.finalReport = finalReport;
        this.total = total;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    public double getProposal() {
        return proposal;
    }

    public void setProposal(double proposal) {
        this.proposal = proposal;
    }

    public double getReport1() {
        return report1;
    }

    public void setReport1(double report1) {
        this.report1 = report1;
    }

    public double getReport2() {
        return report2;
    }

    public void setReport2(double report2) {
        this.report2 = report2;
    }

    public double getFinalReport() {
        return finalReport;
    }

    public void setFinalReport(double finalReport) {
        this.finalReport = finalReport;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
