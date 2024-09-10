<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>
<link rel="stylesheet" type="text/css" href="CSS/addresspayment.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"  />

<script>
	if(window.history.forward(1)!=null)
		window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
	<thead>
	<%
		String email=session.getAttribute("email").toString();
		int total=0;
		int sno=0;
		String address="";
		String city="";
		String state="";
		String country="";
		try{ 
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL ");
			while(rs1.next())
			{
				total=rs1.getInt(1);
			}
	%>
		<tr>
			<th><a href="mycart.jsp" style="text-align:center;  margin-top:0px; color:black; cursor:pointer; magin-left:50px;text-decoration:none; font-size:27px"><i class="fa-solid fa-backward"></i>&nbsp;Back</a></th>
			<th style="background-color:black; color:white">Total:<%out.println(total); %></th>
		</tr>	
	</thead>
	<thead>
		<tr >
			<td  style="background-color:lightblue;">Sr.No</td>
			<td  style="background-color:lightblue;">Product Name</td>
			<td  style="background-color:lightblue;">Category</td>
			<td  style="background-color:lightblue;">Price</td>
			<td  style="background-color:lightblue;">Quantity</td>
			<td  style="background-color:lightblue;">Sub Total</td>
		</tr>
	</thead>
	<tbody>
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
			<td><%=rs.getString(8) %></td>
			<td><i class="fa-solid fa-indian-rupee-sign">&nbsp;</i><%=rs.getString(10) %></td>
			
		</tr>
		<%
		}
		ResultSet rs2=st.executeQuery("select * from users where email='"+email+"' ");
		while(rs2.next()){		
			
		%>
	</tbody>
</table>
<hr>
<form action="addressPaymentForOrderAction.jsp" method="post">
	<div class="addbox">
		<div class="addflex">
			<div class="addflex1">
				<h1>Enter Address</h1>
				<input type="text" name="address" placeholder="Enter Address" value="<%=rs2.getString("address") %>" required>
			</div>
			<div class="addflex1">
				<h1>Enter City </h1>
				<input type="text" name="city" placeholder="Enter City"  value="<%=rs2.getString("city") %>" required>
			</div>
		</div>
		<div class="addflex">
			<div class="addflex1">
				<h1>Enter State</h1>
				<input type="text" name="state" placeholder="Enter State" value="<%=rs2.getString("state") %>" required>
			</div>
			<div class="addflex1">
				<h1>Enter Country</h1>
				<input type="text" name="country" placeholder="Enter Country" value="<%=rs2.getString("country") %>" required>
			</div>
		</div>
		<h3>If there is no address its means that you did not set you address! </h3>
		<h3>This address will also updated to your profile</h3>
	</div>
	<div class="addbox">
		<div class="addflex">
			<div class="addflex1">
				<h1>Select Way Of Payment</h1>
				<select name="paymentMethod">
					<option value="Cash On Delivery">Cash On Delivery</option>
					<option value="Online Payment">Online Payment</option>
				</select>
			</div>
			<div class="addflex1">
				<h1>Pay online on this abc@ybl</h1>
				<input type="text" name="transactionId" placeholder="Enter transactionId">
				<h3>If you select online payment then enter your transaction ID here otherwise leave this blank</h3>
			</div>
		</div>
		<div class="addflex">
			<div class="addflex1">
				<h1>Mobile Number</h1>
				<input type="number" name="mobilenumber" placeholder="Enter Mobile" required>
				<h3>This mobile number will also updated to your profile</h3>
			</div>
			<div class="addflex1">
				<h3 style="margin-top: 10rem;">If you enter wrong transaction id then your order will we can cancel!</h3>
				<button type="submit">Procced to Generate Bill & Save </button>
				<h3>Fill Form correctly</h3>
			</div>
		</div>
		</div>

</form>
<%
		}
		}catch(Exception e){
			System.out.println(e);
		}
%>
</body>
</html>