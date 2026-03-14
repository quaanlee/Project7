<%-- 
    Document   : DeleteTopic
    Created on : Mar 8, 2026, 3:52:03 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/deleteTopic.css"/>
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
                    <form action="deleteTopic" method="post">
                        <h3>Are you sure that want to delete this topic?</h3>
                        <h4>${requestScope.topic.topicName}</h4>
                        <input type="hidden" name="topicId" value=${requestScope.topic.topicId}>
                        <input type="submit" name="option" value="Yes" class="btn_delete">
                        <input type="submit" name="option" value="No" class="btn_edit">
                    </form>
                    <c:if test="${requestScope.notif!= null}">
                        ${requestScope.notif}
                    </c:if>
                </div>
            </div>
        </div>   
    </body>
</html>
