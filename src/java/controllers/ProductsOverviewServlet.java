package controllers;

import dataHandlers.ProductDataHandler;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;
        
public class ProductsOverviewServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String category = request.getPathInfo().substring(1);
        
        ProductDataHandler pdh = ProductDataHandler.getInstance();
        List<Product> productsList;
        
        if (category.trim().isEmpty()) {
            productsList = pdh.getProducts();
        } else {
            productsList = pdh.getProducts(category);
        }

        request.setAttribute("productsList", productsList);
        
        if (category.trim().isEmpty()) {
            request.setAttribute("reqCategory", null);
        } else {
            request.setAttribute("reqCategory", category);
        }
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/sites/productsOverview.jsp");
        rd.forward(request, response);
        
    }

}
