<%-- 
    Document   : EditTopic
    Created on : Mar 8, 2026, 12:00:59 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/editTopic.css"/>
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
                <li class="currentTag"><a href="allTopic">Topic management</a></li>
                <li><a href="registersList">Approve registration</a></li>
                <li><a href="proposal">Monitor student progress</a></li>
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
                    <h2>Edit topic</h2>
                    <form action="editTopic" method="post">
                        <input type="hidden" name="topicId" value="${requestScope.topic.topicId}">
                        <table>
                            <tr>
                                <td>TopicName</td>
                                <td><input type="text" name="topicName" value="${requestScope.topic.topicName}"></td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td>
                                    <select name="status">
                                        <option value="Still Receiving">Still Receiving</option>
                                        <option value="Received">Received</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Save" class="btn_submit"></td>
                            </tr>
                        </table>
                        
                        <c:if test="${requestScope.notif!= null}">
                            ${requestScope.notif}
                        </c:if>
                    </form>
                    <a href="myTopic" class="btn_back">Cancel</a>
                </div>
            </div>
        </div>
    </body>
</html>
