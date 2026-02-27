<%-- 
    Document   : AddTeam
    Created on : Feb 25, 2026, 9:02:21 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String check = (String)request.getAttribute("check");
            if(check.equals("false")){
        %>
        <div>
            <h2>You haven't joined any team yet</h2>
            <table>
                <tr>
                    <td>
                        <a href="createTeam"><button type="submit">Create team</button></a>
                    </td>
                    <td>
                        <a href="joinTeam"><button type="submit">Join a team</button></a>
                    </td>
                </tr>
            </table>
            <a href="login">Back</a>
        </div>
        <%
            } else {
                Team team = (Team)request.getAttribute("team");
                List<Student> memberList = (List<Student>)request.getAttribute("memberList");
        %>
        <h1>Team : <%=team.getName()%></h1>
        <h3>TeamID: <%=team.getId()%></h3>
        <table>
            <tr>
                <th>StudentId</th>
                <th>StudentName</th>
                <th>Class</th>
                <th>Major</th>
                <th>Email</th>
            </tr>
            <%
                for(Student member : memberList){
            %>
            <tr>
                <td><%=member.getId()%></td>
                <td><%=member.getName()%></td>
                <td><%=member.getClassName()%></td>
                <td><%=member.getMajor()%></td>
                <td><%=member.getEmail()%></td>
            </tr>
            <%
                }
            %>
        </table>        
        <%    
            }
        %>
    </body>
</html>
