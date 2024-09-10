package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project.ConnectionProvider;

public class LoginDAO {

    public boolean validateUser(String email, String password) {
        boolean isValidUser = false;
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            isValidUser = rs.next();
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this instead of printing
        }
        return isValidUser;
    }
}
