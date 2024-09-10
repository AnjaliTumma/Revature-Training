package com.revature.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.revature.service.AddtoCartService;

@WebServlet("/admin/AddtoCartServlet")
public class AddtoCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AddtoCartService addtoCartService = new AddtoCartService();

    
    
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doPost(req, resp);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String productId = request.getParameter("id");

        try {
            addtoCartService.addProductToCart(email, productId);
            response.sendRedirect("home.jsp?msg=added");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp?msg=error");
        }
    }
}
