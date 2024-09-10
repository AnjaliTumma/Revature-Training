<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product Page</title>
	<link rel="stylesheet" type="text/css" href="../CSS/editproduct.css">
</head>
<body style="background-color:white !important">
<%	
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select * from product where id='"+id+"' ");
		while(rs.next()){
%>
  <form action="EditProductServlet" method="POST" enctype="multipart/form-data">
    <div class="nbox" >
  
    <br><br>&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="allproducteditproduct.jsp" style="text-align:center; color:black; cursor:pointer; magin-left:50px;text-decoration:none; font-size:27px"><i class="fa-solid fa-backward"></i>&nbsp;Back</a>   
	        <h1 style="text-align:center;color:red; font-size:50px">Edit Product</h1>
	        <div class="inbox">
	            <div class="flex">
	            <input type="text" placeholder="Enter Name" name="name" value="<%=rs.getString(2)%>">
	                <input type="text" placeholder="Enter Category" name="category" value="<%=rs.getString(3)%>">
	            </div>
	            <div class="flex">
	                <input type="number" placeholder="Enter Price" name="price" value="<%=rs.getString(4)%>">
	                <select name="active" class="active" >
	                	<option>-- Active --</option>
	                	<option value="Yes">Yes</option>
	                	<option value="No">No</option>
	                </select>
	            </div>
	        </div>
	           <label for="image" style="margin-top:2rem; margin-left:140px; font-size:27px; font-weight:599;" value="<%=rs.getString(5)%>">Select an image:</label><br>
	         
	           <br><br>
	            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="file" name="image" id="image" accept="image/*"  >
	            
	        <button class="save" style="margin-top:0px;">Edit</button>
	          </div>
	  </form>
	  
	<%
	} }
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
</body>
</html>