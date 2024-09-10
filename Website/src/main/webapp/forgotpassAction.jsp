<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	String email=request.getParameter("email");
	String newpassword=request.getParameter("newpassword");
	
	int check=0;
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("Select * from users where email='"+email+"' ");
		while(rs.next()){
			check=1;
			st.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"' ");
			response.sendRedirect("forgotpass.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("forgotpass.jsp?msg=invalid");
		}
	}catch(Exception e){
		System.out.println(e);
	}
%>