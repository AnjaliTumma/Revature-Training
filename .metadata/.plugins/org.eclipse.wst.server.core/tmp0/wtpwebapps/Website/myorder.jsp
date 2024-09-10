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
	<h1>My Orders</h1>
		<table>
			<thead>
				<tr>	
					<th>Sr.No</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Sub Total</th>
					<th>Order Date</th>
					<th>Expected Delivery Date</th>
					<th>Payment Method</th>
					<th>STATUS</th>
				</tr>
			</thead>
			<tbody>
			<%
			int sno=0;
			try{ 
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
				while(rs.next())
				{
					sno=sno+1;
			%>
				<tr>
					<td><%out.println(sno); %></td>
					<td><%=rs.getString(17) %></td>
					<td><%=rs.getString(18) %></td>
					<td><i class="fa-solid fa-indian-rupee-sign">&nbsp;</i><%=rs.getString(19) %></td>
					<td><%=rs.getString(3) %></td>
					<td><i class="fa-solid fa-indian-rupee-sign">&nbsp;</i><%=rs.getString(5) %></td>
					<td><%=rs.getString(11) %></td>
					<td><%=rs.getString(12) %></td>
					<td><%=rs.getString(13) %></td>
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