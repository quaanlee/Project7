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
    </head>
    <body>
        <h1>Are you sure that you want to delete this member?</h1>
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
            <tr>
                <td></td>
                <td>
                    <form action="deleteMember" method="post">
                        <input type="hidden" name="stId" value=<%=st.getId()%>>
                        <input type="submit" value="Delete">
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
                    <td style="color: red">Delete not successful</td>
                </tr>
                <%
                }
            }
        %>
        </table>
        <%}%>
    </body>
</html>
