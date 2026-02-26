<%-- 
    Document   : index
    Created on : Feb 18, 2026, 11:08:33 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css"/>
        <style>
            input[type="password"]{
                padding: 4px;
                border-radius: 7px;
                border: none;
                width: 200px;
            }
        </style>
    </head>
    <body>
        <div class="login">
            <h1>Login</h1>
            <form action="login" method="post">
                <table>
                    <tr>
                        <td><label for="username">Email</label></td>
                        <td><input type="text" name="email" id="username"></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password</label></td>
                        <td><input type="password" name="password" id="password"></td>
                    </tr>
                    <%
                        String notif = (String)request.getAttribute("notification");
                        if(notif != null){
                    %>
                    <tr>
                        <td></td>
                        <td style="color: red"><%=notif%></td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login"></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
