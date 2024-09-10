package com.revature.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.revature.service.ChangePasswordService;

import java.io.IOException;

@WebServlet("/admin/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ChangePasswordService changePasswordService;

    public ChangePasswordServlet() {
        super();
        this.changePasswordService = new ChangePasswordService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = session.getAttribute("email").toString();
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        boolean isPasswordChanged = changePasswordService.changePassword(email, oldPassword, newPassword, confirmPassword);

        if (!isPasswordChanged) {
            response.sendRedirect("changepassword.jsp?msg=wrong");
        } else {
            response.sendRedirect("changepassword.jsp?msg=done");
        }
    }
}