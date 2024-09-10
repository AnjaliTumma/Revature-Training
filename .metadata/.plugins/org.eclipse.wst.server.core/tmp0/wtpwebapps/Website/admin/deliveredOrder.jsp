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
if("cancel".equals(msg)){
%>
    <div class="nbox">
        <div class="content">
                <h1 style="text-align:center; color:red; margin-top:1%;">Order Cancel Successfully</h1>
                <% } %>
                 <%
                if("delivered".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;">Successfully Updated</h1>
                <%} %>
                <%
                if("invalid".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;">Some thing went wrong! Try Again!</h1>
                <%} %>
        </div>
    
<div class="title">
	<h1>Delivered Orders</h1>
		<table style="border:2px solid black">
			<thead >
				<tr >	
					<th>Mobile Number</th>
					<th>Product Name</th>
					<th>Quantity</th>
					<th>Sub Total</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Country</th>
					<th>Order Date</th>
					<th>Expected Delivery Date</th>
					<th>Payment Method</th>
					<th>T-Id</th>
					<th>Status</th>
					
					
				</tr>
			</thead>
			<tbody>
			<%
			try{ 
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not  NULL and cart.status='Delivered'");
				
				while(rs.next())
				{
			%>
				<tr>
					<td><%=rs.getString(10) %></td>
					<td><%=rs.getString(17) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
					<td><%=rs.getString(9) %></td>
					<td><%=rs.getString(11) %></td>
					<td><%=rs.getString(12) %></td>
					<td><%=rs.getString(13) %></td>
					<td><%=rs.getString(14) %></td>
					<td><%=rs.getString(15) %></td>
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