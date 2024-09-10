<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product Page</title>
<style type="text/css">
	button{
	margin-top:2rem;
	}
	.file{
	margin-top:2rem;
	 margin-left:160px;
	 }
</style>
	<link rel="stylesheet" type="text/css" href="../CSS/addnewproduct.css">
</head>
<body>
<%	
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
    <div class="nbox" style="background-color:lightblue;">
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
    <form action="AddNewProductServlet" method="POST" enctype="multipart/form-data">
	     <h1 style="text-align:center; color:red; margin-top:3%;">Product Id:<% out.println(id); %> </h1>
	    <input type="hidden" name="id" value="<% out.println(id);%>">
	   
	        <div class="inbox">
	            <div class="flex">
	                <input type="text" placeholder="Enter Name" name="name">
	                <input type="text" placeholder="Enter Category" name="category">
	            </div>
	          	            <div class="flex">
	                <input type="number" placeholder="Enter Price" name="price">
	                <select name="active" class="active">
	                	<option>-- Active --</option>
	                	<option value="Yes">Yes</option>
	                	<option value="No">No</option>
	                </select>
	            </div>
	               <label for="image" style="margin-top:2rem; margin-left:160px; font-size:27px; font-weight:599;" >Select an image:</label><br>
	         
	           <br><br>
	            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="file" name="image" id="image" accept="image/*" required ></div>
	            
	            <br><br>
	            
	               
	          
	        </div>
	        <button class="save" style="margin-top:100px;" >Save</button>
	  </form>
	    </div>
	
</body>
</html>