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
	ArrayList<String> degreeName = (ArrayList<String>) session.getAttribute("degreeName");
	ArrayList<String> degreeLevel= (ArrayList<String>) session.getAttribute("degreeLevel");
	%>
        <table border="1" cellpadding="5">
            <tr>
                <th>Name</th>
                <th>Level</th>
            </tr>
            <%
			for (int i = 0; i < degreeName.size(); i++) {
			%>
				<tr>
                    <td><%= degreeName.get(i)%></td>
                    <td><%= degreeLevel.get(i)%></td>
                </tr>
                <%} %>
        </table>
</body>
</html>