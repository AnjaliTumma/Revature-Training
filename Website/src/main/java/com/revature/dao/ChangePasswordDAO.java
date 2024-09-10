package com.revature.dao;

import project.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ChangePasswordDAO {

    public boolean checkOldPassword(String email, String oldPassword) {
        boolean isValid = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, oldPassword);
            ResultSet rs = ps.executeQuery();
            isValid = rs.next(); // True if old password matches
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public void updatePassword(String email, String newPassword) {
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "UPDATE users SET password = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
