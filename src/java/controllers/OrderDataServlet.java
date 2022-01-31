package controllers;

import dataHandlers.OrderDataHandler;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;

public class OrderDataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int orderID = Integer.parseInt(request.getParameter("id"));
        
        OrderDataHandler odh = OrderDataHandler.getInstance();
        Order order = odh.getOrder(orderID);
        
        request.setAttribute("orderData", order);
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/components/orderDetails.jsp");
        rd.forward(request, response);
    }
}
