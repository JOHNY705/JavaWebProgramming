package controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet {

    private String productImageDir;
    
    public void init() throws ServletException {
        this.productImageDir = "/ComputerShop/static/resources/images/products";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String requestedImg = request.getPathInfo();
        
        File img = new File(productImageDir, URLDecoder.decode(requestedImg, "UTF-8"));
        
        ServletContext context = request.getServletContext();
        
        response.setContentType("image/jpg");
        response.setContentLength((int)img.length());
        
        FileInputStream in = new FileInputStream(img);
        OutputStream out = response.getOutputStream();
        
        byte[] buff = new byte[1024];
        int count = 0;
        while ((count = in.read(buff)) >= 0) {
         out.write(buff, 0, count); 
        }
        
        out.close();
        in.close();
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }

}
