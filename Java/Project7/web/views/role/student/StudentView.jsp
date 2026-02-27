<%-- 
    Document   : student
    Created on : Feb 24, 2026, 4:50:32 PM
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
        <%String email = (String)request.getSession().getAttribute("email");%>
        <ol>
            <li><a href="team">Team</a></li>
            <li><a href="topiclist">List Topic</a></li>
            <li><a href="url">Progress</a></li>
            <li><a href="url">Mark Report</a></li>
        </ol>
    </body>
</html>
