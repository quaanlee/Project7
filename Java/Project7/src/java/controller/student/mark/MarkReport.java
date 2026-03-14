/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student.mark;

import dal.AccountDAO;
import dal.FinalMarkDAO;
import dal.MarkTeamDAO;
import dal.RegisterDAO;
import dal.ReportDAO;
import dal.TeamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Report;
import model.Team;

/**
 *
 * @author LENOVO
 */
public class MarkReport extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MarkReport</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarkReport at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        String email = (String) request.getSession().getAttribute("email");
        AccountDAO accDao = new AccountDAO();
        Account account = accDao.getAccountByEmail(email);
        if (account == null) {
            response.sendRedirect("index.jsp");
        } else {
            TeamDAO td = new TeamDAO();
            Team team = td.getTeamByEmail(email);
            if(team == null || !(new RegisterDAO().checkRegisterStatus(team.getId(), "Approved"))){
                
                request.getRequestDispatcher("views/role/student/mark/MarkReport.jsp").forward(request, response);
                return;
            }
            MarkTeamDAO mtd = new MarkTeamDAO();
            FinalMarkDAO fmd = new FinalMarkDAO();
            request.setAttribute("markTeam", mtd.getMarkTeamByTeamId(team.getId()));
            System.out.println(mtd.getMarkTeamByTeamId(team.getId()).getReport1());
            System.out.println(fmd.getFinalMarkByEmail(email).getMarkPersonal());
            request.setAttribute("finalMark", fmd.getFinalMarkByEmail(email));
            request.getRequestDispatcher("views/role/student/mark/MarkReport.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
