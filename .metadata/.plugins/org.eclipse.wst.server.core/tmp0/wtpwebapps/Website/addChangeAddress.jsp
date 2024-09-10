<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changedetailsheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add or Change Address</title>
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
if("valid".equals(msg)){
%>
<body>
<h3 style="margin-top:6rem;margin-left:35rem;font-size:30px;color:red;">Address Successfully Updated!</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 style="margin-top:6.5rem;margin-left:38rem;font-size:30px;color:red;">Something Went Wrong! Try Again!</h3>
<%} %>

<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select * from users where email='"+ email+"' ");
	while(rs.next()){
		
	

%>
<form action="AddChangeAddressAction.jsp" method="post">	
<div class="mbox">
       <div class="mbox1">
             <div class="SignUp">
                    <input type="text" placeholder="Enter Address" value="<%=rs.getString(6) %>" name="address" style="margin-top:2rem;" required>
                    <input type="text" placeholder="Enter City" name="city"  value="<%=rs.getString(7) %>" required>
                    <input type="text" placeholder="Enter State" name="state"  value="<%=rs.getString(8) %>" required>
                     <input type="text" placeholder="Enter Country" name="country"  value="<%=rs.getString(9) %>" required>
                     <input type="submit" value="Save" style="margin-left:7rem;border-radius:10px">
                    
                </div>
                
            </div>
        </div>
 </form>
 <%
 }}
 catch(Exception e)
 {
	 System.out.println(e);
 }
 %>
 </body>
 
</html>