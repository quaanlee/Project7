<%-- 
    Document   : RegisterList
    Created on : Mar 8, 2026, 4:30:07 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/registerList.css"/>
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
                <li class="currentTag"><a href="registersList">Approve registration</a></li>
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
                <h1>Registration List</h1>
                <table>
                    <tr>
                        <th>TeamID</th>
                        <th>TopicName</th>
                        <th>RegisterDate</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="r" items="${regList}">
                        <tr>
                            <td>${r.key.teamId}</td>
                            <td>${r.value.topicName}</td>
                            <td>${r.key.registerDate}</td>
                            <td>${r.key.status}</td>
                            <td class="two_btn">
                                <c:choose>
                                    <c:when test="${r.key.status == 'Awaiting Approval'}">
                                        <a href="registerDetail?teamId=${r.key.teamId}" class="btn_detail">Detail</a>
                                        <a href="accept?teamId=${r.key.teamId}" class="btn_accept">Accept</a>
                                        <a href="reject?teamId=${r.key.teamId}" class="btn_reject">Reject</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="registerDetail?teamId=${r.key.teamId}" class="btn_detail">Detail</a>
                                        <a href="Cancel?teamId=${r.key.teamId}" class="btn_cancel">Cancel</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>
