<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products and Edit Products Page</title>
	<link rel="stylesheet" type="text/css" href="CSS/allproducteditproduct.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

</head>
<body>

    <div class="nbox">
        <div class="content">
              
        </div>
    
<div class="title">
	<h1>Search</h1>
		<table>
			<thead>
				<tr>	
					<th>ID</th>
					<th>NAME</th>
					<th>CATEGORY</th>
					<th>PRICE</th>
					<th>ADD TO CART</th>
				</tr>
			</thead>
			<tbody>
			<%
			int z=0;
			try{ 
				String search=request.getParameter("search");
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes' ");
				while(rs.next())
				{
					z=1; 
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>	
					<td><%=rs.getString(4) %></td>	
					<td><a href="addtocartAction.jsp?id=<%=rs.getString(1) %>">Add to cart</a><i class="fa-regular fa-pen-to-square"></i></td>
				</tr>
				<%}} 
				catch(Exception e){
					System.out.println(e);
				}%>
			</tbody>
		</table>
		<%if(z==0){%>
		<h1 style="color:red; text-align:center; font-size:30px; ">Nothing to Show</h1>
		<%} %>
</div>
</div> 
</body>
</html>