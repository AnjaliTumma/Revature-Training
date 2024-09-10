package com.revature.service;

import java.sql.ResultSet;

import com.revature.dao.AddtoCartDAO;

public class AddtoCartService {

    private AddtoCartDAO addtoCartDAO = new AddtoCartDAO();

    public void addProductToCart(String email, String productId) throws Exception {
        int quantity = 1;
        int productPrice = addtoCartDAO.getProductPriceById(productId);
        int productTotal = productPrice;
        int cartTotal = 0;

        boolean isInCart = addtoCartDAO.isProductInCart(productId, email);
        if (isInCart) {
            ResultSet rs = addtoCartDAO.getCartItem(productId, email);
            if (rs.next()) {
                cartTotal = rs.getInt("total") + productTotal;
                quantity = rs.getInt("quantity") + 1;
            }
            addtoCartDAO.updateCart(productId, email, cartTotal, quantity);
        } else {
            addtoCartDAO.addToCart(email, productId, quantity, productPrice, productTotal);
        }
    }
}
