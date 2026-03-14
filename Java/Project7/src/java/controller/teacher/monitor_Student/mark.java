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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.MarkTeam;
import model.Report;
import model.Teacher;
import model.Topic;

/**
 *
 * @author LENOVO
 */
public class mark extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet mark</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mark at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
        String category = request.getParameter("category");
        String teamId = request.getParameter("teamId");
        List<Report> rL = new ReportDAO().getSubmittedList(teacher.getId(), category);
        Report report = null;
        for (Report r : rL) {
            if (teamId.equals(r.getTeamId())) {
                report = r;
            }
        }
        Topic topic = new TopicDAO().getTopicByTeamId(teamId);
        MarkTeam mt = new MarkTeamDAO().getMarkTeamByTeamId(teamId);
        String mark = null;
        if (category.equals("Proposal")) {
            mark = mt.getProposal();
        } else if (category.equals("Report 1")) {
            mark = mt.getReport1();
        } else if (category.equals("Report 2")) {
            mark = mt.getReport2();
        } else {
            mark = mt.getFinalReport();
        }
        request.setAttribute("category", category);
        request.setAttribute("report", report);
        request.setAttribute("topic", topic);
        request.setAttribute("mark", mark);
        request.getRequestDispatcher("views/role/teacher/monitor_Student/mark.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String teamId = request.getParameter("teamId");
        String btn = request.getParameter("btn");
        String category = request.getParameter("category");
        String url = null;
        if (category.equals("Proposal")) {
            url = "proposal";
        } else if (category.equals("Report 1")) {
            url = "report1";
        } else if (category.equals("Report 2")) {
            url = "report2";
        } else {
            url = "final_report";
        }
        if (btn.equals("Back")) {
            response.sendRedirect(url);
            return;
        }
        String mark = request.getParameter("mark");
        try {
            double dM = Double.parseDouble(mark);
            if (dM < 0) {
                request.setAttribute("notif", "Invalid!");
                // copy from doget
                Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
                List<Report> rL = new ReportDAO().getSubmittedList(teacher.getId(), category);
                Report report = null;
                for (Report r : rL) {
                    if (teamId.equals(r.getTeamId())) {
                        report = r;
                    }
                }
                Topic topic = new TopicDAO().getTopicByTeamId(teamId);
                request.setAttribute("category", category);
                request.setAttribute("report", report);
                request.setAttribute("topic", topic);
                request.setAttribute("mark", mark);
                request.getRequestDispatcher("views/role/teacher/monitor_Student/mark.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("notif", "Invalid!");
            // copy from doget
            Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
            List<Report> rL = new ReportDAO().getSubmittedList(teacher.getId(), category);
            Report report = null;
            for (Report r : rL) {
                if (teamId.equals(r.getTeamId())) {
                    report = r;
                }
            }
            Topic topic = new TopicDAO().getTopicByTeamId(teamId);
            request.setAttribute("category", category);
            request.setAttribute("report", report);
            request.setAttribute("topic", topic);
            request.setAttribute("mark", mark);
            request.getRequestDispatcher("views/role/teacher/monitor_Student/mark.jsp").forward(request, response);
            return;
        }
        System.out.println(teamId + category + mark);
        if(new MarkTeamDAO().updateMark(teamId, category, mark)){
            response.sendRedirect(url);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
