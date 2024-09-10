package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import project.ConnectionProvider;

public class AddNewProductDAO {

    public boolean saveProduct(String id, String name, String category, String price, String active, String imagePath) {
        boolean isSaved = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "INSERT INTO product (id, name, category, price, active,imagePath) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, category);
            ps.setString(4, price);
            ps.setString(5, active);
            ps.setString(6, imagePath);
            int rowsAffected = ps.executeUpdate();
            isSaved = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the exception
        }
        return isSaved;
    }
}
