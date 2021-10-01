package com.learn.myEcart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.learn.myEcart.Dao.UserDao;
import com.learn.myEcart.entities.User;
import com.learn.myEcart.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login_Servlet() {
        // TODO Auto-generated constructor stub
    }

	
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
    	response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        
        	try {
        		
        		String email=request.getParameter("email");
        		String password=request.getParameter("password");
        		
        		//authentication
        		
        		UserDao userDao = new UserDao(FactoryProvider.getFactory());
        	 User user= userDao.getUserByNameAndPassword(email, password);
//        	 System.out.println(user);
        	 
        	 HttpSession httpSession=request.getSession();
        	 
        	 
        	 if(user==null)
        	 {
        		 httpSession.setAttribute("message","Invalid Details !! Try Again" );
        		 response.sendRedirect("login.jsp");
        		 return;
        	 }
        	 else {
        		 
        		 httpSession.setAttribute("current-user", user);
        		 if(user.getUserType().equals("admin"))
        		 {
        			 response.sendRedirect("admin.jsp");
        		 }
        		 else if(user.getUserType().equals("normal")){
        			 response.sendRedirect("index.jsp");
        		 }
        		 else {
        			 out.println("Invalid user type");
        		 }
        	 }
        	 
        	}
        	
        	catch (Exception e) {
				// TODO: handle exception
        		e.printStackTrace();
			}
        	
        	
        	
        	
        } 
	}

}
