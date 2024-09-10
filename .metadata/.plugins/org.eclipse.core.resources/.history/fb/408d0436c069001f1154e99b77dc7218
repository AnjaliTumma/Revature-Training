package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.revature.entity.OrderEntity;

import project.ConnectionProvider;

public class OrderDAO {
    
    public List<OrderEntity> getOrders() {
    	
    	System.out.println("sss");
        List<OrderEntity> orders = new ArrayList<>();
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id WHERE cart.orderDate IS NOT NULL AND cart.status='processing'";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                OrderEntity order = new OrderEntity();
                order.setMobileNumber(rs.getString(10));
                order.setProductName(rs.getString(17));
                order.setQuantity(rs.getInt(3));
                order.setSubTotal(rs.getDouble(5));
                order.setAddress(rs.getString(6));
                order.setCity(rs.getString(7));
                order.setState(rs.getString(8));
                order.setCountry(rs.getString(9));
                order.setOrderDate(rs.getDate(11));
                order.setExpectedDeliveryDate(rs.getDate(12));
                order.setPaymentMethod(rs.getString(13));
                order.setTransactionId(rs.getString(14));
                order.setStatus(rs.getString(15));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}