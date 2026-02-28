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
    </head>
    <body>
        <%
            String check = (String)request.getAttribute("check");
            if(check.equals("false")){
        %>
        <div>
            <h2>You haven't joined any team yet</h2>
            <table>
                <tr>
                    <td>
                        <a href="createTeam"><button type="submit">Create team</button></a>
                    </td>
                    <td>
                        <a href="joinTeam"><button type="submit">Join a team</button></a>
                    </td>
                </tr>
            </table>
            <a href="login">Back</a>
        </div>
        <%
            } else {
                boolean isLeader = (boolean)request.getAttribute("checkLeader");
                Team team = (Team)request.getAttribute("team");
                List<Student> memberList = (List<Student>)request.getAttribute("memberList");
        %>
        <%if(isLeader){%>
        <form action="action">
            <label for="stId">StudentID</label>
            <input type="text" name="stID" id="stId">
            <input type="submit" value="Add">
        </form>
        <%}%>
        <h1>Team : <%=team.getName()%></h1>
        <h3>TeamID: <%=team.getId()%></h3>
        <h3>Number of member: <%=memberList.size()%></h3>
        <table>
            <tr>
                <th>STT</th>
                <th>StudentId</th>
                <th>StudentName</th>
                <th>Class</th>
                <th>Major</th>
                <th>Email</th>
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
                <td><%=member.getEmail()%></td>
                <td><%=(checkLeader) ? "Leader" : ""%></td>
                <%if(isLeader){%>
                <td>
                    <%
                        if(!checkLeader){
                        %>
                        <a href="deleteMember?id=<%=member.getId()%>"><button>Delete</button></a>
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
        <%    
            }
        %>
    </body>
</html>
