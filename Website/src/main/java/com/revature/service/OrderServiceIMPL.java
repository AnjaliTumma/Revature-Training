package com.revature.service;

import java.util.List;

import com.revature.dao.OrderDAO;
import com.revature.entity.OrderEntity;

public class OrderServiceIMPL implements OrderService{

	private OrderDAO orderDAO;

    public OrderServiceIMPL() {
        this.orderDAO = new OrderDAO();
    }

    @Override
    public List<OrderEntity> getOrders() {
        return orderDAO.getOrders();
    }
}