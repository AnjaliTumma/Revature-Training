package com.revature.service;

import com.revature.dao.LoginDAO;

public class LoginService {

    private LoginDAO loginDAO;

    public LoginService() {
        loginDAO = new LoginDAO(); // Initialize the DAO
    }

    public boolean authenticateUser(String email, String password) {
        // Delegates the authentication logic to the DAO
        return loginDAO.validateUser(email, password);
    }
}
