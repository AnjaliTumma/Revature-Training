<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        .container{
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 2rem 5rem;
        }
        .product-card{
            width: 300px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin: 1rem;
            padding: 1rem;
            text-align: center;
            background-color: #f9f9f9;
            transition: transform 0.3s ease;
            cursor:pointer;
        }
        .product-card img{
            width: 100%;
            height: 200px;
            object-fit: container;
        }
        .product-card h3, .product-card h4, .product-card h5{
            margin: 0.5rem 0;
        }
        .product-card .btn{
            width: 100%;
            height: 40px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .product-card .btn:hover{
            background-color: #0056b3;
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .h1{
        text-align:center;
        color:red;
        margin-bottom:1rem;
        }
    </style>
</head>
<body>

<%	
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
    <div class="nbox">
        <div class="content">
                <h1 style="text-align:center; color:red; margin-top:4%;">Product Added Successfully</h1>
                <% } %>
                <%
                if("exist".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;">Product already exist in your cart! Quantity increased!</h1>
                <%} %>
                 <%
                if("invalid".equals(msg)){
                %>
                <h1 style="text-align:center; color:red;">Some thing went wrong! Try Again!</h1>
                <%} %>
        </div>

<div class="container">

    <%
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM product");
        while (rs.next()) {
            String imagePath = rs.getString("imagePath");
            String imageUrl = request.getContextPath() + "/images/" + imagePath;
    %>
        <div class="product-card">
            <img src="<%= imageUrl %>" alt="Product Image">
            <h3><%= rs.getString("name") %></h3>
            <h4>Category: <%= rs.getString("category") %></h4>
            <h5>Price: $<%= rs.getString("price") %></h5>
            <a href="AddtoCartServlet?id=<%= rs.getString("id") %>">
                <button class="btn">Add to Cart</button>
            </a>
        </div>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</div>

</body>
</html>
