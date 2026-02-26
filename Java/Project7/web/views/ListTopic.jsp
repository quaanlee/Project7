<%-- 
    Document   : ListTopic
    Created on : Feb 24, 2026, 5:11:22 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>TopicID</th>
                <th>Topic Name</th>
                <th>Status</th>
            </tr>
            <%List<Topic> topicList = (List<Topic>)request.getAttribute("topicList");%>
            <%if(topicList != null){%>
            <%  for(Topic topic : topicList){%>
                    <tr>
                        <td><%=topic.getTopicId()%></td>
                        <td><%=topic.getTopicName()%></td>
                        <td><%=topic.getStatus()%></td>
                        <%if(topic.getStatus().equals("Received")){
                        %>
                            <td></td>
                        <%
                          } else{
                        %>
                            <td><a href="register" id=<%=topic.getTopicId()%>><button type="submit">Register</button></a></td>
                        <%
                          }
                        %>
                        
                    </tr>
            <%  }%>    
            <%}%>
        </table>
    </body>
</html>
