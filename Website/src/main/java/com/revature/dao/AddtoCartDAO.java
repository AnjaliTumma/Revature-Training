package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import project.ConnectionProvider;

public class AddtoCartDAO {

    public int getProductPriceById(String productId) throws Exception {
        int productPrice = 0;
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT price FROM product WHERE id='" + productId + "'");
        if (rs.next()) {
            productPrice = rs.getInt("price");
        }
        return productPrice;
    }

    public boolean isProductInCart(String productId, String email) throws Exception {
        boolean isInCart = false;
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM cart WHERE product_id='" + productId + "' AND email='" + email + "' AND address IS NULL");
        if (rs.next()) {
            isInCart = true;
        }
        return isInCart;
    }

    public void updateCart(String productId, String email, int cartTotal, int quantity) throws Exception {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        st.executeUpdate("UPDATE cart SET total='" + cartTotal + "', quantity='" + quantity + "' WHERE product_id='" + productId + "' AND email='" + email + "' AND address IS NULL");
    }

    public void addToCart(String email, String productId, int quantity, int productPrice, int productTotal) throws Exception {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("INSERT INTO cart(email, product_id, quantity, price, total) VALUES(?, ?, ?, ?, ?)");
        ps.setString(1, email);
        ps.setString(2, productId);
        ps.setInt(3, quantity);
        ps.setInt(4, productPrice);
        ps.setInt(5, productTotal);
        ps.executeUpdate();
    }

    public ResultSet getCartItem(String productId, String email) throws Exception {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        return st.executeQuery("SELECT * FROM cart WHERE product_id='" + productId + "' AND email='" + email + "' AND address IS NULL");
    }
}
