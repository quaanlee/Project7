<%-- 
    Document   : MarkReport
    Created on : Mar 7, 2026, 12:59:50 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/markReport.css"/>
    </head>
    <body>
        <div class="menu">
            <div class="profile">
                <img src="images/icon.png" alt=""/><br>
                <strong>${sessionScope.student.name}</strong><br>
                ${sessionScope.student.id}<br>
                ${sessionScope.student.email}
            </div>
            <a href="login" class="logo">Home</a>

            <ul>
                <li><a href="team">Team</a></li>
                <li><a href="topiclist">List Topic & Register</a></li>
                <li><a href="assignmentC">Assignment</a></li>
                <li class="currentTag"><a href="markReport">Mark Report</a></li>
            </ul>

            <a href="index.jsp" class="login">Login</a>
            <div class="contact">
                <strong>Contact</strong><br><br>
                Email: admin@fe.edu.com<br>
                Phone: 123456789
            </div>
        </div>
        <div class="right_side">
            <div class="banner">
                <img src="images/fpt_banner.jpg" alt="alt"/>
            </div>
            <div class="content">
                <h1>Mark Report</h1>
                <table>
                    <tr>
                        <th>Category</th>
                        <th>Weight</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Proposal</td>
                        <td>10%</td>
                        <c:choose>
                            <c:when test="${requestScope.markTeam.proposal != null}">
                                <td>${requestScope.markTeam.proposal}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td>Report 1</td>
                        <td>10%</td>
                        <c:choose>
                            <c:when test="${requestScope.markTeam.report1 != null}">
                                <td>${requestScope.markTeam.report1}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td>Report 2</td>
                        <td>10%</td>
                        <c:choose>
                            <c:when test="${requestScope.markTeam.report2 != null}">
                                <td>${requestScope.markTeam.report2}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td>Final Report</td>
                        <td>20%</td>
                        <c:choose>
                            <c:when test="${requestScope.markTeam.finalReport != null}">
                                <td>${requestScope.markTeam.finalReport}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td>Personal</td>
                        <td>50%</td>
                        <c:choose>
                            <c:when test="${requestScope.finalMark.markPersonal != null}">
                                <td>${requestScope.finalMark.markPersonal}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td colspan="2">Total</td>
                        <c:choose>
                            <c:when test="${requestScope.finalMark.total != null}">
                                <td>${requestScope.finalMark.total}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
