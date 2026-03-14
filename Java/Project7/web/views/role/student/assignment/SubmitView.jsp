<%-- 
    Document   : SubmitView
    Created on : Mar 6, 2026, 11:47:51 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/submitView.css"/>
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
                <li class="currentTag"><a href="assignmentC">Assignment</a></li>
                <li><a href="markReport">Mark Report</a></li>
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
                <div class="noneTeam">
                    <h2>${requestScope.category}</h2>
                    <form action="submit" method="post">
                        <input type="hidden" name="category" value=${requestScope.category}>
                        <table>
                            <tr>
                                <td>Enter file(PDF)</td>
                                <td><input type="text" name="file"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Submit" class="btn_submit">
                                    <c:if test="${requestScope.checkSubmit ne null}">
                                        <label style="color: red">${requestScope.checkSubmit}</label>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </form>
                        <a href="assignmentC" class="btn_back">Cancel</a>
                </div>

            </div>
        </div>

    </body>
</html>
