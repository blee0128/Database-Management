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
	String snum = (String)session.getAttribute("snum");
	String ssn = (String)session.getAttribute("ssn");
	%>
        <table border="1" cellpadding="5">
            <tr>
                <th>snum</th>
                <th>ssn</th>
            </tr>
				<tr>
                    <th>${snum}</th>
                    <th>${ssn}</th>
                </tr>
        </table>
</body>
</html>