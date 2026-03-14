<%-- 
    Document   : ComfimeDeleteMember
    Created on : Feb 27, 2026, 4:36:03 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
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
                    <h2>Are you sure that you want to delete this member?</h2>
                    <%Student st = (Student)request.getAttribute("student");%>
                    <%if(st != null){%>
                    <table>
                        <tr>
                            <td>ID: </td>
                            <td><%=st.getId()%></td>
                        </tr>
                        <tr>
                            <td>Name: </td>
                            <td><%=st.getName()%></td>
                        </tr>
                        <tr>
                            <td>Class: </td>
                            <td><%=st.getClassName()%></td>
                        </tr>
                        <tr>
                            <td>Major: </td>
                            <td><%=st.getMajor()%></td>
                        </tr>

                        <%
                            if(request.getAttribute("check") != null){
                                int checkDelete = (int)request.getAttribute("check");
                                if(checkDelete == 0){
                        %>
                        <tr>
                            <td></td>
                            <td style="color: red">Delete not successful</td>
                        </tr>
                        <%
                        }
                    }
                        %>
                    </table>
                    <div class="two_btn">
                        <form action="deleteMember" method="post">
                            <input type="hidden" name="stId" value=<%=st.getId()%>>
                            <input type="submit" value="Delete" class="btn_delete">
                        </form>
                            <a href="team" class="btn_back">Back</a>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>

    </body>
</html>
