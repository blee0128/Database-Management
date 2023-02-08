package coms363project1b;
import java.sql.*;
public class CreateTables {
	private static Connection connect = null;
	
	public static void main(String[] args) {
		try {
			//Set up connection parameters
			String userName = "coms363";
			String password = "password";
			String dbServer = "jdbc:mysql://localhost:3306/project1";
			//String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";
			//Set up connection
			connect = DriverManager.getConnection(dbServer,userName,password);
			} catch(Exception e) {
				
			}
		Statement stmt = null;
		try {
			stmt = connect.createStatement();
			stmt.addBatch("CREATE TABLE students (\n"
					+ "	snum int UNIQUE,\n"
					+ "    ssn int,\n"
					+ "    name varchar(10),\n"
					+ "    gender varchar(1),\n"
					+ "    dob datetime,\n"
					+ "    c_addr varchar(20),\n"
					+ "    c_phone varchar(20),\n"
					+ "    p_addr varchar(20),\n"
					+ "    p_phone varchar(20),\n"
					+ "    PRIMARY KEY (ssn)\n"
					+ ");");
			
			stmt.addBatch("CREATE TABLE departments (\n"
					+ "	code int,\n"
					+ "	name varchar(50) UNIQUE,\n"
					+ "	phone varchar(10),\n"
					+ "	college varchar(20),\n"
					+ "    PRIMARY KEY (code)\n"
					+ ");");
			
			stmt.addBatch("CREATE TABLE degrees (\n"
					+ "	name varchar(50) ,\n"
					+ "    level varchar(5) ,\n"
					+ "    department_code int NOT NULL,\n"
					+ "	FOREIGN KEY (department_code) REFERENCES departments(code) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "	PRIMARY KEY (name, level)\n"
					+ ");");
			
			stmt.addBatch("CREATE TABLE courses (\n"
					+ "	number int,\n"
					+ "	name varchar(50) UNIQUE,\n"
					+ "	descrption varchar(50),\n"
					+ "	credithours int,\n"
					+ "	level varchar(20),\n"
					+ "    department_code int NOT NULL,\n"
					+ "	FOREIGN KEY (department_code) REFERENCES departments(code) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "	PRIMARY KEY (number)\n"
					+ ");");
			
			stmt.addBatch("CREATE TABLE register (\n"
					+ "	snum int,\n"
					+ "    course_number int,\n"
					+ "    regtime varchar(20),\n"
					+ "    grade int,\n"
					+ "    FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    FOREIGN KEY (course_number) REFERENCES courses(number) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    PRIMARY KEY(snum, course_number)\n"
					+ ");");
			
			stmt.addBatch("CREATE TABLE major (\n"
					+ "    snum int,\n"
					+ "    name varchar(50),\n"
					+ "    level varchar(5),\n"
					+ "    FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    FOREIGN KEY (name, level) REFERENCES degrees(name, level) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    PRIMARY KEY(snum, name, level)\n"
					+ ");");
			
			stmt.addBatch("CREATE TABLE minor (\n"
					+ "	snum int,\n"
					+ "    name varchar(50),\n"
					+ "    level varchar(5),\n"
					+ "    FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    FOREIGN KEY (name, level) REFERENCES degrees(name, level) ON UPDATE CASCADE ON DELETE CASCADE,\n"
					+ "    PRIMARY KEY(snum, name, level)\n"
					+ ");");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			
			stmt.executeBatch();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		
			try {
				// Close connection
				if (stmt != null) {
					stmt.close();
				}
			
				if (connect != null) {
					connect.close();
					}
			
			} catch (Exception e) {
				e.printStackTrace();}
			}
		}
	}
