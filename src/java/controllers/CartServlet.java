package controllers;

import dataHandlers.ProductDataHandler;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Cart;
import models.CartItemData;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        
        List<CartItemData> cartProducts = new ArrayList<>();
        ProductDataHandler pdh = ProductDataHandler.getInstance();
       
        cart.getCartItems().forEach((item) -> {
            cartProducts.add(new CartItemData(pdh.getProduct(item.getProductID()), item.getQty()));
        });
        
        request.setAttribute("cartProducts", cartProducts);
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/sites/cart.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int productID = Integer.parseInt(request.getParameter("id"));       
        String action = request.getParameter("action");       
        
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        
        cart.updateCartItem(productID, action, 1);
            
        session.setAttribute("cart", cart);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String method = request.getParameter("method");
        
        switch (method) {
            case "all":
                clearCart(request);
                break;
            case "single":
                removeSingleProduct(request);
                break;
        }
    }

    private void clearCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        
        cart.clear();
            
        session.setAttribute("cart", cart);
    }

    private void removeSingleProduct(HttpServletRequest request) {
        int productID = Integer.parseInt(request.getParameter("id"));       
        
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        
        cart.removeCartItem(productID);
            
        session.setAttribute("cart", cart);
    }

    
}
