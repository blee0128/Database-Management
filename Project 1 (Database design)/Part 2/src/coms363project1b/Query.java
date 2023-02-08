package coms363project1b;
import java.sql.*;
public class Query {
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
		//Q1
		ResultSet rs  = null;
		String sqlQuery = "";

		sqlQuery = ("select snum, ssn from students where name = 'Becky';");
		
		stmt.executeQuery(sqlQuery);
		rs = stmt.executeQuery(sqlQuery);
		System.out.println("Q1");
        while(rs.next()){
            //Display values
            System.out.println("Snum: " + rs.getInt("students.snum"));
            System.out.println("Ssn: " + rs.getInt("students.ssn"));
        }
        System.out.println();
        
        //Q2
		rs  = null;
		sqlQuery = "";

		sqlQuery = ("select name, level from major where snum in (select snum from students where ssn = 123097834);");
		
		stmt.executeQuery(sqlQuery);
		rs = stmt.executeQuery(sqlQuery);
		System.out.println("Q2");
        while(rs.next()){
            //Display values
            System.out.println("Major name: " + rs.getString("name"));
            System.out.println("Major level: " + rs.getString("level"));
        }
        System.out.println();
        
        //Q3
		rs  = null;
		sqlQuery = "";

		sqlQuery = ("select distinct c.name from courses c, departments d where c.department_code = d.code and d.name = 'Computer Science';");
		
		stmt.executeQuery(sqlQuery);
		rs = stmt.executeQuery(sqlQuery);
		System.out.println("Q3");
        while(rs.next()){
            //Display values
            System.out.println("Courses name: " + rs.getString("c.name"));
        }
        System.out.println();
        
        //Q4
		rs  = null;
		sqlQuery = "";

		sqlQuery = ("select distinct g.name, g.level from degrees g, departments d where g.department_code = d.code and d.name = 'Computer Science';");
		
		stmt.executeQuery(sqlQuery);
		rs = stmt.executeQuery(sqlQuery);
		System.out.println("Q4");
        while(rs.next()){
            //Display values
            System.out.println("Degrees name: " + rs.getString("g.name"));
            System.out.println("Degrees level: " + rs.getString("g.level"));
        }
        System.out.println();
        
        //Q5
		rs  = null;
		sqlQuery = "";

		sqlQuery = ("select distinct s.name from students s, minor m where s.snum = m.snum;");
		
		stmt.executeQuery(sqlQuery);
		rs = stmt.executeQuery(sqlQuery);
		System.out.println("Q5");
        while(rs.next()){
            //Display values
            System.out.println("Students name: " + rs.getString("s.name"));
        }
        System.out.println();
        
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
