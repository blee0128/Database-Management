<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Query</title>
</head>
<body>

	<%!

	String snum = null;
	String ssn = null;

	
	public void query1(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "coms363", "password");
			statement = connection.createStatement();
			statement.addBatch("use project1;");
			statement.executeBatch(); 
			String sql = ("select snum, ssn from students where name = 'Becky';");
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				snum = rs.getString("snum");
				ssn = rs.getString("ssn");
				System.out.println(snum + "," + ssn);
			}
 			statement.close();
			rs.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with query: "+ e.getMessage());
			e.printStackTrace();
		}
	}

	public List<String> degreeName;
	public List<String> degreeLevel = new ArrayList<>();
	public void query2(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		degreeName = new ArrayList<>();
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "coms363", "password");
			statement = connection.createStatement();
			statement.addBatch("use project1;");
			statement.executeBatch(); 
			String sql = ("select distinct g.name, g.level from degrees g, departments d where g.department_code = d.code and d.name = 'Computer Science';");
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				degreeName.add(rs.getString("g.name"));
				degreeLevel.add(rs.getString("g.level"));
				System.out.println(degreeName + "," + degreeLevel);
			}
			
 			statement.close();
			rs.close(); 
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with query: "+ e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	public List<String> courseNumber;
	public List<String> courseName = new ArrayList<>();
	public void query3(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		courseNumber = new ArrayList<>();
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "coms363", "password");
			statement = connection.createStatement();
			statement.addBatch("use project1;");
			statement.executeBatch(); 
			String sql = ("select distinct c.number, c.name from courses c, departments d where c.department_code = d.code and (d.name = \"Computer Science\" or d.name = \"Landscape Architect\") ;");
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				courseNumber.add(rs.getString("c.number"));
				courseName.add(rs.getString("c.name"));
				System.out.println(courseNumber + "," + courseName);
			}
			
			
			statement.close();
			rs.close();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with query: "+ e.getMessage());
			e.printStackTrace();
		}
		
	}
	%>
	
		<%
		String button1 = request.getParameter("Q1");
	 	String button2 = request.getParameter("Q2");
	 	String button3 = request.getParameter("Q3");
		/* out.println("Click \"Q1\" to insert data records"); */

	%>
	
		<p>Click "Q1" to see result of query 1</p>
	<form action="QueryResult1.jsp" method="post">
		<%
		query1();
		session.setAttribute("snum", snum);
		session.setAttribute("ssn", ssn);
		%>
 		<input type="submit" name="button1" value="Q1" />
	</form>

	 	<p>Click "Q2" to see result of query 2</p>
	<form action="QueryResult2.jsp" method="post">
		<%
		query2();
		session.setAttribute("degreeName", degreeName);
		session.setAttribute("degreeLevel", degreeLevel);
		%>
		<input type="submit" name="button2" value="Q2" />
	</form>
	
		<p>Click "Q3" to see result of query 3</p>
	<form action="QueryResult3.jsp" method="post">
		<%
		query3();
		session.setAttribute("courseNumber", courseNumber);
		session.setAttribute("courseName", courseName);
		%>
		<input type="submit" name="button3" value="Q3" />
	</form>

</body>
</html>