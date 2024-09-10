<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>SignUp Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/SignUp.css">
</head>
<body>
	 <div class="mbox">
            <div class="mbox1">
                <div class="Image1">
                    <img src="https://t4.ftcdn.net/jpg/02/32/16/07/360_F_232160763_FuTBWDd981tvYEJFXpFZtolm8l4ct0Nz.jpg">
                </div>
                <div class="SignUp">
                    <h1>Sign Up</h1>
                    <form action="RegisterServlet" method="POST">
	                    <input type="text" placeholder="Enter Name" name="name" required>
	                    <input type="email" placeholder="Enter Email" name="email" required>
	                    <input type="text" placeholder="Enter Mobile Number" name=" mobilenumber" required>
	                    <input type="password" placeholder="Enter Password" name="password" required>
	                    <input type="submit" value="SignUp">
	                    <a href="signin.jsp">Sign In</a>
	                </form>
                </div>
               <%
               	String msg=request.getParameter("msg");
               if("valid".equals(msg)){
                %>
                <h3 style="color: red;position: absolute; top: 1%; left: 35%; font-size: 30px;">Successfully Registered !</h3>
            	<%}%>   
                <%
                if("invalid".equals(msg))
                {
                %>
                <h3 style="color: red;position: absolute; top: 1%; left: 35%; font-size: 30px;">Some thing went wrong! Try Again !</h3>
                <%} %>
                
            </div>
        </div>
</body>
</html>