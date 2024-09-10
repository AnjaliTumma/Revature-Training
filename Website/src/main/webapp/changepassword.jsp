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
if("noMatch".equals(msg)){
%>
<body>
<h3 style="margin-top:15rem;margin-left:40rem;font-size:30px;color:red;" >New password and Confirm password does not match!</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 style="margin-top:6.5rem;margin-left:38rem;font-size:30px;color:red;">Your old Password is wrong!</h3>
<%} %>
<%
if("done".equals(msg)){
%>
<h3 style="margin-top:1rem;margin-left:40rem;font-size:30px;color:red;">Password change successfully</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 style="margin-top:1rem;margin-left:50rem;font-size:30px;color:red;">Some thing went wrong! Try again!</h3>
<%} %>
<form action="ChangePasswordServlet" method="post">	
<div class="mbox">
       <div class="mbox1">
             <div class="SignUp">
                    <input type="password" placeholder="Enter Old Password" required name="oldPassword" style="margin-top:2rem;">
                    <input type="password" placeholder="Enter New Password" name="newPassword" required>
                    <input type="password" placeholder="Enter Confirm Password" name="confirmPassword" required>
                    <input type="submit" value="Save" style="margin-left:7rem;border-radius:10px">
                    
                </div>
                
            </div>
        </div>
 </form>
</html>