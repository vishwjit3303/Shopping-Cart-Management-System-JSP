<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "cn.example.DBConnection.DBcon" %>
<%@ page import = "cn.example.UserDao.UserDao" %><%-- 
<%@ page import = "cn.example.modal.*" %>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
%> --%>

<%@ page import="java.util.*"%>
<%
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In Page</title>
<%@ include file = "includes/header.jsp" %>
</head>
<body>
	
<!-- Include Navbar File -->
<%@ include file = "includes/navbar.jsp" %>

	<div class="container">
    <div class="card w-50 mx-auto my-5">
      <div class="card-header text-center">
        <h4>User LogIn</h4>
      </div>
      <div class="card-body">
        <form method="post">
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="Uemail" placeholder="Enter your email" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="Upass" placeholder="*********" required>
          </div>
          <input type="submit" class="btn btn-primary w-100" value="submit">
        </form>
      </div>
    </div>
  </div>
  
  <%
  	if(request.getMethod().equalsIgnoreCase("post"))
  	{
		String email = request.getParameter("Uemail");
	    String Password = request.getParameter("Upass");
	    //System.out.println(email + Password);
	    
	    try{
	    	UserDao userDao = new UserDao(DBcon.getConnection());
	    	User user = userDao.userLogin(email, Password);
	    	
	    	
			//System.out.println("User :"+user);
		   // System.out.println(email + Password);
	    	if(user!=null)
	    	{
	    		request.getSession().setAttribute("auth",user);
	    		response.sendRedirect("index.jsp");
	    		%>
	    		<p class="text-center  text-success">User LogIn SucessFully</p>
	    		<%
	    	}
	    	else
	    	{
	    		%>
	    		<p class="text-center text-danger">User LogIn Failed</p>
	    		<%
	    	}
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
  	}
  %>

<%@ include file = "includes/footer.jsp" %>
</body>
</html>