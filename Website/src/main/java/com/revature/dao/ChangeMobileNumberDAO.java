package com.revature.dao;

import project.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ChangeMobileNumberDAO {

    public boolean validateUser(String email, String password) {
        boolean isValid = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            isValid = rs.next(); // True if user with the provided email and password exists
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public void updateMobileNumber(String email, String mobileNumber) {
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "UPDATE users SET mobilenumber = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, mobileNumber);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
