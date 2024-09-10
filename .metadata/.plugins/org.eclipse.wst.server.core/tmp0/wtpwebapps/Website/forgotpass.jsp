<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Page</title>
 <link rel="stylesheet" type="text/css" href="CSS/SignIn.css">
</head>
<body>
		<div class="box">
            <div class="box1">
                <div class="Image">
                    <img src="https://img.freepik.com/premium-photo/cartoon-character-man-standing-cash-register-generative-ai_561855-57064.jpg" alt="SignUp Image">
                </div>
                <div class="SignIn">
                	<form action="ForgotServlet" method="POST">
	                    <h1 style="margin-left:100px"> Forgot Password</h1>
	                    <input type="text" placeholder="Enter Email" name="email">
	                    <input type="password" placeholder="Enter Password" name="newpassword">
	                    <input type="submit" value="Save">
	                    <a href="LoginServlet">Login</a>
	                 </form>
                </div>
                <%
                	String msg=request.getParameter("msg");
                	if("done".equals(msg)){
               %>
               <h3 style="color: red;position: absolute; top: 0%; left: 35%; font-size: 30px;">Password Changed Successfully!</h3>
                <% } %>
               <%
               		if("invalid".equals(msg)){
                %>
                <h3 style="color: red;position: absolute; top: 0%; left: 25%; font-size: 30px;">Some thing Went Wrong! Try Again!</h3>
                <% } %>
                
               </div>
           </div>
</body>
</html>