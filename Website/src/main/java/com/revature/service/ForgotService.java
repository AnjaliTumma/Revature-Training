package com.revature.service;

import com.revature.dao.ForgotDAO;

public class ForgotService {

    private ForgotDAO forgotDAO;

    public ForgotService() {
        forgotDAO = new ForgotDAO(); // Initialize the DAO
    }

    public boolean updatePassword(String email, String newPassword) {
        // Delegate the update logic to the DAO
        return forgotDAO.updateUserPassword(email, newPassword);
    }
}
