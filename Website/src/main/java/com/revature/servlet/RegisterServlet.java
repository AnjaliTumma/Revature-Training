package com.revature.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.revature.service.RegisterService;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RegisterService registerService;

    public RegisterServlet() {
        super();
        registerService = new RegisterService(); // Initialize the service
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobilenumber = request.getParameter("mobilenumber");
        String password = request.getParameter("password");

        boolean isRegistered = registerService.registerUser(name, email, mobilenumber, password);

        if (isRegistered) {
            response.sendRedirect("signup.jsp?msg=valid");
        } else {
            response.sendRedirect("signup.jsp?msg=invalid");
        }
    }
}
