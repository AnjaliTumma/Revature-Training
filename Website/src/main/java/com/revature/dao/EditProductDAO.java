package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;


import project.ConnectionProvider;

public class EditProductDAO {

    public boolean updateProductDetails(String id, String name, String category, String price, String active, String imagePath) {
    	
    	boolean isUpdated = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String updateQuery = "UPDATE product SET name=?, category=?, price=?, active=?, imagePath=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setString(3, price);
            ps.setString(4, active);
            ps.setString(5, id);
            ps.setString(6, imagePath);
            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the exception
        }
        return isUpdated;
    }

    public boolean deleteProductFromCart(String productId) {
        boolean isDeleted = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String deleteQuery = "DELETE FROM cart WHERE product_id=? AND address IS NULL";
            PreparedStatement ps = con.prepareStatement(deleteQuery);
            ps.setString(1, productId);
            int rowsAffected = ps.executeUpdate();
            isDeleted = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the exception
        }
        return isDeleted;
    }
}