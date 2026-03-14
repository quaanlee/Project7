<%-- 
    Document   : ComfimeCreateTeam
    Created on : Feb 26, 2026, 5:01:45 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/noneTeam.css"/>
        <style>
/*            .currentTag a {
                background-color:#4F4746;
                color: whitesmoke;
            }*/
        </style>
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
                <li class="currentTag"><a href="team">Team</a></li>
                <li><a href="topiclist">List Topic & Register</a></li>
                <li><a href="assignmentC">Assignment</a></li>
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
                    <%
                String teamName = (String)request.getAttribute("teamName");
                String teamId = (String)request.getAttribute("teamId");
                    %>
                    <h2>You have successfully created a new team</h2>
                    <table>    
                        <tr>
                            <td>TeamName: </td>
                            <td><%=teamName%></td>
                        </tr>
                        <tr>
                            <td>TeamID: </td>
                            <td><%=teamId%></td>
                        </tr>
                    </table>
                        <a href="team" class="btn_create">OK</a>
                </div>
            </div>
        </div>
    </body>
</html>
