<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--  --><title>Insert title here</title>
<title>CreateTablesResult</title>
</head>
<body>

	<%!
	public void createTable(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement statement = null;
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "coms363", "password");

			statement = connection.createStatement();
			statement.addBatch("drop database if exists project1;");
			statement.addBatch("create database project1;");
			statement.addBatch("use project1;");
			statement.addBatch("CREATE TABLE students (\r\n" + 
					"	snum INT,\r\n" + 
					"	ssn INTEGER,\r\n" + 
					"    name VARCHAR(10),\r\n" + 
					"    gender VARCHAR(1),\r\n" + 
					"    dob DATE, \r\n" + 
					"    c_addr VARCHAR(20),\r\n" + 
					"    c_phone VARCHAR(10),\r\n" + 
					"    p_addr VARCHAR(20),\r\n" + 
					"    p_phone VARCHAR(10),\r\n" + 
					"    PRIMARY KEY(ssn),\r\n" + 
					"    UNIQUE(snum)\r\n" + 
					");");
			
			statement.addBatch("CREATE TABLE departments (\n"
					+ "	code int,\n"
					+ "	name varchar(50) UNIQUE,\n"
					+ "	phone varchar(10),\n"
					+ "	college varchar(20),\n"
					+ "    PRIMARY KEY (code)\n"
					+ ");");
			
			statement.addBatch("CREATE TABLE degrees (\n"
					+ "	name varchar(50) ,\n"
					+ "    level varchar(5) ,\n"
					+ "    department_code int NOT NULL,\n"
					+ "	FOREIGN KEY (department_code) REFERENCES departments(code) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "	PRIMARY KEY (name, level)\n"
					+ ");");
			
			statement.addBatch("CREATE TABLE courses (\n"
					+ "	number int,\n"
					+ "	name varchar(50) UNIQUE,\n"
					+ "	descrption varchar(50),\n"
					+ "	credithours int,\n"
					+ "	level varchar(20),\n"
					+ "    department_code int NOT NULL,\n"
					+ "	FOREIGN KEY (department_code) REFERENCES departments(code) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "	PRIMARY KEY (number)\n"
					+ ");");
			
			statement.addBatch("CREATE TABLE register (\n"
					+ "	snum int,\n"
					+ "    course_number int,\n"
					+ "    regtime varchar(20),\n"
					+ "    grade int,\n"
					+ "    FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    FOREIGN KEY (course_number) REFERENCES courses(number) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    PRIMARY KEY(snum, course_number)\n"
					+ ");");
			
			statement.addBatch("CREATE TABLE major (\n"
					+ "    snum int,\n"
					+ "    name varchar(50),\n"
					+ "    level varchar(5),\n"
					+ "    FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    FOREIGN KEY (name, level) REFERENCES degrees(name, level) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    PRIMARY KEY(snum, name, level)\n"
					+ ");");
			
			statement.addBatch("CREATE TABLE minor (\n"
					+ "	snum int,\n"
					+ "    name varchar(50),\n"
					+ "    level varchar(5),\n"
					+ "    FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    FOREIGN KEY (name, level) REFERENCES degrees(name, level) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    PRIMARY KEY(snum, name, level)\n"
					+ ");");
			
			
			statement.executeBatch();
			
			System.out.println("Tables are created");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in create table: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click \"Submit\" to create tables");

		if ("Submit".equals(button)) {
			createTable();
			String redirectURL = "CreateTablesResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>