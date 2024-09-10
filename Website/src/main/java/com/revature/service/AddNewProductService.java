package com.revature.service;

import com.revature.dao.AddNewProductDAO;

public class AddNewProductService {

    private AddNewProductDAO addNewProductDAO;

    public AddNewProductService() {
        addNewProductDAO = new AddNewProductDAO(); // Initialize the DAO
    }

    public boolean addProduct(String id, String name, String category, String price, String active, String imagePath) {
        // Delegate the add product logic to the DAO
        return addNewProductDAO.saveProduct(id, name, category, price, active, imagePath);
    }
}
