<%-- 
    Document   : ListTopic
    Created on : Feb 24, 2026, 5:11:22 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/ListTopic.css"/>
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
                <li class="currentTag"><a href="topiclist">List Topic & Register</a></li>
                <li><a href="assignmentC">Assignment</a></li>
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
                <h1>Topic List</h1>
                <form action="findTopic" method="get" class="search">
                    <label>TopicID</label>
                    <input type="text" name="topicId" value=${input}>
                    <input type="submit" value="Find">
                </form>
                <table>
                    <%String email = (String)request.getSession().getAttribute("email");%>
                    <%TeamDAO teamDao = new TeamDAO();%>
                    <%MembersInTeamDAO mitd = new MembersInTeamDAO();%>
                    <tr>
                        <th>TopicID</th>
                        <th>Topic Name</th>
                        <th>Supervisor</th>
                        <th>Contact</th>
                        <th>Status</th>
                            <%if((email != null && !mitd.checkMemberInTeam(email))
                            || (email != null && teamDao.isLeader(email) == true
                            && request.getAttribute("Approved") == null)){%>
                        <th>Registration Status</th>
                        <th>Action</th>
                            <%}%>
                    </tr>
                    <%List<Topic> topicList = (List<Topic>)request.getAttribute("topicList");%>

                    <%if(topicList != null){%>
                    <%  for(Topic topic : topicList){
                            String tId = topic.getTeacherId();
                            TeacherDAO tDao = new TeacherDAO();
                            Teacher teacher = tDao.getTeacherById(tId);
                    %>

                    <tr>
                        <td><%=topic.getTopicId()%></td>
                        <td><%=topic.getTopicName()%></td>
                        <td><%=teacher.getName()%></td>
                        <td><%=teacher.getEmail()%></td>
                        <td><%=topic.getStatus()%></td>
                        <%if((email != null && !mitd.checkMemberInTeam(email))
                            || (email != null && teamDao.isLeader(email) == true
                            && request.getAttribute("Approved") == null)){%>
                        <%if(topic.getStatus().equals("Received")){
                        %>
                        <td></td>
                        <td></td>
                        <%
                          } else{
                                String topicId = (String)request.getAttribute("topicId");
                                if(topicId != null){
                                    if(request.getAttribute("Awaiting Approval") != null){
                                        if(topicId.equals(topic.getTopicId())){
                        %>
                        <td>Awaiting Approval</td>
                        <td><a href="cancel" class="btn_delete">Cancel</a></td>
                        <%
                                        } else {
                        %>
                        <td></td>
                        <td></td>
                        <%
                                        }
                                    }
                                    else if(request.getAttribute("Rejected") != null){
                                        if(topicId.equals(topic.getTopicId())){
                        %>
                        <td>Rejected</td>
                        <td><a href="register?topicId=<%=topic.getTopicId()%>" class="btn_register">Register</a></td>
                        <%
                                        } else {
                        %>
                        <td></td>
                        <td><a href="register?topicId=<%=topic.getTopicId()%>" class="btn_register">Register</a></td>
                        <%
                                        }
                                    }
          
                                } else {
                        %>
                        <td></td>
                        <td><a href="register?topicId=<%=topic.getTopicId()%>" class="btn_register">Register</a></td>
                        <%
                                }
                          }
                        %>
                        <%}%>

                    </tr>
                    <%  }%>    
                    <%}%>
                </table>
            </div>
        </div>

    </body>
</html>
