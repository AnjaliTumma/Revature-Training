<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.revature.entity.OrderEntity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
table {
    width: 100%;
    border-collapse: collapse; /* Ensure borders are collapsed into a single line */
}

th, td {
    border: 1px solid #1e1e1c; /* Light grey border for cells */
    padding: 8px; /* Padding inside cells */
    text-align: left; /* Align text to the left */
}

th {
    background-color: #f2f2f2; /* Light grey background for table headers */
    color: #333; /* Darker text color for headers */
}

tr:nth-child(even) {
    background-color: #c1b7be; /* Alternating row colors */
}

tr:hover {
    background-color: #f5748f; /* Highlight row on hover */
}
.th-style
{ width: 25%;}
</style>
</head>
<body style=" background-image: url('orderimg.jpg');background-size: cover; background-repeat: no-repeat; width: 100%; height:auto">


<div  style="color: #010101; text-align: center; font-size: 30px;">Orders Received <i class="fa fa-first-order" aria-hidden="true"></i></div>



<%
String message = (String) request.getAttribute("message");
if (message != null) {
%>
<h3 class="alert"><%= message %></h3>
<% } %>

<table id="customers">
    <tr>
        <th>Mobile Number</th>
        <th scope="col">Product Name</th>
        <th scope="col">Quantity</th>
        <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Country</th>
        <th scope="col">Order Date</th>
        <th scope="col">Expected Delivery Date</th>
        <th scope="col">Payment Method</th>
        <th scope="col">T-ID</th>
        <th scope="col">Status</th>
        <th scope="col">Cancel Order <i class='fas fa-window-close'></i></th>
        <th scope="col">Order Delivered <i class="fa fa-first-order" aria-hidden="true"></i></th>
    </tr>

<%
List<OrderEntity> orders = (List<OrderEntity>) request.getAttribute("orders");
if (orders != null) {
    for (OrderEntity order : orders) {
%>

    <tr>
        <td><%= order.getMobileNumber() %></td>
        <td><%= order.getProductName() %></td>
        <td><%= order.getQuantity() %></td>
        <td><i class="fa fa-inr"></i> <%= order.getSubTotal() %>  </td>
        <td><%= order.getAddress() %></td>
        <td><%= order.getCity() %></td>
        <td><%= order.getState() %></td>
        <td><%= order.getCountry() %></td>
        <td><%= order.getOrderDate() %></td>
        <td><%= order.getExpectedDeliveryDate() %></td>
        <td><%= order.getPaymentMethod() %></td>
        <td><%= order.getTransactionId() %></td>
        <td><%= order.getStatus() %></td>
        <td><a href="cancelOrdersAction.jsp?id=<%= order.getTransactionId() %>&email=<%= order.getMobileNumber() %>">Cancel <i class='fas fa-window-close'></i></a></td>
        <td><a href="deliveredOrdersAction.jsp?id=<%= order.getTransactionId() %>&email=<%= order.getMobileNumber() %>">Delivered <i class='fas fa-dolly'></i></a></td>
    </tr>
<%
    }
}
%>
</table>
      <br>
      <br>
      <br>

</body>
</html>