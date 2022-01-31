package controllers;

import dataHandlers.AuthenticationLogsDataHandler;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.AuthenticationLog;

public class AdminUserLogsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        AuthenticationLogsDataHandler aldh = AuthenticationLogsDataHandler.getInstance();
        List<AuthenticationLog> authLogs = aldh.getLogs(); 
        request.setAttribute("userAuthLogs", authLogs);
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/sites/adminUserLogs.jsp");
        rd.forward(request, response);
        
    }

}
