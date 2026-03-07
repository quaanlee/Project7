<%-- 
    Document   : MarkReport
    Created on : Mar 7, 2026, 12:59:50 AM
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
        <table border="1">
            <tr>
                <th>Category</th>
                <th>Weight</th>
                <th>Value</th>
                <th>Comment</th>
            </tr>
            <tr>
                <td>Proposal</td>
                <td>10%</td>
                <c:choose>
                    <c:when test="${requestScope.markTeam.proposal != null}">
                        <td>${requestScope.markTeam.proposal}</td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
                <td></td>
            </tr>
            <tr>
                <td>Report 1</td>
                <td>10%</td>
                <c:choose>
                    <c:when test="${requestScope.markTeam.report1 != null}">
                        <td>${requestScope.markTeam.report1}</td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
                <td></td>
            </tr>
            <tr>
                <td>Report 2</td>
                <td>10%</td>
                <c:choose>
                    <c:when test="${requestScope.markTeam.report2 != null}">
                        <td>${requestScope.markTeam.report2}</td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
                <td></td>
            </tr>
            <tr>
                <td>Final Report</td>
                <td>20%</td>
                <c:choose>
                    <c:when test="${requestScope.markTeam.finalReport != null}">
                        <td>${requestScope.markTeam.finalReport}</td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
                <td></td>
            </tr>
            <tr>
                <td>Personal</td>
                <td>50%</td>
                <c:choose>
                    <c:when test="${requestScope.finalMark.markPersonal != null}">
                        <td>${requestScope.finalMark.markPersonal}</td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
                <td></td>
            </tr>
            <tr>
                <td colspan="2">Total</td>
                <c:choose>
                    <c:when test="${requestScope.finalMark.total != null}">
                        <td>${requestScope.finalMark.total}</td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
                <td></td>
            </tr>
        </table>
    </body>
</html>
