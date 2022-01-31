package controllers;

import dataHandlers.OrderDataHandler;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;

public class AdminUserOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        OrderDataHandler odh = OrderDataHandler.getInstance();
        List<Order> orderList = odh.getOrders();
        request.setAttribute("ordersData", orderList);
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/sites/adminUserOrders.jsp");
        rd.forward(request, response);
    }
}
