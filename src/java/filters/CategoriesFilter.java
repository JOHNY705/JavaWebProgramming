package filters;

import dataHandlers.ProductCategoryDataHandler;
import java.io.IOException;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import models.ProductCategory;

public class CategoriesFilter implements Filter {
    
    private static List<ProductCategory> categoriesList;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }
   
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpSession session = ((HttpServletRequest)request).getSession();
        categoriesList = (List<ProductCategory>)session.getAttribute("categories");
        
        if (categoriesList == null) {
            ProductCategoryDataHandler pcdh = ProductCategoryDataHandler.getInstance();
            categoriesList = pcdh.getCategories();
            session.setAttribute("categories", categoriesList);
        }
        
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        
    }
}
