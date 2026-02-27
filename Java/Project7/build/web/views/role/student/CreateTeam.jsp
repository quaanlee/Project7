<%-- 
    Document   : CreateTeam
    Created on : Feb 26, 2026, 12:11:50 PM
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
            <h2>Create Team</h2>
            <form action="createTeam" method="post">
                <table>
                    <tr>
                        <td>Team Name</td>
                        <td><input type="text" name="teamName"></td>
                    </tr>
                    <%
                        if(request.getAttribute("checkEmpty") != null){
                    %>
                    <tr>
                        <td></td>
                        <td style="color: red">Team name can't be empty</td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Create">
                        </td>
                    </tr>
                </table>
            </form>
            <a href="team"><button>Back</button></a>
        </div>
    </body>
</html>
