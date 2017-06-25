package com.dao;

import java.sql.Connection;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.*;

import com.connection.ConnectionFactory;
import com.mysql.jdbc.Statement;
import com.beans.Category;
import com.beans.customer;

public class MainDao {
	
	public static Connection connection = null;
	public static PreparedStatement ptmt = null, ptmt1 = null,ptmt2 = null,ptmt3 = null;
	public static ResultSet resultSet = null;
	
	public static final String DATE_FORMAT_NOW = "yyyy-MM-dd";
	public static final String TIME_FORMAT_NOW = "HH:mm:ss";
	
	public static String Datenow() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		return sdf.format(cal.getTime());
		}
	public static String Timenow() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(TIME_FORMAT_NOW);
		return sdf.format(cal.getTime());

		}

	private static Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory.getInstance().getConnection();
		return conn;
	}
	
	public static boolean login(String email, String password) {
		String email1 = null;
		String password1 = null;
		try {
			String queryString = "SELECT * FROM customer where customerEmail='"
					+ email + "'";
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			
			resultSet = ptmt.executeQuery();
			if (resultSet.next()) {
				System.out.println("user exist");
				password1 = resultSet.getString("customerPassword");
				email1 = resultSet.getString("customerEmail");
			}
			System.out.println(password);
			System.out.println(password1);
			System.out.println(email);
			System.out.println(email1);
			if ( email.equalsIgnoreCase(email1) && password.equalsIgnoreCase(password1) ) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean register(String fname,String lname, String email, String phone,String address,
			String state, String city, String zip, String password) {
		try {
			String queryString = "insert into customer(customerFname,customerLname,customerPhone,customerEmail,customerAddress,customerZip,customerState,customerCity,customerPassword,type) values(?,?,?,?,?,?,?,?,?,?)";
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			ptmt.setString(1, fname);
			ptmt.setString(2, lname);
			ptmt.setString(3, phone);
			ptmt.setString(4, email);
			ptmt.setString(5, "address");
			ptmt.setInt(6, Integer.parseInt(zip));
			ptmt.setString(7, state);
			ptmt.setString(8, city);
			ptmt.setString(9, password);
			ptmt.setString(10, "C");
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static customer findCustomer(String email) {
		customer customer = new customer();
		try {
			String queryString = "SELECT * FROM customer where customerEmail='"
					+ email + "'";
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			resultSet = ptmt.executeQuery();
			while (resultSet.next()) {

				customer.setFname(resultSet.getString("customerFname"));
				customer.setLname(resultSet.getString("customerLname"));
				customer.setEmail(resultSet.getString("customerEmail"));
				customer.setPassword(resultSet.getString("customerPassword"));
				customer.setCity(resultSet.getString("customerCity"));
				customer.setState(resultSet.getString("customerState"));
				customer.setPhone(resultSet.getString("customerPhone"));
				customer.setZip(resultSet.getString("customerZip"));
				customer.setId(resultSet.getInt("customerId"));
				customer.setAddress(resultSet.getString("customerAddress"));
				customer.setType(resultSet.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return customer;
	}
	
	public static Category getCategories() {
		Category category = new Category();
		try {
			String queryString = "SELECT * FROM category";
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			resultSet = ptmt.executeQuery();
			while (resultSet.next()) {
				category.getCategories().add(
						resultSet.getString("categoryName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return category;

	}
	
	public static boolean review(String name,String email,String review , int pId) {
		try {
			String queryString = "insert into review(pId,reviewerName,reviewerEmail,review,reviewTime,reviewDate) values(?,?,?,?,?,?)";
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			ptmt.setInt(1, pId);
			ptmt.setString(2, name);
			ptmt.setString(3, email);
			ptmt.setString(4, review);
			ptmt.setString(5,Timenow());
			ptmt.setString(6,Datenow());
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean addToCart(int uId,int pId,int quantity) {
		try {
			String queryString = "insert into cart(customerId,productId,quantity,addTime,addDate) values(?,?,?,?,?)";
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			ptmt.setInt(1,uId);
			ptmt.setInt(2, pId);
			ptmt.setInt(3, quantity);
			ptmt.setString(4,Timenow());
			ptmt.setString(5,Datenow());
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean addToBrand(String bName,int quantity) {
		try {
			String queryString = "insert into brand(brandName,numberOfProducts) values(?,?)";
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			ptmt.setString(1,bName);
			ptmt.setInt(2, quantity);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean deleteBrand(int bId) {
		try {
			String queryString = "delete from brand where brandId = " + bId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean deleteUser(int uId) {
		try {
			String queryString = "delete from customer where  customerId = " + uId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean deleteReview(int rId) {
		try {
			String queryString = "delete from review where  rId = " + rId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean addProduct(String productName,String modelNumber,float mPrice,float sPrice,
			String brand,String os,int ram,int rom,float cSpeed,int expandable,String nType,
			float screenSize,String pType,int sim,float rCamera,float fCamera,int cores,String fm,
			String wifi,String bluetooth,String gprs,String usb,String flash){
		try {
			String queryString = "INSERT INTO product(productName,ModelNumber,MarketPrice,SellingPrice,brand,OS,RAM,ROM,clockSpeed,expandable,netorkType,screenSize,phoneType,simType,rearCamera,frontCamera,cores,fm,wifi,bluethooth,GPRS,USB,FLASH,addDate,addTime) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			ptmt.setString(1,productName);
			ptmt.setString(2,modelNumber);
			ptmt.setFloat(3,mPrice);
			ptmt.setFloat(4,sPrice);
			ptmt.setString(5,brand);
			ptmt.setString(6,os);
			ptmt.setInt(7,ram);
			ptmt.setInt(8,rom);
			ptmt.setFloat(9,cSpeed);
			ptmt.setInt(10,expandable);
			ptmt.setString(11,nType);
			ptmt.setFloat(12,screenSize);
			ptmt.setString(13,pType);
			ptmt.setInt(14,sim);
			ptmt.setFloat(15,rCamera);
			ptmt.setFloat(16,fCamera);
			ptmt.setInt(17,cores);
			ptmt.setString(18,fm);
			ptmt.setString(19,wifi);
			ptmt.setString(20,bluetooth);
			ptmt.setString(21,gprs);
			ptmt.setString(22,usb);
			ptmt.setString(23,flash);
			ptmt.setString(24,Datenow());
			ptmt.setString(25,Timenow());
			System.out.println(queryString);			
			int k = ptmt.executeUpdate();
			if (k == 1) {
				java.sql.Statement st = connection.createStatement();
				String BrandQuery = "select * from brand where brandName = '"+brand+"';";
				ResultSet rs = st.executeQuery(BrandQuery); // this is for name
				rs.first();
				int numberOfItems = rs.getInt("numberOfProducts");
				numberOfItems++;
				String updateBranditems = "update brand set numberOfProducts = " + numberOfItems + " where brandName = '"+brand+"';";
				ptmt1 = connection.prepareStatement(updateBranditems);
				ptmt1.executeUpdate();
				System.out.println(updateBranditems);
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean deleteFromCart(int cId) {
		try {
			String queryString = "delete from cart where  cId = " + cId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	public static boolean deleteProduct(int pId,String brand) {
		try {
			String queryString = "delete from product where  productId = " + pId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				java.sql.Statement st = connection.createStatement();
				String BrandQuery = "select * from brand where brandName = '"+brand+"';";
				ResultSet rs = st.executeQuery(BrandQuery); // this is for name
				rs.first();
				int numberOfItems = rs.getInt("numberOfProducts");
				numberOfItems--;
				String updateBranditems = "update brand set numberOfProducts = " + numberOfItems + " where brandName = '"+brand+"';";
				ptmt1 = connection.prepareStatement(updateBranditems);
				ptmt1.executeUpdate();
				System.out.println(updateBranditems);
				
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean updateCart(int cId,int quantity) {
		try {
			String queryString = "update cart set quantity = " + quantity +" where  cId = " + cId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	public static boolean updateCustomer(int uId,String fname,String lname , String address,String city,String state,String zip) {
		try {
			String queryString = "update customer set customerFname = '" + fname +"',customerLname='"+lname+"',customerAddress='"+address+"',customerCity='"+city+"',customerState='"+state+"',customerZip="+zip+" where  customerId = " + uId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	public static boolean changeDeliveryStatus(int oId,String status) {
		try {
			String queryString = "update customer_order set delivery_status ='"+ status +"'  where  orderId = " + oId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	public static boolean changePaymentStatus(int oId,String status) {
		try {
			String queryString = "update customer_order set payment_status ='"+ status +"'  where  orderId = " + oId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	public static boolean cancleOrder(int oId) {
		try {
			String queryString = "delete from customer_order where orderId = " + oId ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			if (k == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}	
	
	
	public static boolean placeOrder(int uId,String deliveryAddress,float total) {
		try {
			String queryString = "insert into customer_order(customerId,deliveryAddress,order_total,payment_status,delivery_status,addTime,addDate)values(?,?,?,?,?,?,?)" ;
			connection = getConnection();
			ptmt = connection.prepareStatement(queryString);
			ptmt.setInt(1,uId);
			ptmt.setString(2,deliveryAddress);
			ptmt.setFloat(3, total);
			ptmt.setString(4,"due");
			ptmt.setString(5,"not delivered");
			ptmt.setString(6,Timenow());
			ptmt.setString(7,Datenow());
			System.out.println(queryString);
			int k = ptmt.executeUpdate();
			int j = 0,i=0;
			String queryString1 = "select * from customer_order where customerId = "+ uId + " AND delivery_status = 'not delivered' ";
			ptmt1 = connection.prepareStatement(queryString1);
			ResultSet orderIdSet = ptmt1.executeQuery();
			orderIdSet.next();
			String queryString2 = "select * from cart where customerId = "+ uId ;
			ptmt2 = connection.prepareStatement(queryString2);
			ResultSet productSet = ptmt2.executeQuery();
			
			while(productSet.next()){
				String insertIntoOrderDetail = "insert into order_detail(orderId,productId,quantity) value(?,?,?)";
				ptmt3 = connection.prepareStatement(insertIntoOrderDetail);
				ptmt3.setInt(1, orderIdSet.getInt(1));
				ptmt3.setInt(2, productSet.getInt(3));
				ptmt3.setInt(3, orderIdSet.getInt(4));
				j = ptmt3.executeUpdate();
			}
			ptmt.close();
			String removeFromCart = "delete from cart where customerId = "+ uId;
			ptmt  = connection.prepareStatement(removeFromCart);
			i = ptmt.executeUpdate();
			
			if (k == 1 && j == 1 && i == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (ptmt != null)
					ptmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return false;

	}


}
