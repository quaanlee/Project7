<%-- 
    Document   : AssignmentView
    Created on : Mar 6, 2026, 10:18:09 PM
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
        <table>
            <tr>
                <th>Name</th>
                <th>Deadline</th>
                <th>Action</th>
            </tr>
            <tr>
                <td>Proposal</td>
                <td>${requestScope.Proposal.deadline}</td>
                <c:choose>
                    <c:when test="${requestScope.Proposal.filePath != null}">
                        <td><a href="submit?item=Proposal"><button>Resubmit</button></a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="submit?item=Proposal"><button>Submit</button></a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td>Report 1</td>
                <td>${requestScope.Report1.deadline}</td>
                
                <c:choose>
                    <c:when test="${requestScope.Report1.filePath != null}">
                        <td><a href="submit?item=Report 1"><button>Resubmit</button></a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="submit?item=Report 1"><button>Submit</button></a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td>Report 2</td>
                <td>${requestScope.Report2.deadline}</td>
                <c:choose>
                    <c:when test="${requestScope.Report2.filePath != null}">
                        <td><a href="submit?item=Report 2"><button>Resubmit</button></a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="submit?item=Report 2"><button>Submit</button></a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td>Final Report</td>
                <td>${requestScope.FinalReport.deadline}</td>
                <c:choose>
                    <c:when test="${requestScope.FinalReport.filePath != null}">
                        <td><a href="submit?item=FinalReport"><button>Resubmit</button></a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="submit?item=FinalReport"><button>Submit</button></a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </table>
    </body>
</html>
