<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Login Page</title>
 <link rel="stylesheet" type="text/css" href="CSS/SignIn.css">
</head>
<body>
	 <div class="box">
            <div class="box1">
                <div class="Image">
                    <img src="https://img.freepik.com/premium-photo/cartoon-character-man-standing-cash-register-generative-ai_561855-57064.jpg" alt="SignUp Image">
                </div>
                <div class="SignIn">
                	<form action="LoginServlet" method="POST">
	                    <h1>Sign In</h1>
	                    <input type="text" placeholder="Enter Email" name="email">
	                    <input type="password" placeholder="Enter Password" name="password">
	                     <a href="forgotpass.jsp">Forgot Password</a>
	                    <input type="submit" value="Login">
	                    <a href="signup.jsp">Create an account</a>
	                 </form>
                </div>
                <%
                	String msg=request.getParameter("msg");
                	if("notexist".equals(msg))
                	{
                %>
                 	<h3 style="color: red;position: absolute; top: 1%; left: 35%; font-size: 30px;">Incorrect Name or Password</h3>
                <%
                	}
                %>
                <%
                	if("invalid".equals(msg))
                	{
                %>
                	<h3 style="color: red;position: absolute; top: 1%; left: 35%; font-size: 25px;">Some thing went wrong! Try Again !</h3>
                <%
                	}
                %>
                
            </div>
        </div>
</body>
</html>