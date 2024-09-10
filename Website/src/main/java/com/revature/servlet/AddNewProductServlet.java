package com.revature.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.revature.service.AddNewProductService;

import java.io.File;
import java.io.IOException;
@MultipartConfig
@WebServlet("/admin/AddNewProductServlet")
public class AddNewProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AddNewProductService addNewProductService;

    public AddNewProductServlet() {
        super();
        addNewProductService = new AddNewProductService(); // Initialize the service
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
        Part imagePart = request.getPart("image");
        String imageName = imagePart.getSubmittedFileName();

        // Define a directory to save the uploaded image
        String uploadDir = getServletContext().getRealPath("") + File.separator + "product_images";
        File uploadDirectory = new File(uploadDir);
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdirs();
        }

        // Save the image file
        String imagePath = uploadDir + File.separator + imageName;
        imagePart.write(imagePath);

        // Save product details including image path
        boolean isProductAdded = addNewProductService.addProduct(id, name, category, price, active, "product_images/" + imageName);


        if (isProductAdded) {
            response.sendRedirect("addnewproduct.jsp?msg=done");
        } else {
            response.sendRedirect("addnewproduct.jsp?msg=wrong");
        }
    }
}