package com.revature.service;

import java.util.List;

import com.revature.entity.OrderEntity;

public interface OrderService {
	List<OrderEntity> getOrders();
}