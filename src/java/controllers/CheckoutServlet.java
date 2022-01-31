package controllers;

import dataHandlers.OrderDataHandler;
import dataHandlers.ProductDataHandler;
import java.io.IOException;
import java.util.Date;
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
import models.Order;
import models.OrderProduct;
import models.User;

public class CheckoutServlet extends HttpServlet {
    
    private static final String REQUEST_METHOD_BUYER = "buyer";
    private static final String REQUEST_METHOD_PAYMENT = "payment";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/sites/checkout.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean success = false;
        
        String method = request.getParameter("data");
        
        switch (method) {
            case REQUEST_METHOD_BUYER:
                success = buyerFormSubmission(request);
                response.setContentType("text/plain");
                response.getWriter().write(String.valueOf(success));
                break;
            case REQUEST_METHOD_PAYMENT:
                paymentFormSubmission(request, response);
                break;
        }
       
    }

    private boolean buyerFormSubmission(HttpServletRequest request) {
        
        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String street = request.getParameter("street").trim();
        String zipCode = request.getParameter("zipCode").trim();
        String city = request.getParameter("city").trim();
        String country = request.getParameter("country").trim();
        String phoneNr = request.getParameter("phoneNr").trim();
        
        if (firstName.isEmpty() || lastName.isEmpty() || street.isEmpty() 
                || zipCode.isEmpty() || city.isEmpty() || country.isEmpty() 
                || phoneNr.isEmpty()) {
            
            return false;   
            
        }
        
        String fullAddress = firstName + " " + lastName + "," + street + "," + zipCode + " " + city + "," + country;
        Order order = new Order(fullAddress, phoneNr);

        HttpSession session = request.getSession();
        session.setAttribute("order", order);
        
        return true;
    }

    private void paymentFormSubmission(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String paymentMethod = request.getParameter("paymentMethod");
        
        HttpSession session = request.getSession();
        Order order = (Order)session.getAttribute("order");
        User user = (User)session.getAttribute("user");
        Cart cart = (Cart)session.getAttribute("cart"); 
        
        List<OrderProduct> orderProducts = new ArrayList<>();
        ProductDataHandler pdh = ProductDataHandler.getInstance();
        
        cart.getCartItems().forEach((item) -> {
            orderProducts.add(new OrderProduct(pdh.getProduct(item.getProductID()), item.getQty()));
        });
        
        order.setPaymentMethod(paymentMethod);
        order.setUser(user);
        order.setTotalPrice(cart.getTotalPrice());
        order.setOrderDate(new Date());
        
        OrderDataHandler odh = OrderDataHandler.getInstance();
        odh.insertOrder(order, orderProducts);
        
        session.removeAttribute("order");
        session.removeAttribute("cart");
        
        
        response.setHeader("cache-Control","no-cache,no-store,must-revalidate"); 
        response.setHeader("Pragma","no-cache");    
        response.setHeader("Expires","0");
        response.sendRedirect("/ComputerShop/pocetna");
    }

}
