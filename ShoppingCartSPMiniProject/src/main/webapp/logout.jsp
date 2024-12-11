<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter Out = response.getWriter();
		if(request.getSession().getAttribute("auth")!=null)
		{
			request.getSession().removeAttribute("auth");
			response.sendRedirect("login.jsp");
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>