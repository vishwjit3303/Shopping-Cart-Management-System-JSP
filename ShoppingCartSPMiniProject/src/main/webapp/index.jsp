<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="cn.example.DBConnection.DBcon"%>
<%@ page import="cn.example.modal.*"%>
<%@ page import="cn.example.UserDao.*"%>
<%@ page import="java.util.*"%>

<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("person", auth);
	}
	//Geting All Products From Prodct Class
	ProductDao pd = new ProductDao(DBcon.getConnection());
	List<Product> products = pd.getAllProducts();
	
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome To shop</title>
<!--  Include Header in which Bootstarp link File-->
<%@ include file="includes/header.jsp"%>
</head>
<body>
	<!-- Include Navbar File -->
	<%@ include file="includes/navbar.jsp"%>
	<div class="container">
		<!-- First div with card-header -->
		<div class="card-header my-3">All Product</div>
		<div class="row">
			<!-- Second div with col-md-3 -->
			<%
				if(!products.isEmpty())
				{
					for(Product p : products)
					{%>
						<div class="col-md-3 my-3">
						<div class="card" style="width: 18rem;">
							<img src="product_Images/<%=p.getImage()%>" class="card-img-top" >
							<div class="card-body">
								<h5 class="card-title">Name : <%=p.getName()%></h5>
								<h6 class="catagory">Category:<%=p.getCategory()%></h6>
								<h6 class="proce">Price :<%=p.getPrice() %></h6>
								<div class="mt-3 d-flex justify-content-between">
									<a href="cart.jsp?id=<%=p.getId()%>" class="btn btn-dark">Add to Cart</a>
									<a href="OrderNowServlet?quantity=1&id=<%=p.getId()%>" class="btn btn-primary">Buy now</a>
								</div>
							</div>
						</div>
					</div>
					<%}
				}
			%>
		</div>
	</div>
	<!--  Include footer (Javascript) File-->
	<%@ include file="includes/footer.jsp"%>
</body>
</html>