<%-- 
    Document   : mark
    Created on : Mar 12, 2026, 12:29:40 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/mark.css"/>
    </head>
    <body>
        <div class="menu">
            <div class="profile">
                <img src="images/icon.png" alt=""/><br>
                <strong>${sessionScope.teacher.name}</strong><br>
                ${sessionScope.teacher.id}<br>
                ${sessionScope.teacher.email}
            </div>
            <a href="login" class="logo">Home</a>

            <ul>
                <li><a href="allTopic">Topic management</a></li>
                <li><a href="registersList">Approve registration</a></li>
                <li class="currentTag"><a href="proposal">Monitor student progress</a></li>
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
                    <h2>Category: ${category}</h2>
                    <form action="mark" method="post">
                        <input type="hidden" value="${report.teamId}" name="teamId">
                        <input type="hidden" name="category" value="${category}">
                        <table>
                            <tr>
                                <td>TeamID:</td>
                                <td>${report.teamId}</td>
                            </tr>
                            <tr>
                                <td>TopicName:</td>
                                <td>${topic.topicName}</td>
                            </tr>
                            <tr>
                                <td>FilePath(PDF):</td>
                                <td>${report.filePath}</td>
                            </tr>
                            <tr>
                                <td>Mark:</td>
                                <td>
                                    <input type="text" name="mark" value="${mark}">
                                    <c:if test="${notif != null}">
                                        <div>${notif}</div>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Save" name="btn" class="btn_submit">
                                    <input type="submit" value="Back" name="btn" class="btn_back">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
