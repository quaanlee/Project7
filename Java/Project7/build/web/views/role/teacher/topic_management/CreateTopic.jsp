<%-- 
    Document   : CreateTopic
    Created on : Mar 7, 2026, 11:09:38 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/createTopic.css"/>
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
                    <h2>Create new topic</h2>
                    <form action="createTopic" method="post">
                        Name Topic:
                        <input type="text" name="nameTopic">
                        <input type="submit" value="Create" class="btn_submit">
                    </form>
                    <c:if test="${requestScope.blank != null}">
                        ${requestScope.blank}
                    </c:if>
                    <c:if test="${requestScope.notSuccessful != null}">
                        ${requestScope.notSuccessful}
                    </c:if>
                    <a href="myTopic" class="btn_back">Cancel</a>
                </div>
            </div>
        </div>
    </body>
</html>
