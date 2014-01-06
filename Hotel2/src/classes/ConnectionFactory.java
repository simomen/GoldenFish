package classes;

import java.sql.*;

public class ConnectionFactory {

	public static Connection con;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/goldenfish", "root","1234");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();System.out.println("erreur");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();System.out.println("ereur");
		}
		
		return con;
	}
	
}