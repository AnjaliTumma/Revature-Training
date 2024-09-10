<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill</title>
<link rel="stylesheet" type="text/css" href="CSS/bill.css">
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try{
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select  sum(total) from cart where email='"+email+"' and status='bill' ");
	while(rs.next()){
		total=rs.getInt(1);
		
	}
	ResultSet rs2=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill' ");
	while(rs2.next())
	{

%>
<h1>Online Shopping Bill</h1>
<hr>
<div class="bbox">
	
	<div class="b1">
		<div class="b11">
				<p>Name:<%=rs2.getString(2) %></p>
				<p>Mobile Number:<%=rs2.getString(19) %></p>
				<p>Email:<%=rs2.getString(10) %></p>
				
				
		</div>
	</div>
	<div class="b1">
		<div class="b11">
				<p>Order Date: <%=rs2.getString(20) %></p>
				<p>Expected Delivery: <%=rs2.getString(21) %></p>
				<p>Payment Method:<%=rs2.getString(22) %></p>
		</div>
	</div>
	<div class="b1">
		<div class="b11">
				<p>Transaction Id: <%=rs2.getString(23) %></p>
				<p>Address:<%=rs2.getString(15) %></p>
				<p>City:<%=rs2.getString(16) %></p>
		</div>
	</div>
	<div class="b1">
		<div class="b11">
				<p>State:<%=rs2.getString(17) %></p>
				<p></p>
				<p>Country:<%=rs2.getString(18) %></p>
		</div>
	</div>
<%break;} %>
</div>
<table>
	<h3>Product Details</h3>
	<tr>	
		<th>Sr.NO</th>
		<th>Product </th>
		<th>Category</th>
		<th>PRICE</th>
		<th>Quantity</th>
		<th>Sub Total</th>
	</tr>
	<%
	ResultSet rs1=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+ email+"' and cart.status='bill' ");
	while(rs1.next()){
		sno=sno+1;
	%>
	<tr>
		<td><%out.println(sno); %></td>
		<td><%=rs1.getString(17) %></td>
		<td><%=rs1.getString(18) %></td>
		<td><%=rs1.getString(19) %></td>
		<td><%=rs1.getString(3) %></td>
		<td><%=rs1.getString(5) %></td>
	</tr>
	<% } %>
</table>
<div class="bbox">
	<h1>Total: <%out.println(total); %></h1>
	<div class="b1">
		<div class="b11">
				<a href="continueShopping.jsp"><button style="margin-left: 20rem;">Continue Shopping</button></a>
				<a onclick="window.print();"><button>Print</button></a>
		</div>
	</div>
</div>
<%}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>