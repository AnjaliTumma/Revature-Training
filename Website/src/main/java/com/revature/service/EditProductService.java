package com.revature.service;

import com.revature.dao.EditProductDAO;

public class EditProductService {

    private EditProductDAO editProductDAO;

    public EditProductService() {
        editProductDAO = new EditProductDAO(); // Initialize the DAO
    }

    public boolean updateProduct(String id, String name, String category, String price, String active, String imagePath) {
        // Delegate the product update logic to the DAO
        return editProductDAO.updateProductDetails(id, name, category, price, active,imagePath);
    }

    public boolean removeProductFromCart(String productId) {
        // Delegate the logic to remove the product from the cart to the DAO
        return editProductDAO.deleteProductFromCart(productId);
    }
}
