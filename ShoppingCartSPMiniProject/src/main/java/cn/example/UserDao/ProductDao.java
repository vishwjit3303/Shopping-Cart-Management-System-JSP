package cn.example.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.example.modal.*;

public class ProductDao {

	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private String query;

	public ProductDao(Connection con) {
		this.con = con;
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<>();

		try {
			query = "SELECT * FROM products";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));

				products.add(row);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Cart> getCartProduct(ArrayList<Cart> cartlist)
	{
		List<Cart> products = new ArrayList<Cart>();
		
		try
		{
			if(cartlist.size()>0)
			{
				for(Cart item : cartlist)
				{
					query = "select * from products where id = ?";
					stmt=this.con.prepareStatement(query);
					stmt.setInt(1, item.getId());
					rs =stmt.executeQuery();
					
					while(rs.next())
					{
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						row.setImage(rs.getString("image"));
						
						products.add(row);
					}
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return products;
	}
	
	public double getTotalPrice(ArrayList<Cart> cartlist)
	{
		double sum =0;
		
		try {
			if(cartlist.size()>0)
			{
				for(Cart item : cartlist)
				{
					query = "select price from products where id = ?";
					stmt = this.con.prepareStatement(query);
					stmt.setInt(1, item.getId());
					rs = stmt.executeQuery();
					
					while(rs.next())
					{
						sum += rs.getDouble("price")*item.getQuantity();
					}
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return sum;
	}
	
	 public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from products where id=? ";

	            stmt = this.con.prepareStatement(query);
	            stmt.setInt(1, id);
	            ResultSet rs = stmt.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return row;
	    }
}
