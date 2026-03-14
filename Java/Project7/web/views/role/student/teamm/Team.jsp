<%-- 
    Document   : AddTeam
    Created on : Feb 25, 2026, 9:02:21 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/team.css"/>
        
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
                <li class="currentTag"><a href="team">Team</a></li>
                <li><a href="topiclist">List Topic & Register</a></li>
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
                
                <%
                        boolean isLeader = (boolean)request.getAttribute("checkLeader");
                        Team team = (Team)request.getAttribute("team");
                        List<Student> memberList = (List<Student>)request.getAttribute("memberList");
                        String inputFind = (String)request.getAttribute("input");
                        List<Student> stList = (List<Student>)request.getAttribute("stList");
                        String topic = "Empty";
                        if(request.getAttribute("topicName") != null){
                            topic = (String)request.getAttribute("topicName");
                        }
                %>

                <h1>Team : <%=team.getName()%></h1>
                <h3>TeamID: <%=team.getId()%></h3>
                <h3>Number of member: <%=memberList.size()%></h3>
                <h3>Topic: <%=topic%></h3>
                <%if(isLeader){%>
                <form action="findStudent" class="search">
                    <label for="stId">StudentID</label>
                    <input type="text" name="stId" id="stId" value=<%=(inputFind != null) ? inputFind : ""%>>
                    <input type="submit" value="Find">
                </form>
                <%if(stList != null){%>
                <table>
                    <tr>

                        <th>StudentId</th>
                        <th>StudentName</th>
                        <th>Class</th>
                        <th>Major</th>
                        <th>Action</th>
                    </tr>
                    <%
                        for(Student st : stList){
                            MembersInTeamDAO mitd = new MembersInTeamDAO();
                            boolean checkInTeam = mitd.checkMemberInTeam(st.getEmail());
                    %>
                    <tr>

                        <td><%=st.getId()%></td>
                        <td><%=st.getName()%></td>
                        <td><%=st.getClassName()%></td>
                        <td><%=st.getMajor()%></td>
                        <td>
                            <%
                                if(!checkInTeam){
                            %>
                            <a href="addMember?stId=<%=st.getId()%>&teamId=<%=team.getId()%>"><button class="btn_add">Add</button></a>
                            <%
                            }
                            %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%      }
                   }%>
                <table>
                    <tr>
                        <th>STT</th>
                        <th>StudentId</th>
                        <th>StudentName</th>
                        <th>Class</th>
                        <th>Major</th>
                        <th>Role</th>
                            <%if(isLeader){%>
                        <th>Action</th>
                            <%}%>
                    </tr>
                    <%
                        TeamDAO td = new TeamDAO();
                        int stt = 1;
                        for(Student member : memberList){
                            boolean checkLeader = td.isLeader(member.getEmail());
                    %>
                    <tr>
                        <td><%=stt%></td>
                        <td><%=member.getId()%></td>
                        <td><%=member.getName()%></td>
                        <td><%=member.getClassName()%></td>
                        <td><%=member.getMajor()%></td>
                        <td><%=(checkLeader) ? "Leader" : ""%></td>
                        <%if(isLeader){%>
                        <td>
                            <%
                                if(!checkLeader){
                            %>
                            <a href="deleteMember?id=<%=member.getId()%>"><button class="btn_delete">Delete</button></a>
                            <%
                            }
                            %>
                        </td>
                        <%}%>
                    </tr>
                    <%
                        stt++;
                        }
                    %>
                </table>  
                <%if(!isLeader){%>
                <a href="leaveTeam"><button class="btn_leave">Leave team</button></a>
                <%}%>
            </div>
        </div>

    </body>
</html>
