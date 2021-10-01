package com.learn.myEcart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.learn.myEcart.Dao.CategoryDao;
import com.learn.myEcart.Dao.ProductDao;
import com.learn.myEcart.entities.Category;
import com.learn.myEcart.entities.Product;
import com.learn.myEcart.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@MultipartConfig
public class ProductOperation_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductOperation_Servlet() {
        // TODO Auto-generated constructor stub
    }

	
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
    	response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        
        	try {
        		
        		
        		//2 Servlets
        		//Add Category
        		//Add Products
        		 
        	String op=request.getParameter("operation");
        	if(op.trim().equals("AddCategory"))
        	{
        		//Add Category
        		String title=request.getParameter("catTitle");
        		String desc=request.getParameter("catDescription");
        		
        		
        		Category category=new Category();
        		category.setCategoryTitle(title);
        		category.setCategoryDescription(desc);
        		
        		CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
        		int catId=categoryDao.saveCategory(category);
//        		out.println("Category Saved ->"+catId);
        		
        		HttpSession httpSession=request.getSession();
        		httpSession.setAttribute("message", "Category Added Successfully id:-"+catId);
        		response.sendRedirect("admin.jsp");
        		return;
        	}
        	else if(op.trim().equals("AddProduct"));
        	 //Add product
        	
        	String pTitle=request.getParameter("pTitle");
        	String pDesc=request.getParameter("pDesc");
        	int pPrice=Integer.parseInt(request.getParameter("pPrice"));
        	int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
        	int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
        	int catId=Integer.parseInt(request.getParameter("catId"));
        	Part part=request.getPart("pPic");
        	
        	Product p=new Product();
        	p.setpTitle(pTitle);
        	p.setpDesc(pDesc);
        	p.setpPrice(pPrice);
        	p.setpDiscount(pDiscount);
        	p.setpQuantity(pQuantity);
        	p.setpPhoto(part.getSubmittedFileName());
        	
        	//get category by id
        	
        	CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
        	Category category=cdao.getCategoryById(catId);
        	
        	p.setCategory(category);
        	
        	// Product save
        	
        	
        	ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
        	pdao.saveProduct(p);
        	
        	
        	
        	try {
			
        	//pic upload
//        	find out the path to upload photo
        	String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
        	System.out.println(path);
        	
        	//Uploading code
        	
        	FileOutputStream fos=new FileOutputStream(path);
        	
        	InputStream is=part.getInputStream();
        	
//        	reading data
        	byte []data=new byte[is.available()];
        	 
        	is.read(data);
        	
        	//Writing the data
        	fos.write(data);
        	fos.close();
        	is.close();
        	
        	} catch (Exception e) {
        		e.printStackTrace();
        	}
        	
        	
        	out.println("Product save successfully..........");
        	HttpSession httpSession=request.getSession();
    		httpSession.setAttribute("message", "Product Added Successfully..");
    		response.sendRedirect("admin.jsp");
    		return;
        	
        	
        	}
        	
        	catch (Exception e) {
				// TODO: handle exception
        		e.printStackTrace();
			}
        	
        	
        	
        	
        } 
	}

}
