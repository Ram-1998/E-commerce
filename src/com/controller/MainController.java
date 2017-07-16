package com.controller;

import java.io.*;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;

import com.beans.Category;
import com.beans.customer;
import com.dao.MainDao;

import sun.java2d.loops.FillPath;

/**
 * Servlet implementation class MainController
 */
@WebServlet(description = "Main Controller", urlPatterns = { "/MainController" })
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private File file;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String key = request.getParameter("key");
		
		if (key.equals("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			boolean val = MainDao.login(email, password);

			if (val) {
				customer customer = MainDao.findCustomer(email);
				request.getSession().setAttribute("customerFname", customer.getFname());
				request.getSession().setAttribute("customer", customer);
				request.getSession().setAttribute("customerId",customer.getId());
				request.getSession().setAttribute("customerType",customer.getType());
				response.sendRedirect("index.jsp");
			} else{
				out.print("<html><body>No");
				request.setAttribute("loginerror", "* invalid username or password");
		    	request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}
		}

		// registeration
		if (key.equals("register")) {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String password = request.getParameter("password");
			

			boolean val = MainDao.register(fname,lname,email,phone,address,state,city,zip, password);
			if (val) {
				customer customer = MainDao.findCustomer(email);
				request.getSession().setAttribute("customerFname", customer.getFname());
				request.getSession().setAttribute("customer", customer);
				request.getSession().setAttribute("customerId",customer.getId());
				response.sendRedirect("index.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else{
				out.print("<html><body>No");
				request.setAttribute("registererror", "* Username already exist ! please user different username.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		if (key.equals("review")) {
			String name = request.getParameter("rName");
			String email = request.getParameter("rEmail");
			String review = request.getParameter("review");
			int pId = Integer.parseInt(request.getParameter("pId"));
			boolean val = MainDao.review(name,email,review,pId);
			if (val) {
				response.sendRedirect("index.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		
		if (key.equals("addToCart")) {
			
			if(request.getSession().getAttribute("customerId") == null) {
				response.sendRedirect("login.jsp");
			}
			else{
			int uId = (int) request.getSession().getAttribute("customerId");
			int pId = Integer.parseInt(request.getParameter("pId"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			boolean val = MainDao.addToCart(uId,pId,quantity);
			if (val) {
				response.sendRedirect("cart.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
			}
		}
		
		if (key.equals("addBrand")) {
			String bName = request.getParameter("bName");
			int quantity = Integer.parseInt(request.getParameter("itemNumber"));
			boolean val = MainDao.addToBrand(bName,quantity);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		
		if (key.equals("deleteBrand")) {
			int bId = Integer.parseInt(request.getParameter("bId"));
			boolean val = MainDao.deleteBrand(bId);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		
		if (key.equals("deleteuser")) {
			int uId = Integer.parseInt(request.getParameter("uId"));
			boolean val = MainDao.deleteUser(uId);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		
		if (key.equals("deleteReview")) {
			int rId = Integer.parseInt(request.getParameter("rId"));
			boolean val = MainDao.deleteReview(rId);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		if (key.equals("deleteProduct")) {
			int pId = Integer.parseInt(request.getParameter("pId"));
			String brand = request.getParameter("brand");
			boolean val = MainDao.deleteProduct(pId, brand);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		if (key.equals("addProduct")) {
			String pname = request.getParameter("pname");
			String modelNo = request.getParameter("modelNo");
			float mPrice = Float.parseFloat(request.getParameter("mPrice"));
			float sPrice = Float.parseFloat(request.getParameter("sPrice"));
			String brand = request.getParameter("brand");
			String os = request.getParameter("os");
			int ram = Integer.parseInt(request.getParameter("ram"));
			int rom = Integer.parseInt(request.getParameter("rom"));
			float cSpeed = Float.parseFloat(request.getParameter("cSpeed"));
			int expandable = Integer.parseInt(request.getParameter("expandable"));
			String networkType = request.getParameter("networkType");
			float screenSize = Float.parseFloat(request.getParameter("screenSize"));
			String phoneType = request.getParameter("phoneType");
			int SimType = Integer.parseInt(request.getParameter("SimType"));
			float rCamera = Float.parseFloat(request.getParameter("rCamera"));
			float fCamera = Float.parseFloat(request.getParameter("fCamera"));
			int cores = Integer.parseInt(request.getParameter("cores"));
			String fm = request.getParameter("fm");
			String wifi = request.getParameter("wifi");
			String bluetooth = request.getParameter("bluetooth");
			String gprs = request.getParameter("gprs");
			String usb = request.getParameter("usb");
			String flash = request.getParameter("flash");
			
			
			
			
			boolean val = MainDao.addProduct(pname,modelNo,mPrice,sPrice,brand,os,ram,rom,cSpeed,expandable,networkType,screenSize,phoneType,SimType,rCamera,fCamera,cores,fm,wifi,bluetooth,gprs,usb,flash);
			if (val) {
			/*  boolean isMultipart;
				final String UPLOAD_DIRECTORY = "upload";
				final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
				final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
				final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

				isMultipart = ServletFileUpload.isMultipartContent(request);
				response.setContentType("text/html");
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(MAX_FILE_SIZE);
				factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
				ServletFileUpload upload = new ServletFileUpload((FileItemFactory) factory);
				upload.setFileSizeMax(MAX_FILE_SIZE);
				upload.setSizeMax(MAX_REQUEST_SIZE);
				
				String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
				
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
				    uploadDir.mkdir();
				}
				
				try{
					List fileItems = upload.parseRequest(request);
					Iterator i = fileItems.iterator();
					while(i.hasNext()){
						FileItem item = (FileItem) i.next();
						if(!item.isFormField()){
						String fieldName = item.getFieldName();
						String fileName= item.getName();
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						item.write(storeFile);	
						out.println("file uploaded");	
						
						}
					}
				}
				catch(Exception e){
					out.println(e);
				}
				
				
				response.sendRedirect("adminMain.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
				response.sendRedirect("adminMain.jsp");
			} else
				out.print("<html><body>No");
		}
		
		if (key.equals("logout")) {
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
	
		}
		
		if (key.equals("updateCart")) {
			int cId = Integer.parseInt(request.getParameter("cId"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			boolean val = MainDao.updateCart(cId,quantity);
			if (val) {
				response.sendRedirect("cart.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		
		if (key.equals("deleteFromCart")) {
			int cId = Integer.parseInt(request.getParameter("cId"));
			boolean val = MainDao.deleteFromCart(cId);
			if (val) {
				response.sendRedirect("cart.jsp");
				/* request.getSession().putValue(name,username); */
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		
		if (key.equals("placeorder")) {
			int uId = (int)request.getSession().getAttribute("customerId");
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String deliveryAddress = fullname + " , " + address + " , " + city + " , " + state + " , " + zip + ".";
			float orderTotal = (float)request.getSession().getAttribute("GrandTotal");
			
			if(orderTotal == 100){
				out.print("<html><body>No");
				request.setAttribute("checkouterror", "* no item in cart");
		    	request.getRequestDispatcher("checkout.jsp").forward(request, response);				
			}
			else{
			
			boolean val = MainDao.placeOrder(uId,deliveryAddress,orderTotal);
			if (val) {
				response.sendRedirect("cart.jsp");
				
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
			}
		}
		
		if (key.equals("updateCustomer")) {
			int uId = (int)request.getSession().getAttribute("customerId");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			boolean val = MainDao.updateCustomer(uId,fname,lname,address,city,state,zip);
			if (val) {
				response.sendRedirect("account.jsp");
				
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		if (key.equals("changeDeliveryStatus")) {
			int oId = Integer.parseInt(request.getParameter("oId"));
			String status = request.getParameter("delivery");
			boolean val = MainDao.changeDeliveryStatus(oId,status);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		if (key.equals("changePaymentStatus")) {
			int oId = Integer.parseInt(request.getParameter("oId"));
			String status = request.getParameter("payment");
			boolean val = MainDao.changePaymentStatus(oId,status);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		if (key.equals("cancleOrder")) {
			int oId = Integer.parseInt(request.getParameter("oId"));
			String status = request.getParameter("payment");
			boolean val = MainDao.cancleOrder(oId);
			if (val) {
				response.sendRedirect("adminMain.jsp");
				
				out.print("<html><body>Okay");
			} else
				out.print("<html><body>No");
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
