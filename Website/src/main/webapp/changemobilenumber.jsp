<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changedetailsheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
 <link rel="stylesheet" type="text/css" href="CSS/changedetails.css">
  <style>
    .mbox  .mbox1{
    width: 70%;
    height: 420px;
    position: absolute;
    top: 35%;
    left: 25%;
    border-radius: 10px;
    background-color: white;
	}
	.mbox .mbox1 .SignUp input{
    width: 100%;
    height: 35px;
    margin: 10px 10%;
    border-bottom: 2px solid black !important;
    outline: none;
    border: none;
    text-align:center;
    font-size: 17px;
}
</style>
</head>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<body>
<h3 style="margin-top:5.5rem;margin-left:30rem;font-size:30px;color:red;" >Mobile Number Changed Successfully</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 style="margin-top:6.5rem;margin-left:38rem;font-size:30px;color:red;">Your Password is Wrong</h3>
<%} %>


<form action="ChangeMobileNumberServlet" method="post">	
<div class="mbox">
       <div class="mbox1">
             <div class="SignUp">
                    <input type="text" placeholder="Enter Your Phone Number" required name="mobilenumber" style="margin-top:2rem;" required>                  
                	<input type="password" placeholder="Enter Password(For Security)" required name="password" style="margin-top:2rem;" required>                  
                	<input type="submit" value="Save" style="margin-left:7rem;border-radius:10px">
                </div>
                
            </div>
        </div>
 </form>
</html>