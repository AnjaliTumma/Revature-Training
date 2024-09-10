<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product Page</title>
	<link rel="stylesheet" type="text/css" href="../CSS/addnewproduct.css">
</head>
<body>
<%	
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
    <div class="nbox">
        <div class="content">
                <h1 style="text-align:center; color:red; margin-top:1%;">Product Added Successfully</h1>
                <% } %>
                <%
                if("wrong".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;">Some thing went wrong! Try Again!</h1>
                <%} %>
        </div>
     <%
     int id=1;
     try{
    	 Connection con=ConnectionProvider.getCon();
    	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery("select max(id) from product");
    	 while(rs.next()){
    		 id=rs.getInt(1);
    		 id=id+1;
    	 }
     }
     catch(Exception e){
    	 
     }
     %>
    <form action="addnewproductaction.jsp" method="POST">
	     <h1 style="text-align:center; color:red; margin-top:10%;">Product Id:<% out.println(id); %> </h1>
	    <input type="hidden" name="id" value="<% out.println(id);%>">
	   
	        <div class="inbox">
	            <div class="flex">
	                <input type="text" placeholder="Enter Name" name="name">
	                <input type="text" placeholder="Enter Category" name="category">
	            </div>
	             
	            	<label style="margin-left:9rem; margin-top:1rem;">Select</label><input type="file" name="file2">
	            
	            <div class="flex">
	                <input type="number" placeholder="Enter Price" name="price">
	                <select name="active" class="active">
	                	<option>-- Active --</option>
	                	<option value="Yes">Yes</option>
	                	<option value="No">No</option>
	                </select>
	            </div>
	           <br><br>
	          
	        </div>
	        <button class="save">Save</button>
	  </form>
	    </div>
	
</body>
</html>