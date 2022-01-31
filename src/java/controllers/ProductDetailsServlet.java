package controllers;

import dataHandlers.ProductDataHandler;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Cart;
import models.Product;

public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int productID = Integer.parseInt(request.getPathInfo().substring(1));
        
        ProductDataHandler pdh = ProductDataHandler.getInstance();
        Product product = pdh.getProduct(productID);
        request.setAttribute("product", product);
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/sites/productDetails.jsp");
        rd.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int productID = Integer.parseInt(request.getParameter("productID"));
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int qty = Integer.parseInt(request.getParameter("productQty"));       
        
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        
        cart.addCartItem(productID, productPrice, qty);
            
        session.setAttribute("cart", cart);
        
        response.setContentType("text/plain");
	response.getWriter().write("" + cart.getTotalItems());
    }

}
