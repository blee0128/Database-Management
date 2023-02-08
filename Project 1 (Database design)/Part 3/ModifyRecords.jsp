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
	<%!
	public void modifyRecords(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		Statement statement = null;
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "coms363", "password");
			statement = connection.createStatement();
			statement.addBatch("use project1;");
			statement.executeBatch();
			String sql = ("UPDATE students set students.name = 'Scott' WHERE students.ssn = 746897816;");
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.executeUpdate(); 			
			System.out.println("Records are modified");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with modify record: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click \"Submit\" to modify records");

		if ("Submit".equals(button)) {
			modifyRecords();
			String redirectURL = "ModifyRecordsResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>