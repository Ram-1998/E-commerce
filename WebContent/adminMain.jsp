<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page import="com.connection.*"%>
<%@page import="com.beans.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>	
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-9 padding-right">				
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#brands" data-toggle="tab">Brands</a></li>
								<li><a href="#products" data-toggle="tab">Products</a></li>
								<li><a href="#users" data-toggle="tab">users</a></li>
								<li><a href="#reviews" data-toggle="tab">reviews</a></li>
								<li><a href="#orders" data-toggle="tab">orders</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="brands" >
									
										<h2>Brands</h2>
										<div class="col-sm-12">	
												<p><b>Add New Brand</b></p>									
												<form action="MainController" method="post">
													<span>
														<input type="text" placeholder="Brand Name" name="bName">
														<input type="number" placeholder="Current number of items" name="itemNumber">
													</span>
													<input type="hidden" name="key" value="addBrand">
													<input type="submit" value="Add" class="button btn btn-default pull-right">
												</form>
										</div>
										<div class="brands-name">
											<table>
												<tr>
													<th>Brand</th>
													<th>No of items</th>
												</tr>
												<%
													ArrayList <Brand> brandList = new ArrayList<Brand>();
													Class.forName("com.mysql.jdbc.Driver");
													Connection con = ConnectionFactory.getInstance().getConnection();
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery("select * from brand;"); // this is for name
													while (rs.next()) {
													Brand b=new Brand();
													b.setId(rs.getInt(1));
													b.setName(rs.getString(2));
													b.setNoOfItems(rs.getInt(3));
													brandList.add(b);
													}
													rs.close();
													st.close();
													for (int i = 0; i < brandList.size(); i++) {
												%>
												<tr class="brand-loop">													
													<td><%=brandList.get(i).getName()%></td>
													<td><%=brandList.get(i).getNoOfItems()%></td>
													<td><form action="MainController" method="post">
															<input type="hidden" name="bId" value="<%=brandList.get(i).getId()%>">
															<input type="hidden" name="key" value="deleteBrand">
															<input type="submit" value="Delete" class="button btn btn-default pull-right">
													</form></td>
												</tr>	
												<%} %>	
																			
											</table>
										</div><!--/brands_products-->
							</div>
							
							<div class="tab-pane fade" id="products" >
							
									<div class="col-sm-12">	
												<p><b>Add New Product</b></p>									
												<form action="MainController" method="post">
													
														<input type="text" placeholder="Product Name" name="pname">
														<input type="text" placeholder="Model number" name="modelNo">
														<input type="number" placeholder="Market Price" name="mPrice">
														<input type="number" placeholder="Selling price" name="sPrice">
														<select name="brand">
															<option value="">-Brand-</option>
															<%for(int i = 0; i < brandList.size(); i++) { %>
														    <option value="<%=brandList.get(i).getName()%>"><%=brandList.get(i).getName()%></option>
														    <%}%>
														</select>
														<select name="os">
															<option value="">-OS-</option>
															 <option value="android">Android</option>
															 <option value="windows">Windows</option>
															 <option value="ios">ios</option>
															 <option value="blackberry">Blackberry</option>
															 <option value="linux">Linux</option>
														</select>
														<select name="ram">
															<option value="">-RAM-</option>
															 <option value="1">1GB</option>
															 <option value="2">2GB</option>
															 <option value="3">3GB</option>
															 <option value="4">4GB</option>
															 <option value="5">5GB</option>
															 <option value="6">6GB</option>
														</select>
														<select name="rom">
															<option value="">-ROM-</option>
															 <option value="1">1GB</option>
															 <option value="2">2GB</option>
															 <option value="4">4GB</option>
															 <option value="8">8GB</option>
															 <option value="16">16GB</option>
															 <option value="32">32GB</option>
															 <option value="64">64GB</option>
															 <option value="128">128GB</option>
														</select>
														<input type="text" placeholder="Clock Speed" name="cSpeed"> - in GHz
														<select name="expandable">
															<option value="">-Expandable Upto-</option>
															 <option value="32">32GB</option>
															 <option value="64">64GB</option>
															 <option value="128">128GB</option>
															 <option value="256">256GB</option>
															 <option value="512">512GB</option>
														</select>
														<select name="networkType">
															<option value="">-Network Type-</option>
															 <option value="2G">2G</option>
															 <option value="3G">3G</option>
															 <option value="4G">4G</option>
															 <option value="4G VOLTE">4G VOLTE</option>
														</select>
														<input type="text" placeholder="Screen Size" name="screenSize"> - inch
														<select name="phoneType">
															<option value="">-Phone Type-</option>
															 <option value="Smart Phone">Smart Phone</option>
															 <option value="Featured Phone">Featured Phone</option>
														</select>
														<select name="SimType">
															<option value="">-Sim Type-</option>
															 <option value="1">Single Sim</option>
															 <option value="2">Dual Sim</option>
															 <option value="3">Triple Sim</option>
															 <option value="4">Four Sim</option>
														</select>
														<input type="text" placeholder="Rear Camera" name="rCamera"> - MP
														<input type="text" placeholder="Front Camera" name="fCamera"> - MP
														<input type="text" placeholder="Number of cores" name="cores">
														<select name="fm">
															 <option value="">-FM-</option>
															 <option value="Y">Yes</option>
															 <option value="N">NO</option>
														</select>
														<select name="wifi">
															 <option value="">-Wi-Fi-</option>
															 <option value="Y">Yes</option>
															 <option value="N">NO</option>
														</select>
														<select name="bluetooth">
															 <option value="">-Bluetooth-</option>
															 <option value="Y">Yes</option>
															 <option value="N">NO</option>
														</select>
														<select name="gprs">
															 <option value="">-GPRS-</option>
															 <option value="Y">Yes</option>
															 <option value="N">NO</option>
														</select>
														<select name="usb">
															 <option value="">-USB-</option>
															 <option value="Y">Yes</option>
															 <option value="N">NO</option>
														</select>
														<select name="flash">
															 <option value="">-Flash-</option>
															 <option value="Y">Yes</option>
															 <option value="N">NO</option>
														</select>
														
														<input type="file" name="file">
														
													<input type="hidden" name="key" value="addProduct">
													<input type="submit" value="Add" class="button btn btn-default pull-right">
												</form>
										</div>
									<table>
												<tr>
													<th>Product Id</th>
													<th>Product Name</th>
													<th>Model Number</th>
													<th>Market Price</th>
													<th>Selling Price</th>
												</tr>
												<%
													Class.forName("com.mysql.jdbc.Driver");

													Statement productst = con.createStatement();
													ResultSet productSet = productst.executeQuery("select * from product;"); // this is for name
													while (productSet.next()) {
												%>
												<tr class="user-loop">
													<td><%=productSet.getInt(1)%></td>													
													<td><%=productSet.getString(2)%>
													<td><%=productSet.getString(3)%></td>
													<td><%=productSet.getString(4)%></td>
													<td><%=productSet.getString(5)%></td>
													<td><form action="MainController" method="post">
															<input type="hidden" name="pId" value="<%=productSet.getInt(1)%>">
															<input type="hidden" name="key" value="editProduct">
															<input type="submit" value="Edit" class="button btn btn-default pull-right">
													</form></td>
													
													<td><form action="MainController" method="post">
															<input type="hidden" name="pId" value="<%=productSet.getInt(1)%>">
															<input type="hidden" name="brand" value="<%=productSet.getString("brand")%>">
															<input type="hidden" name="key" value="deleteProduct">
															<input type="submit" value="Delete" class="button btn btn-default pull-right">
													</form></td>
												</tr>	
												<%} %>	
																			
											</table>
							</div>
							
							<div class="tab-pane fade" id="users" >
										<table>
												<tr>
													<th>customerId</th>
													<th>Name</th>
													<th>Phone</th>
													<th>Email</th>
													<th>Address</th>
													<th>Password</th>
												</tr>
												<%
													Class.forName("com.mysql.jdbc.Driver");

													Statement st1 = con.createStatement();
													ResultSet rs1 = st1.executeQuery("select * from customer;"); // this is for name
													while (rs1.next()) {
												%>
												<tr class="user-loop">
													<td><%=rs1.getInt(1)%></td>													
													<td><%=rs1.getString(2)%> <%=rs1.getString(3)%></td>
													<td><%=rs1.getString(4)%></td>
													<td><%=rs1.getString(5)%></td>
													<td><%=rs1.getString(6)%></td>
													<td><%=rs1.getString(10)%></td>
													<td><form action="MainController" method="post">
															<input type="hidden" name="uId" value="<%=rs1.getInt(1)%>">
															<input type="hidden" name="key" value="deleteuser">
															<input type="submit" value="Delete This User" class="button btn btn-default pull-right">
													</form></td>
												</tr>	
												<%} %>	
																			
											</table>
							</div>
							
							<div class="tab-pane fade" id="reviews" >
									<table>
												<tr>
													<th>Reviewer Name</th>
													<th>Reviewer Email</th>
													<th>Product Id</th>
													<th>Product Name</th>
													<th>Review</th>
													<th>Delete</th>
												</tr>
												<%
													Class.forName("com.mysql.jdbc.Driver");

													Statement reviewSt = con.createStatement();
													ResultSet reviewSet = reviewSt.executeQuery("select r.reviewerName,r.reviewerEmail,r.pId,p.productName,r.review,r.rId from review r,product p where  r.pId = p.productId;"); // this is for name
													while (reviewSet.next()) {
												%>
												<tr class="review-loop2">
													<td> <%=reviewSet.getString(1)%> </td>													
													<td> <%=reviewSet.getString(2)%> </td>
													<td> <%=reviewSet.getInt(3)%> </td>
													<td> <%=reviewSet.getString(4)%> </td>
													<td> <%=reviewSet.getString(5)%> </td>
													<td> <form action="MainController" method="post">
															<input type="hidden" name="rId" value="<%=reviewSet.getString(6)%>">
															<input type="hidden" name="key" value="deleteReview">
															<input type="submit" value="Delete This Review" class="button btn btn-default pull-right">
													</form> </td>
												</tr>	
												<%} %>	
																			
									</table>
							</div>
							
							<div class="tab-pane fade" id="orders" >
								<table>
												<tr>
													<th class="col-md-1">Order Id</th>
													<th class="col-md-1">Cusomer Id</th>
													<th class="col-md-3">Payment Status</th>
													<th class="col-md-3">Delivery Status</th>
													<th class="col-md-3">change Payments Status</th>
													<th class="col-md-3">Change Delivery Status</th>
												</tr>
												<%
													Statement orderst = con.createStatement();
													ResultSet orderSet = orderst.executeQuery("select * from customer_order Order By OrderId desc;"); // this is for name
													while (orderSet.next()) {
												%>
												<tr>
													<td> <%=orderSet.getInt(1)%> </td>													
													<td> <%=orderSet.getInt(2)%> </td>
													<td> <%=orderSet.getString(5)%> </td>
													<td> <%=orderSet.getString(6)%> </td>
													<td>
														<form action="MainController" method="post">
														<select name="payment">
															<option>-change payment status-</option>
															<option value="Due">Due</option>
															<option value="Paid">Paid</option>
														</select>
														<input type="hidden" name="oId" value="<%=orderSet.getInt(1)%>">
														<input type="hidden" name="key" value="changePaymentStatus">
														<input type="submit" value="change">
														</form>
													</td>
													<td>
														<form action="MainController" method="post">
														<select name="delivery">
															<option>-change Delivery status-</option>
															<option value="delivered">delivered</option>
															<option value="not delivered">not delivered</option>
														</select>
														<input type="hidden" name="oId" value="<%=orderSet.getInt(1)%>">
														<input type="hidden" name="key" value="changeDeliveryStatus">
														<input type="submit" value="change">
														</form>
													</td>
													<td>
														<form action="MainController" method="post">
														<input type="hidden" name="oId" value="<%=orderSet.getInt(1)%>">
														<input type="hidden" name="key" value="cancleOrder">
														<input type="submit" value="Cancle this order">
														</form>
														
													</td>
												</tr>	
												<%} %>	
																			
									</table>
							</div>
						</div>
					</div><!--/category-tab-->					
				</div>
			</div>
		</div>
	</section>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script src="js/paginate.js"></script>
</body>
</html>