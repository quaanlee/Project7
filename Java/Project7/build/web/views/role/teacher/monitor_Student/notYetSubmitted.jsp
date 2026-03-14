<%-- 
    Document   : notYetSubbmitted
    Created on : Mar 12, 2026, 10:48:30 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/moniterStudent.css"/>
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
                <h1>Category: ${category}</h1>
                <a href="proposal" class="category ${category eq 'Proposal' ? 'currentCategory' : ''}">Proposal</a>
                <a href="report1" class="category ${category eq 'Report 1' ? 'currentCategory' : ''}">Report 1</a>
                <a href="report2" class="category ${category eq 'Report 2' ? 'currentCategory' : ''}">Report 2</a>
                <a href="final_report" class="category ${category eq 'FinalReport' ? 'currentCategory' : ''}">Final Report</a>
                <br>
                <a href="submitted?category=${category}" class="list">Submitted</a><a href="notYetSubmitted?category=${category}" class="list currentList">Not yet submitted</a>
                <table>
                    <tr>
                        <th>TeamID</th>
                        <th>TopicName</th>
                    </tr>
                    <c:forEach var="s" items="${submitedList}">
                        <tr>
                            <td>
                                ${s.key.teamId}
                            </td>
                            <td>${s.value.topicName}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>
