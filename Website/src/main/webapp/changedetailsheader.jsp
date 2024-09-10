<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<title> Change Details  Header</title>
	<link rel="stylesheet" href="CSS/adminHeader.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"  />
	
</head>
<body>
<div class="abox">
<h1 Style="text-align:center; margin-top:1rem;margin-bottom:1rem;color:red;">Change Details</h1>
<% String email=session.getAttribute("email").toString(); %>
<div class="aheader">

		<div class="nav">
				<a href="header.jsp">Back
				<i class="fa-solid fa-caret-left"></i></a>
			</div>
			<div class="nav">
				<a href="changedetails.jsp">(<%out.println(email); %>)
				<i class="fa-solid fa-user"></i></a>
			</div>
			<div class="nav">
				<a href="changepassword.jsp">Change Password
				<i class="fa-solid fa-key"></i></a>
			</div>
			<div class="nav">
				<a href="addChangeAddress.jsp">Add Or Change Address
				<i class="fa-solid fa-location-dot"></i></a>
			</div>
			
			<div class="nav">
				<a href="changemobilenumber.jsp">Change Mobile Number
				<i class="fa-solid fa-phone-flip"></i></a>
			</div>
		
		</div>
	</div>
	 
</body>
</html>