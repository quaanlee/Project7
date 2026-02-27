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
    </head>
    <body>
        <div>
            <%
                String teamName = (String)request.getAttribute("teamName");
                String teamId = (String)request.getAttribute("teamId");
            %>
            <h2>You have successfully created a new team</h2>
            <table>    
                <tr>
                    <td>TeamName</td>
                    <td><%=teamName%></td>
                </tr>
                <tr>
                    <td>TeamID</td>
                    <td><%=teamId%></td>
                </tr>
            </table>
                <a href="team"><button>OK</button></a>
        </div>
    </body>
</html>
