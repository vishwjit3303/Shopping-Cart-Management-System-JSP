<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.example.modal.*"%>
<%@ page import="cn.example.UserDao.ProductDao"%>
<%@ page import="cn.example.DBConnection.DBcon"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="cn.example.servlets.*"%>
<%-- 
<%@ page import = "cn.example.modal.*" %>
<%
	User auth = (User)request.getSession().getAttribute("auth");
	if(auth != null)
	{
		request.setAttribute("auth",auth);
		response.sendRedirect("index.jsp");
	}
%> --%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);


/* ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProducts = null;
if (cart_list != null) {
	ProductDao pd = new ProductDao(DBcon.getConnection());
	cartProducts = pd.getCartProduct(cart_list);
	request.setAttribute("cart-list", cart_list);
}
 */
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DBcon.getConnection());
	cartProduct = pDao.getCartProduct(cart_list);
	double total = pDao.getTotalPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@ include file="includes/header.jsp"%>

<style>
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>

	<!-- Include Navbar File -->
	<%@ include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: $ ${(total>0)?dcf.format(total):0}</h3>
			<a class="mx-3 btn btn-primary" href="CheckOutServlet">Check Out</a>
		</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
						System.out.println("ID"+c.getId());
						System.out.println("Name"+c.getName());
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=dcf.format(c.getPrice())%></td>
					<td>
						<form action="OrderNowServlet" method="post" class="form-inline">
							<!-- Hidden Input -->
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<!-- Quantity Controls -->
							<div class="form-group d-flex justify-content-between w-50">
								<!-- Decrease Button -->
								<a class="btn btn-sm btn-decre" href="IncrementDecremet?action=dec&id=<%=c.getId()%>"> <i
									class="fas fa-minus-square"></i>
								</a>
								<!-- Quantity Input -->
								<input type="text" name="quantity" class="form-control w-50"
									value="<%=c.getQuantity() %>" readonly>
								<!-- Increase Button -->
								<a class="btn btn-sm btn-incre" href="IncrementDecremet?action=inc&id=<%=c.getId()%>"> <i
									class="fas fa-plus-square"></i>
								</a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a href="RemoveFromCartServlet?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- To add Products in CartList -->
	<%
	String id = request.getParameter("id");
	//System.out.println("The Id Is " + id);
	if (id != null) {
		int newid = Integer.parseInt(id);

		//System.out.println("The NewId Is " + newid);

		//create HTTP Session
		HttpSession Session = request.getSession();
		ArrayList<Cart> cart_list1 = (ArrayList<Cart>) Session.getAttribute("cart-list");
		

		
		
		if (cart_list1 == null) {
			/* cart_list1.add(cm); */
			cart_list1 = new ArrayList();
			Session.setAttribute("cart-list", cart_list1);
		    System.out.println("Cart list initialized and added to session.");
	%>
	<p class="text-center text-success">Session Created And Added to
		List</p>
	<%
	}

		Cart cm = new Cart();
		cm.setId(newid);
		cm.setQuantity(1);
		
	boolean exits = false;
	for (Cart c : cart_list1) {
	if (c.getId() == newid) {
		exits = true;
	%>
	<p class="text-center text-success">Product Exits</p>
	<%
	}
	}
	if (!exits) {
		cart_list1.add(cm); 
		Session.setAttribute("cart-list", cart_list1); // Update the session
	    System.out.println("Product added to cart: " + newid);
		//response.sendRedirect("index.jsp");
	%>
	<p class="text-center text-success">Product Added</p>
	<%
	}
	for (Cart c : cart_list1) {
	%>
	<p class="text-center text-success"><%=c.getId()%></p>
	<%
	}
	}
	%>
	<%@ include file="includes/footer.jsp"%>
</body>
</html>