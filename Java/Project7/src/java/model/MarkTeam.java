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
    private String proposal, report1, report2, finalReport, total;

    public MarkTeam(String teamId, String proposal, String report1, String report2, String finalReport, String total) {
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

    public String getProposal() {
        return proposal;
    }

    public String getReport1() {
        return report1;
    }

    public String getReport2() {
        return report2;
    }

    public String getFinalReport() {
        return finalReport;
    }

    public String getTotal() {
        return total;
    }

    
    
}
