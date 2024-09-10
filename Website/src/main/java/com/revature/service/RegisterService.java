package com.revature.service;

import com.revature.dao.RegisterDAO;

public class RegisterService {

    private RegisterDAO registerDAO;

    public RegisterService() {
        registerDAO = new RegisterDAO(); // Initialize the DAO
    }

    public boolean registerUser(String name, String email, String mobilenumber, String password) {
        // Delegate the registration logic to the DAO
        return registerDAO.saveUser(name, email, mobilenumber, password);
    }
}
