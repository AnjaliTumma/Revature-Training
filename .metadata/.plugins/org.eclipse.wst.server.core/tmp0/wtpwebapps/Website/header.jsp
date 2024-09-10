<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<title>User Home  Page</title>
	<link rel="stylesheet" href="CSS/adminHeader.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"  />
	
</head>
<body>
<div class="abox">
<% String email=session.getAttribute("email").toString(); %>
		<div class="aheader">
			<div class="nav">
					<h2 style="margin-top:15px"><a href=""><%out.println(email); %>
					</a></h2>
				</div>
			<div class="nav">
				<a href="home.jsp">Home
				<i class="fa-solid fa-house"></i></a>
			</div>
			<div class="nav">
				<a href="mycart.jsp">My<br> Cart
				<i class="fa-solid fa-cart-plus"></i></a>
			</div>
			<div class="nav">
				<a href="myorder.jsp">My<br> Orders
				<i class="fa-solid fa-folder"></i></a>
			</div>
			<div class="nav">
				<a href="changedetails.jsp">Change<br> Details
				<i class="fa-solid fa-pen-to-square"></i></a>
			</div>
			<div class="nav">
				<a href="messageus.jsp">Message<br> Us
				<i class="fa-solid fa-message"></i></a>
			</div>
		
			<div class="nav">
				<a href="logout.jsp">Logout
				<i class="fa-solid fa-right-from-bracket"></i></a>
			</div>
			<div class="nav1">
			
			<form  action="searchHome.jsp" method="POST">
				<input type="text" placeholder="Search" name="search" style="width:150px; margin-top:12px; margin-right:30px; height:30px;">
				<button type="submit" style=" position: absolute; top:2%; left:96%"><i class="fa-solid fa-magnifying-glass" style="font-size:20px; height:30px;" ></i></button>
			</form>
			</div>
		</div>
	</div>
</body>
</html>