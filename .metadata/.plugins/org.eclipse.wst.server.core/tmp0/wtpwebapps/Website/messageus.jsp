<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
  <style>
    .mbox {
    width: 70%;
    height: 420px;
    position: absolute;
    top: 25%;
    left: 20%;
    border-radius: 10px;
    background-color: white;
	}
	h1{
	text-align:center;
	margin-top:2.5rem;
	margin-left:1rem;
	color:red;
	}
	.mbox  input{
    width: 80%;
    height: 35px;
    margin: 0px 5%;
     text-align:center;
    font-size: 17px;
}
	.mbox textarea{
	 width: 80%;
    height: 300px;
    margin: 0px 5%;
     text-align:center;
    font-size: 17px;
	}
	.mbox input[type=submit]{
	border:none;
	height:50px;
	outline:none;
	background-color:blue!important;
	color:white;
	margin-top:10px;
	}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 style="margin-top:3rem;margin-left:28rem;font-size:30px;color:red;" >Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 style="margin-top:6.5rem;margin-left:38rem;font-size:30px;color:red;">Some thing Went Wrong! Try Again</h3>
<%} %>


<form action="messageusAction.jsp" method="post">	
<h1>Message Us</h1>
<div class="mbox">
    
             
                    <input type="text" placeholder="Subject" required name="subject" style="margin-top:2rem;" required>                  
                	<textarea placeholder="Enter Your Message" required name="body" style="margin-top:2rem;" required> </textarea>                 
                	<input type="submit" value="Save" style="margin-left:2.6rem;border-radius:10px">
               
                
            </div>
      
 </form>
</html>