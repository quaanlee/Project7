<%-- 
    Document   : submissions
    Created on : Mar 11, 2026, 9:44:16 PM
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
                <a href="submitted?category=${category}" class="list currentList">Submitted</a><a href="notYetSubmitted?category=${category}" class="list">Not yet submitted</a>
                <table>
                    <tr>
                        <th>TeamID</th>
                        <th>TopicName</th>
                        <th>File path (PDF)</th>
                        <th>Submission date</th>
                        <th>Deadline</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="s" items="${submitedList}">
                        <tr>
                            <td>${s.key.report.teamId}</td>
                            <td>${s.value.topicName}</td>
                            <td>${s.key.report.filePath}</td>
                            <td>${s.key.report.submitDate}</td>
                            <td>${s.key.report.deadline}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${s.key.mark != null}">
                                        <a href="remark?teamId=${s.key.report.teamId}&category=${category}" class="btn_resubmit">Remark</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="mark?teamId=${s.key.report.teamId}&category=${category}" class="btn_submit">Mark</a>
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
