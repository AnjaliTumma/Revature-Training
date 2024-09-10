package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import project.ConnectionProvider;

public class RegisterDAO {

    public boolean saveUser(String name, String email, String mobilenumber, String password) {
        boolean isSuccess = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "INSERT INTO users (name, email, mobilenumber, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobilenumber);
            ps.setString(4, password);
            int rowsAffected = ps.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the exception
        }
        return isSuccess;
    }
}
