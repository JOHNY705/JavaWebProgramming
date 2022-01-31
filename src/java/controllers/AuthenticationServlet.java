package controllers;

import dataHandlers.AuthDataHandler;
import dataHandlers.AuthenticationLogsDataHandler;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;


public class AuthenticationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        
        if (request.getQueryString() != null) {
            path = String.format("%s?%s", path, request.getQueryString());
        }
        
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/WEB-INF/sites/login.jsp");
        
        switch (path) {
            case "/odjava":
                request.getSession().removeAttribute("user");
                response.sendRedirect("/ComputerShop/pocetna");
                break;
            case "/prijava?error":
                request.setAttribute("loginError", "Neispravno korisničko ime ili lozinka!");                
            case "/prijava":                
                rd.forward(request, response);
        }
                       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       
        
        AuthDataHandler adh = AuthDataHandler.getInstance();
        User user = adh.login(username, password);
        
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        
        String uri = (String) request.getAttribute("javax.servlet.forward.request_uri");
        if (uri == null) {
            uri = request.getRequestURL().toString();
        }
        
        System.out.println(uri);
        
        if (user != null) {
            if (user.getRole().equals("user")) {
                
                String localIP = request.getRemoteAddr();
                
                AuthenticationLogsDataHandler aldh = AuthenticationLogsDataHandler.getInstance();
                aldh.insertLog(user, localIP);
                
                response.sendRedirect("/ComputerShop/pocetna");
            } else if (user.getRole().equals("admin")) {
                response.sendRedirect("/ComputerShop/admin/userLogs");
            }
        } else {
            response.sendRedirect("prijava?error");
        }
        
    }

}
