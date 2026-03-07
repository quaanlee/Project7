<%-- 
    Document   : ComfimeLeaveTeam
    Created on : Feb 28, 2026, 11:17:28 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Are you sure that you wanna leave this team?</h1>
        <%Team team = (Team)request.getAttribute("team");%>
        <table>
            <tr>
                <td>ID: </td>
                <td><%=team.getId()%></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><%=team.getName()%></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <form action="leaveTeam" method="post">
                        <input type="submit" value="Leave">
                    </form>
                    <a href="team"><button>Back</button></a>
                </td>
            </tr>
            <%
            if(request.getAttribute("check") != null){
                int checkDelete = (int)request.getAttribute("check");
                if(checkDelete == 0){
                %>
                <tr>
                    <td></td>
                    <td style="color: red">Leave not successful</td>
                </tr>
                <%
                    }
                }
            %>
        </table>
    </body>
</html>
