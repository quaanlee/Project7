<%-- 
    Document   : MyTopic
    Created on : Mar 7, 2026, 10:58:44 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/teacher/allTopic.css"/>
    </head>
    <body>
        <div class="menu">
            <div class="profile">
                <img src="images/icon.png" alt=""/><br>
                <strong>${sessionScope.teacher.name}</strong><br>
                ${sessionScope.teacher.id}<br>
                ${sessionScope.teacher.email}
            </div>
            <a href="login" class="logo">Home</a>

            <ul>
                <li class="currentTag"><a href="allTopic">Topic management</a></li>
                <li><a href="registersList">Approve registration</a></li>
                <li><a href="proposal">Monitor student progress</a></li>
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
                <h1>My Topic List</h1>
                <a href="allTopic" class="topicList">All topic</a>
                <a href="myTopic" class="topicList  currentList">My topic</a>
                <br>
                <a href="createTopic" class="btn_register">Create new topic</a>
                <table>
                    <tr>
                        <th>TopicID</th>
                        <th>TopicName</th>
                        <th>Status</th>
                        <th style="width: 200px">Action</th>
                    </tr>
                    <%List<Topic> myTopic = (List<Topic>)request.getAttribute("mytopic");%>
                    <%for(Topic topic : myTopic){%>
                    <tr>
                        <td><%=topic.getTopicId()%></td>
                        <td><%=topic.getTopicName()%></td>
                        <td><%=topic.getStatus()%></td>
                        <td class="two_btn" style="width: 200px">
                            <a href="editTopic?idTopic=<%=topic.getTopicId()%>" class="btn_edit">Edit</a>
                            <a href="deleteTopic?idTopic=<%=topic.getTopicId()%>" class="btn_delete">Delete</a>
                        </td>
                    </tr>
                    <%}%>

                </table>
            </div>
        </div>

    </body>
</html>
