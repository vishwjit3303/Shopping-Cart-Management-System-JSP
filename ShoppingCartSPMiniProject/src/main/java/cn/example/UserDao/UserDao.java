package cn.example.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.example.modal.User;

public class UserDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private String query;
	
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String pass)
	{
		User user = null;
		try {
			query = "SELECT * FROM users WHERE email=? and password=?";
			stmt = this.con.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, pass);
			rs = stmt.executeQuery();
			
			if(rs.next())
			{
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
}
