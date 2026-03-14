<%-- 
    Document   : TopicManagement
    Created on : Mar 7, 2026, 10:40:14 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/allTopic.css"/>
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
                <h1>All Topic List</h1>
                <a href="allTopic" class="topicList currentList">All topic</a>
                <a href="myTopic" class="topicList">My topic</a>
                <table>
                    <tr>
                        <th>TopicID</th>
                        <th>TopicName</th>
                        <th>TeacherName</th>
                        <th>Status</th>
                    </tr>
                    <c:forEach var="topic" items="${allTopic}">
                        <tr>
                            <td>${topic.key.topicId}</td>
                            <td>${topic.key.topicName}</td>
                            <td>${topic.value.name}</td>
                            <td>${topic.key.status}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>
