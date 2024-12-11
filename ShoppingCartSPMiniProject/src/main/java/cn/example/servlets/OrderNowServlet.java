package cn.example.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.example.DBConnection.DBcon;
import cn.example.UserDao.OrderDao;
import cn.example.modal.Cart;
import cn.example.modal.Order;
import cn.example.modal.User;

@WebServlet("/OrderNowServlet")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter())
		{
			System.out.println("In Order Servlet");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date();

            User auth = (User) request.getSession().getAttribute("auth");
            if(auth!=null)
            {
            	String productId = request.getParameter("id");
            	int productquantity = Integer.parseInt(request.getParameter("quantity"));
            	if(productquantity<0)
            	{
            		productquantity=1;
            	}
            	
            	 Order orderModel = new Order();
                 orderModel.setId(Integer.parseInt(productId));
                 orderModel.setUid(auth.getId());
                 orderModel.setQunatity(productquantity);
                 orderModel.setDate(formatter.format(date));
                 
                 OrderDao orderDao = new OrderDao(DBcon.getConnection());
                 boolean result = orderDao.insertOrder(orderModel);
                 System.out.println("Rsult Is"+result);
                 
                 if (result) {
                     System.out.println("IN Rsult Block Is"+result);
                     ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                     if (cart_list != null) {
                         for (Cart c : cart_list) {
                             if (c.getId() == Integer.parseInt(productId)) {
                                 cart_list.remove(cart_list.indexOf(c));
                                 break;
                             }
                         }
                     }
                     response.sendRedirect("order.jsp");
                 } else {
                     out.println("order failed");
                 }  
            }
            else
            {
            	response.sendRedirect("login.jsp");
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
