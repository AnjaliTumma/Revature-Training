package com.revature.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.revature.service.LoginService;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private LoginService loginService;

    public LoginServlet() {
        super();
        loginService = new LoginService(); // Initialize the service
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        // Check for admin login
        if ("admin@gmail.com".equals(email) && "Admin".equals(password)) {
            session.setAttribute("email", email);
            response.sendRedirect("admin/adminHome.jsp");
        } else {
            // Check user credentials
            boolean isAuthenticated = loginService.authenticateUser(email, password);
            if (isAuthenticated) {
                session.setAttribute("email", email);
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("signin.jsp?msg=notexist");
            }
        }
    }
}
