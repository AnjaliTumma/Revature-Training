package com.revature.service;

import com.revature.dao.ChangePasswordDAO;

public class ChangePasswordService {

    private ChangePasswordDAO changePasswordDAO;

    public ChangePasswordService() {
        this.changePasswordDAO = new ChangePasswordDAO();
    }

    public boolean changePassword(String email, String oldPassword, String newPassword, String confirmPassword) {
        if (!newPassword.equals(confirmPassword)) {
            return false; // New and confirm passwords don't match
        }

        boolean isOldPasswordCorrect = changePasswordDAO.checkOldPassword(email, oldPassword);
        if (isOldPasswordCorrect) {
            changePasswordDAO.updatePassword(email, newPassword);
            return true; // Password changed successfully
        } else {
            return false; // Old password is incorrect
        }
    }
}
