package coms363project1b;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ModifyRecords {
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
		String sqlQuery = "";
		sqlQuery = "set sql_safe_updates = 0;";
		stmt.executeQuery(sqlQuery);
		
		//Q1
		sqlQuery = "";
		sqlQuery = ("update students set name = 'Scott' where ssn = 746897816;");
		stmt.executeUpdate(sqlQuery);
		
		//Q2
		sqlQuery = "";
		sqlQuery = ("update major set name = 'Computer Science', level = 'MS' where snum in (select snum from students where ssn = 746897816);");
		stmt.executeUpdate(sqlQuery);
		
		//Q3
		sqlQuery = "";
		sqlQuery = ("delete from register where regtime = 'Spring2021';");
		stmt.executeUpdate(sqlQuery);

        
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
