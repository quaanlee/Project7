<%-- 
    Document   : AddTeam
    Created on : Feb 25, 2026, 9:02:21 AM
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
        <%
            String check = (String)request.getAttribute("check");
            if(check == true){
        %>
        <div>
            <p>You haven't joined any team yet</p>
            <a href="createTeam"><button type="submit">Create team</button></a>
        </div>
        <%
            } else {
        %>
        <form action="action">
            <table>
                <tr>
                    <td>Team Name</td>
                    <td><input type="text" name="teamName"></td>
                </tr>
                <tr>
                    <td>Cell3</td>
                    <td>Cell4</td>
                </tr>
            </table>
        </form>
        <%    
            }
        %>
    </body>
</html>
