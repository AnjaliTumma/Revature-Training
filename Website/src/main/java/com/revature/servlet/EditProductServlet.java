package com.revature.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.revature.service.EditProductService;

import java.io.File;
import java.io.IOException;

@WebServlet("/admin/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private EditProductService editProductService;

    public EditProductServlet() {
        super();
        editProductService = new EditProductService(); // Initialize the service
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String active = request.getParameter("active");
        String currentImagePath = request.getParameter("imagePath");

        // Handle image file upload
        Part imagePart = request.getPart("image"); // Get the image part
        String imageName = currentImagePath; // Default to the existing image

        if (imagePart != null && imagePart.getSize() > 0) { // If a new image is uploaded
            imageName = imagePart.getSubmittedFileName();

            // Define directory to save the uploaded image
            String uploadDir = getServletContext().getRealPath("") + File.separator + "product_images";
            File uploadDirectory = new File(uploadDir);
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdirs(); // Create directory if it doesn't exist
            }

            // Save the new image file
            String imagePath = uploadDir + File.separator + imageName;
            imagePart.write(imagePath);
        }

        // Update product details including the new or existing image path
        boolean isUpdated = editProductService.updateProduct(id, name, category, price, active, "product_images/" + imageName);

        if (isUpdated) {
            if ("No".equals(active)) {
                boolean isCartUpdated = editProductService.removeProductFromCart(id);
                if (isCartUpdated) {
                    response.sendRedirect("allproducteditproduct.jsp?msg=done");
                } else {
                    response.sendRedirect("allproducteditproduct.jsp?msg=error_cart");
                }
            } else {
                response.sendRedirect("allproducteditproduct.jsp?msg=done");
            }
        } else {
            response.sendRedirect("allproducteditproduct.jsp?msg=wrong");
        }
    }
}
