/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.26
 * Generated at: 2024-09-03 06:54:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import project.ConnectionProvider;
import java.sql.*;

public final class searchHome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/header.jsp", Long.valueOf(1725345276677L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(6);
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(2);
    _jspx_imports_classes.add("project.ConnectionProvider");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write(" 	<title>User Home  Page</title>\r\n");
      out.write("	<link rel=\"stylesheet\" href=\"CSS/adminHeader.css\">\r\n");
      out.write("	<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css\"  />\r\n");
      out.write("	\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"abox\">\r\n");
 String email=session.getAttribute("email").toString(); 
      out.write("\r\n");
      out.write("		<div class=\"aheader\">\r\n");
      out.write("			<div class=\"nav\">\r\n");
      out.write("					<h2 style=\"margin-top:15px\"><a href=\"\">");
out.println(email); 
      out.write("\r\n");
      out.write("					</a></h2>\r\n");
      out.write("				</div>\r\n");
      out.write("			<div class=\"nav\">\r\n");
      out.write("				<a href=\"home.jsp\">Home\r\n");
      out.write("				<i class=\"fa-solid fa-house\"></i></a>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"nav\">\r\n");
      out.write("				<a href=\"mycart.jsp\">My<br> Cart\r\n");
      out.write("				<i class=\"fa-solid fa-cart-plus\"></i></a>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"nav\">\r\n");
      out.write("				<a href=\"myorder.jsp\">My<br> Orders\r\n");
      out.write("				<i class=\"fa-solid fa-folder\"></i></a>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"nav\">\r\n");
      out.write("				<a href=\"changedetails.jsp\">Change<br> Details\r\n");
      out.write("				<i class=\"fa-solid fa-pen-to-square\"></i></a>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"nav\">\r\n");
      out.write("				<a href=\"messageus.jsp\">Message<br> Us\r\n");
      out.write("				<i class=\"fa-solid fa-message\"></i></a>\r\n");
      out.write("			</div>\r\n");
      out.write("		\r\n");
      out.write("			<div class=\"nav\">\r\n");
      out.write("				<a href=\"logout.jsp\">Logout\r\n");
      out.write("				<i class=\"fa-solid fa-right-from-bracket\"></i></a>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"nav1\">\r\n");
      out.write("			\r\n");
      out.write("			<form  action=\"searchHome.jsp\" method=\"POST\">\r\n");
      out.write("				<input type=\"text\" placeholder=\"Search\" name=\"search\" style=\"width:150px; margin-top:12px; margin-right:30px; height:30px;\">\r\n");
      out.write("				<button type=\"submit\" style=\" position: absolute; top:2%; left:96%\"><i class=\"fa-solid fa-magnifying-glass\" style=\"font-size:20px; height:30px;\" ></i></button>\r\n");
      out.write("			</form>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>All Products and Edit Products Page</title>\r\n");
      out.write("	<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/allproducteditproduct.css\">\r\n");
      out.write("	<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css\" />\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"nbox\">\r\n");
      out.write("        <div class=\"content\">\r\n");
      out.write("              \r\n");
      out.write("        </div>\r\n");
      out.write("    \r\n");
      out.write("<div class=\"title\">\r\n");
      out.write("	<h1>Search</h1>\r\n");
      out.write("		<table>\r\n");
      out.write("			<thead>\r\n");
      out.write("				<tr>	\r\n");
      out.write("					<th>ID</th>\r\n");
      out.write("					<th>NAME</th>\r\n");
      out.write("					<th>CATEGORY</th>\r\n");
      out.write("					<th>PRICE</th>\r\n");
      out.write("					<th>ADD TO CART</th>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</thead>\r\n");
      out.write("			<tbody>\r\n");
      out.write("			");

			int z=0;
			try{ 
				String search=request.getParameter("search");
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes' ");
				while(rs.next())
				{
					z=1; 
			
      out.write("\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td>");
      out.print(rs.getString(1) );
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print(rs.getString(2) );
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print(rs.getString(3) );
      out.write("</td>	\r\n");
      out.write("					<td>");
      out.print(rs.getString(4) );
      out.write("</td>	\r\n");
      out.write("					<td><a href=\"addtocartAction.jsp?id=");
      out.print(rs.getString(1) );
      out.write("\">Add to cart</a><i class=\"fa-regular fa-pen-to-square\"></i></td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				");
}} 
				catch(Exception e){
					System.out.println(e);
				}
      out.write("\r\n");
      out.write("			</tbody>\r\n");
      out.write("		</table>\r\n");
      out.write("		");
if(z==0){
      out.write("\r\n");
      out.write("		<h1 style=\"color:red; text-align:center; font-size:30px; \">Nothing to Show</h1>\r\n");
      out.write("		");
} 
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</div> \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}