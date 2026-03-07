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
    </head>
    <body>
        <table border="1">
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
                                                <td><a href="cancel"><button type="submit">Cancel</button></a></td>
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
                                                <td><a href="register?topicId=<%=topic.getTopicId()%>"><button type="submit">Register</button></a></td>
                            <%
                                            } else {
                            %>
                                                <td></td>
                                                <td><a href="register?topicId=<%=topic.getTopicId()%>"><button type="submit">Register</button></a></td>
                            <%
                                            }
                                        }
          
                                    } else {
                            %>
                               <td></td>
                               <td><a href="register?topicId=<%=topic.getTopicId()%>"><button type="submit">Register</button></a></td>
                            <%
                                    }
                              }
                            %>
                        <%}%>
                        
                        
                    </tr>
            <%  }%>    
            <%}%>
        </table>
    </body>
</html>
