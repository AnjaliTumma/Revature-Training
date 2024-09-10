package com.revature.service;

import com.revature.dao.ChangeMobileNumberDAO;

public class ChangeMobileNumberService {

    private ChangeMobileNumberDAO changeMobileNumberDAO;

    public ChangeMobileNumberService() {
        this.changeMobileNumberDAO = new ChangeMobileNumberDAO();
    }

    public boolean changeMobileNumber(String email, String password, String newMobileNumber) {
        boolean isUserValid = changeMobileNumberDAO.validateUser(email, password);
        if (isUserValid) {
            changeMobileNumberDAO.updateMobileNumber(email, newMobileNumber);
            return true; // Mobile number changed successfully
        } else {
            return false; // Invalid email or password
        }
    }
}
