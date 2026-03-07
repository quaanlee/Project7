<%-- 
    Document   : SubmitView
    Created on : Mar 6, 2026, 11:47:51 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>${requestScope.category}</h3>
        <form action="submit" method="post">
            <input type="hidden" name="category" value=${requestScope.category}>
            <table>
                <tr>
                    <td>Enter file(PDF)</td>
                    <td><input type="text" name="file"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Submit">
                        <c:if test="${requestScope.checkSubmit ne null}">
                            <label style="color: red">${requestScope.checkSubmit}</label>
                        </c:if>
                    </td>
                </tr>
            </table>
        </form>
            <a href="assignmentC"><button>Cancel</button></a>
    </body>
</html>
