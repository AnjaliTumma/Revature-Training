<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products and Edit Products Page</title>
	<link rel="stylesheet" type="text/css" href="../CSS/allproducteditproduct.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

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
    
<div class="title">
	<h1>All Product & Edit Products</h1>
		<table>
			<thead>
				<tr>	
					<th>ID</th>
					<th>NAME</th>
					<th>CATEGORY</th>
					<th>PRICE</th>
					<th>STATUS</th>
					<th>Image</th>
					<th>EDIT<i class="fa-regular fa-pen-to-square"></i></th>
				</tr>
			</thead>
			<tbody>
			<%
			try{ 
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from product");
				while(rs.next())
				{
					String imagePath = rs.getString("imagePath"); // Assuming this column contains the image filename
	                String imageUrl = request.getContextPath() + "/images/" + imagePath;
					
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					 <td>
				
                    <img src="<%= imageUrl %>" alt="Product Image" width="100" height="100"/>
				

                     </td>
					<td><a href="editproduct.jsp?id=<%=rs.getString(1) %>">EDIT</a><i class="fa-regular fa-pen-to-square"></i></td>
				</tr>
				<%}} 
				catch(Exception e){
					System.out.println(e);
				}%>
			</tbody>
			
		</table>
</div>
</div> 
</body>
</html>