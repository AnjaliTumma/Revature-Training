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
if("notPossible".equals(msg)){
%>
    <div class="nbox">
        <div class="content">
                <h1 style="text-align:center; color:red; margin-top:4%;">There is only one Quantity! So click on remove!</h1>
                <% } %>
                <%
                if("inc".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;"> Quantity Increased Successfully!</h1>
                <%} %>
                 <%
                if("dec".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;">Quantity Decreased Successfully!</h1>
                <%} %>
                <%
                if("removed".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;">Product Successfully Removed!</h1>
                <%} %>
        </div>
    
<div class="title">
	<h1>My Cart</h1>
		<table>
			<thead>
				<tr>	
					<th>SR.NO</th>
					<th>PRODUCT NAME</th>
					<th>CATEGORY</th>
					<th>PRICE</th>
					<th>QUANTITY</th>
					<th>SUB TOTAL</th>
					<th>Remove<i class="fa-solid fa-xmark" ></i></th>
					
				</tr>
			</thead>
			<tbody>
			<%
			int total=0;
			int sno=0;
			try{ 
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL ");
				while(rs1.next())
				{
					total=rs1.getInt(1);
				}
			%>
				
				
				<tr style=" position: absolute; top:28.5%; ">
					<th style="width:200px; text-align:center; background-color:black; color:white;">TOTAL:&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-indian-rupee-sign"></i><%out.println(total);%></th>
					<%if(total>0){ %><th style="width:250px;font-size:17px; text-align:center;"><a href="addressPaymentForOrder.jsp" style="text-decoration:none">PROCEED TO ORDER</a></th><% } %>
				</tr>
		
			</tbody>
			<%
			ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL ");
			while(rs.next()){
			
			%>
			<tr>
			<%sno=sno+1; %>
			<td><%out.println(sno); %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><i class="fa-solid fa-indian-rupee-sign">&nbsp;</i><%=rs.getString(4) %></td>
			<td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class="fa-solid fa-circle-plus"></i></a><%=rs.getString(9) %><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class="fa-solid fa-circle-minus"></i></a></td>
			<td><i class="fa-solid fa-indian-rupee-sign"></i>&nbsp;<%=rs.getString(10) %></td>
			<td><a href="removefromcart.jsp?id=<%=rs.getString(1)%>">Remove</a></td>
			</tr>
			<%}}
			catch(Exception e){
				
			}
			%>
			
		</table>
</div>
</div> 
</body>
</html>