
<%@ page import = "cn.example.modal.*" %>
<%
	User auth1 = (User)request.getSession().getAttribute("auth");%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Shopping Cart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
 		<li class="nav-item"><a class="nav-link" href="order.jsp">Order</a></li>
 		<li class="nav-item"><a class="nav-link" href="logout.jsp">LogOut</a></li>
 		 <li class="nav-item"><a class="nav-link" href="login.jsp">LogIn</a></li> 
      </ul>
    </div>
  </div>
</nav>