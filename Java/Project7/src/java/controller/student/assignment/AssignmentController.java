/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student.assignment;

import dal.AccountDAO;
import dal.ReportDAO;
import dal.RoleDAO;
import dal.TeamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Report;
import model.Role;
import model.Team;

/**
 *
 * @author LENOVO
 */
public class AssignmentController extends HttpServlet {
   
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
            out.println("<title>Servlet AssignmentController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssignmentController at " + request.getContextPath () + "</h1>");
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
            if(team == null){
                response.sendRedirect("team");
                return;
            }
            ReportDAO rd = new ReportDAO();
            Report proposal = rd.getReport(team.getId(), "Proposal");
            Report report1 = rd.getReport(team.getId(), "Report 1");
            Report report2 = rd.getReport(team.getId(), "Report 2");
            Report finalReport = rd.getReport(team.getId(), "FinalReport");
            request.setAttribute("Proposal", proposal);
            request.setAttribute("Report1", report1);
            request.setAttribute("Report2", report2);
            request.setAttribute("FinalReport", finalReport);
            
            request.getRequestDispatcher("views/role/student/assignment/AssignmentView.jsp").forward(request, response);
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
