package coms363project1b;
import java.sql.*;
public class DropTables {
	private static Connection connect = null;
	
	public static void main(String[] args) {
		try {
			//Set up connection parameters
			String userName = "coms363";
			String password = "password";
			String dbServer = "jdbc:mysql://localhost:3306/project1";
			connect = DriverManager.getConnection(dbServer,userName,password);
		} catch(Exception e) {
			
		}
	Statement stmt = null;
	try {
		stmt = connect.createStatement();
		stmt.addBatch("DROP TABLE IF EXISTS minor;");
		stmt.addBatch("DROP TABLE IF EXISTS major;");
		stmt.addBatch("DROP TABLE IF EXISTS register;");
		stmt.addBatch("DROP TABLE IF EXISTS courses;");
		stmt.addBatch("DROP TABLE IF EXISTS degrees;");
		stmt.addBatch("DROP TABLE IF EXISTS departments;");
		stmt.addBatch("DROP TABLE IF EXISTS students;");
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
