package com.revature.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.revature.entity.OrderEntity;
import com.revature.service.OrderService;
import com.revature.service.OrderServiceIMPL;


@WebServlet("/admin/OrdersReceivedServlet")
public class OrdersReceivedServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private OrderService orderService;

    public OrdersReceivedServlet() {
        this.orderService = new OrderServiceIMPL();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderEntity> orders = orderService.getOrders();
        request.setAttribute("orders", orders);
        
        String msg = request.getParameter("msg");
        if ("cancel".equals(msg)) {
            request.setAttribute("message", "Order Cancelled Successfully!");
        } else if ("delivered".equals(msg)) {
            request.setAttribute("message", "Successfully Updated!");
        } else if ("invalid".equals(msg)) {
            request.setAttribute("message", "Something went wrong! Try Again!");
        }
        
        request.getRequestDispatcher("ordersReceived.jsp").forward(request, response);
       
    }
}