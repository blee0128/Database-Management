<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	ArrayList<String> courseNumber = (ArrayList<String>) session.getAttribute("courseNumber");
	ArrayList<String> courseName = (ArrayList<String>) session.getAttribute("courseName");
	%>
        <table border="1" cellpadding="5">
            <tr>
                <th>Number</th>
                <th>Name</th>
            </tr>
            <%
			for (int i = 0; i < courseNumber.size(); i++) {
			%>
				<tr>
					<td><%= courseNumber.get(i)%></td>
					<td><%= courseName.get(i)%></td>
                </tr>
                <%} %>
        </table>
</body>
</html>