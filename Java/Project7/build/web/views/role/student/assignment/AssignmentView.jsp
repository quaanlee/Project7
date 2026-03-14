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
        <link rel="stylesheet" href="css/assignmentView.css"/>
    </head>
    <body>
        <div class="menu">
            <div class="profile">
                <img src="images/icon.png" alt=""/><br>
                <strong>${sessionScope.student.name}</strong><br>
                ${sessionScope.student.id}<br>
                ${sessionScope.student.email}
            </div>
            <a href="login" class="logo">Home</a>

            <ul>
                <li><a href="team">Team</a></li>
                <li><a href="topiclist">List Topic & Register</a></li>
                <li  class="currentTag"><a href="assignmentC">Assignment</a></li>
                <li><a href="markReport">Mark Report</a></li>
            </ul>

            <a href="index.jsp" class="login">Login</a>
            <div class="contact">
                <strong>Contact</strong><br><br>
                Email: admin@fe.edu.com<br>
                Phone: 123456789
            </div>
        </div>
        <div class="right_side">
            <div class="banner">
                <img src="images/fpt_banner.jpg" alt="alt"/>
            </div>
            <div class="content">
                <h1>Assignment</h1>
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
                            <c:when test="${noneTopic != null}">
                                <td></td>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${requestScope.Proposal.filePath != null}">
                                        <td><a href="submit?item=Proposal" class="btn_resubmit">Resubmit</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a href="submit?item=Proposal" class="btn_submit">Submit</a></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>

                    </tr>
                    <tr>
                        <td>Report 1</td>
                        <td>${requestScope.Report1.deadline}</td>
                        <c:choose>
                            <c:when test="${noneTopic != null}">
                                <td></td>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${requestScope.Report1.filePath != null}">
                                        <td><a href="submit?item=Report 1" class="btn_resubmit">Resubmit</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a href="submit?item=Report 1" class="btn_submit">Submit</a></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>

                    </tr>
                    <tr>
                        <td>Report 2</td>
                        <td>${requestScope.Report2.deadline}</td>
                        <c:choose>
                            <c:when test="${noneTopic != null}">
                                <td></td>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${requestScope.Report2.filePath != null}">
                                        <td><a href="submit?item=Report 2" class="btn_resubmit">Resubmit</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a href="submit?item=Report 2" class="btn_submit">Submit</a></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>

                    </tr>
                    <tr>
                        <td>Final Report</td>
                        <td>${requestScope.FinalReport.deadline}</td>
                        <c:choose>
                            <c:when test="${noneTopic != null}">
                                <td></td>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${requestScope.FinalReport.filePath != null}">
                                        <td><a href="submit?item=FinalReport" class="btn_resubmit">Resubmit</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a href="submit?item=FinalReport" class="btn_submit">Submit</a></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>

                    </tr>
                </table>
            </div>
        </div>

    </body>
</html>
