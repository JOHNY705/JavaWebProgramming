package filters;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

public class AuthFilter implements Filter {
    
    private static final List<String> authReqList = Arrays.asList("/ComputerShop/checkout", "/ComputerShop/povijest");
    private static final List<String> adminPages = Arrays.asList("/ComputerShop/admin/userLogs", "/ComputerShop/admin/userOrders");
    private static final List<String> mutualPages = Arrays.asList("/ComputerShop/prijava", "/ComputerShop/odjava", "/ComputerShop/img", "/ComputerShop/order");
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        
        String reqUri = req.getRequestURI();
        System.out.println("");
        
        
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        
        if (!reqUri.equals("/ComputerShop/unauthorized.jsp") && !reqUri.contains("img") && !reqUri.contains("static")) {
            if (user == null) {
                if (authReqList.contains(reqUri) || adminPages.contains(reqUri)) {
                    resp.sendRedirect("/ComputerShop/prijava"); 
                    return;
                }
            } else {
                switch (user.getRole()) {
                    case ("user"):
                        if (adminPages.contains(reqUri)) {
                            resp.sendRedirect("/ComputerShop/unauthorized.jsp");
                            return;
                        }
                        break;
                    case ("admin"):
                        if (!adminPages.contains(reqUri) && !mutualPages.contains(reqUri)) {
                            resp.sendRedirect("/ComputerShop/unauthorized.jsp");
                            return;
                        }
                        break;
                }
            }
        }
        
        chain.doFilter(request, response);
              
    }

    @Override
    public void destroy() {
        
    }
   
}
