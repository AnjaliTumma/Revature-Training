<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changedetailsheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>SignUp Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/changedetails.css">
        <style>
        	.mbox  .mbox1{
    width: 70%;
    height: 420px;
    position: absolute;
    top: 30%;
    left: 30%;
    border-radius: 10px;
    background-color: white;
}
        </style>
</head>
<body>
<%
String name="";
String pass="";
String mobile="";
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select * from users where email='"+email+"' ");
	if(rs.next()){
		name = rs.getString(2);    
		pass = rs.getString(5);    
		mobile = rs.getString(4);  
}
%>
	 <div class="mbox">
            <div class="mbox1">
               
                <div class="SignUp">
                    <h1></h1>
                    <h3 style="font-size:30px;color:red;margin-top:20px;text-align:center;height:40px;">Name: <%=name %></h3> <hr>
                    <h3 style="font-size:30px;color:red;margin-top:20px;text-align:center;height:40px;">Password: <%=pass %> </h3><hr>
                    <h3 style="font-size:30px;color:red;margin-top:20px;text-align:center;height:40px;">Mobile Number: <%=mobile %></h3><hr> 
                </div>
            </div>
        </div>
 <%
}catch(Exception e){
	System.out.println(e);
}
 %>
</body>
</html>