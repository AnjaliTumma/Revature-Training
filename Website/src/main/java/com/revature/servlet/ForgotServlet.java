package com.revature.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.revature.service.ForgotService;

import java.io.IOException;

public class ForgotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ForgotService forgotService;

    public ForgotServlet() {
        super();
        forgotService = new ForgotService(); // Initialize the service
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newpassword");

        boolean isUpdated = forgotService.updatePassword(email, newPassword);

        if (isUpdated) {
            response.sendRedirect("forgotpass.jsp?msg=done");
        } else {
            response.sendRedirect("forgotpass.jsp?msg=invalid");
        }
    }
}
