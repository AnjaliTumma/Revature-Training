<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Received Page</title>
	<link rel="stylesheet" type="text/css" href="../CSS/allproducteditproduct.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

</head>
<body>

       
    
<div class="title">
	<h1>Message Received</h1>
		<table>
			<thead>
				<tr>	
					<th>ID</th>
					<th>EMAIL</th>
					<th>SUBJECT</th>
					<th>BODY</th>
					
				</tr>
			</thead>
			<tbody>
			<%
			try{ 
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from message");
				while(rs.next())
				{
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
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