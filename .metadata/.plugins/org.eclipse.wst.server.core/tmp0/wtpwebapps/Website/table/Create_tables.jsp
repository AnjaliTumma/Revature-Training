<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users(id int AUTO_INCREMENT primary key,name varchar(100), email varchar(100),mobilenumber int, password varchar(100))";
	String q2="create table product(id int, name varchar(500),category varchar(200),price int,active varchar(10))";
	String q3="create table cart (email varchar(100),product_id int, quantity int, price int ,total int, address varchar(500), city varchar(100), state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100), delivery varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10 ))";
	String q4="create table message(id int  AUTO_INCREMENT  primary key ,email varchar(100),subject varchar(200),body varchar(1000))";
	
	System.out.print(q1);
	System.out.print(q2);
	System.out.print(q3);
	System.out.print(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
	System.out.print("Table Created");
	con.close();
}
catch(Exception e){
	System.out.println(e)  ;
}
%>