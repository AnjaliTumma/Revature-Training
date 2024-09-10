package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project.ConnectionProvider;

public class ForgotDAO {

    public boolean updateUserPassword(String email, String newPassword) {
        boolean isUpdated = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String selectQuery = "SELECT * FROM users WHERE email = ?";
            PreparedStatement psSelect = con.prepareStatement(selectQuery);
            psSelect.setString(1, email);
            ResultSet rs = psSelect.executeQuery();

            if (rs.next()) {
                String updateQuery = "UPDATE users SET password = ? WHERE email = ?";
                PreparedStatement psUpdate = con.prepareStatement(updateQuery);
                psUpdate.setString(1, newPassword);
                psUpdate.setString(2, email);
                int rowsAffected = psUpdate.executeUpdate();
                isUpdated = rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this instead of printing
        }
        return isUpdated;
    }
}
