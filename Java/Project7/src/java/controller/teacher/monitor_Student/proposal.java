/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.teacher.monitor_Student;

import dal.AccountDAO;
import dal.MarkTeamDAO;
import dal.ReportDAO;
import dal.TopicDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Report;
import model.ReportMark;
import model.Teacher;
import model.Topic;

/**
 *
 * @author LENOVO
 */
public class proposal extends HttpServlet {
   
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
            out.println("<title>Servlet proposal</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet proposal at " + request.getContextPath () + "</h1>");
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
            return;
        }
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        List<Report> rL = new ReportDAO().getSubmittedList(teacher.getId(), "Proposal");
        List<ReportMark> rmL = new ArrayList<>();
        for (Report r : rL) {
            rmL.add(new ReportMark(r, new MarkTeamDAO().checkNullMark(r.getTeamId(), "Proposal")));
        }
        Map<ReportMark, Topic> mapRL = new HashMap<>();
        for (ReportMark rm : rmL) {
            Topic topic = new TopicDAO().getTopicByTeamId(rm.getReport().getTeamId());
            mapRL.put(rm, topic);
        }
        
        System.out.println(mapRL.size());
        request.setAttribute("category", "Proposal");
        request.setAttribute("submitedList", mapRL);
        request.getRequestDispatcher("views/role/teacher/monitor_Student/submitted.jsp").forward(request, response);
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
