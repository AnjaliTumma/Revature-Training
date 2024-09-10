package com.revature.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.revature.service.ChangeMobileNumberService;

import java.io.IOException;

@WebServlet("/admin/ChangeMobileNumberServlet")
public class ChangeMobileNumberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ChangeMobileNumberService changeMobileNumberService;

    public ChangeMobileNumberServlet() {
        super();
        this.changeMobileNumberService = new ChangeMobileNumberService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = session.getAttribute("email").toString();
        String mobileNumber = request.getParameter("mobilenumber");
        String password = request.getParameter("password");

        boolean isMobileNumberChanged = changeMobileNumberService.changeMobileNumber(email, password, mobileNumber);

        if (!isMobileNumberChanged) {
            response.sendRedirect("changemobilenumber.jsp?msg=wrong");
        } else {
            response.sendRedirect("changemobilenumber.jsp?msg=done");
        }
    }
}
