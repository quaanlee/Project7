<%-- 
    Document   : DetailTeam
    Created on : Mar 8, 2026, 10:19:57 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/registerDetail.css"/>
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
                <h1>Detail Register</h1>
                <table>
                    <tr>
                        <td>TeamName: </td>
                        <td>${requestScope.team.name}</td>
                    </tr>
                    <tr>
                        <td>TeamID: </td>
                        <td>${requestScope.team.id}</td>
                    </tr>
                    <tr>
                        <td>Number Of Member: </td>
                        <td>${requestScope.memberList.size()}</td>
                    </tr>
                    <tr>
                        <td>Registration topic: </td>
                        <td>${requestScope.topic.topicName}</td>
                    </tr>
                    <tr>
                        <td>Registration Time: </td>
                        <td>${requestScope.register.registerDate}</td>
                    </tr>
                    <tr>
                        <td>Status: </td>
                        <td>${requestScope.register.status}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <c:choose>
                            <c:when test="${register.status == 'Awaiting Approval'}">
                                <td>
                                    <a href="accept?teamId=${team.id}" class="btn_accept">Accept</a>
                                    <a href="reject?teamId=${team.id}" class="btn_reject">Reject</a>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <a href="Cancel?teamId=${team.id}" class="btn_cancel">Cancel</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>
                    <a href="registersList" class="btn_cancel">Back to my list</a>
                <table class="teamTable">
                    <tr>
                        <th>StudentId</th>
                        <th>Name</th>
                        <th>Class</th>
                        <th>Major</th>
                        <th>Email</th>
                        <th>Role</th>
                    </tr>
                    <c:forEach var="st" items="${memberList}">
                        <tr>
                            <td>${st.id}</td>
                            <td>${st.name}</td>
                            <td>${st.className}</td>
                            <td>${st.major}</td>
                            <td>${st.email}</td>
                            <c:choose>
                                <c:when test="${st.id == team.leaderId}">
                                    <td>Leader</td>
                                </c:when>
                                <c:otherwise>
                                    <td></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>
