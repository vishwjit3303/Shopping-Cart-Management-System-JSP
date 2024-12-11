package cn.example.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon {
	private static Connection conn = null;
	
	private static String URL ="jdbc:mysql://localhost:3306/shopping_db";
	private static String Username = "root";
	private static String Pass ="Root";
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if(conn==null)
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL,Username,Pass);
			System.out.println("Connected");
		}
		return conn;
	}
}
