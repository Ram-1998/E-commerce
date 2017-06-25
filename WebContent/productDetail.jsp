<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page import="com.connection.*"%>
<%@page import="com.beans.*"%>
<%@page import="java.util.*"%>
<%@ page errorPage="index.jsp" %>
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
    <script src="js/productZoom.js"></script>
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
				<div class="col-sm-11 padding-right">
					<% 
					int productId = Integer.parseInt(request.getParameter("productId"));
					Class.forName("com.mysql.jdbc.Driver");
					Connection con1 = ConnectionFactory.getInstance().getConnection();
					Statement st1 = con1.createStatement();
					String query = "select * from product where productId = " + productId;
					ResultSet rs = st1.executeQuery(query);
					rs.next();
					product p = new product();
					p.setProductId(rs.getInt("productId"));
					p.setProductName(rs.getString("productName"));
					p.setModelNumber(rs.getString("ModelNumber"));
					p.setMarketPrice(rs.getFloat("MarketPrice"));
					p.setSellingPrice(rs.getFloat("SellingPrice"));
					p.setBrand(rs.getString("brand"));
					p.setOS(rs.getString("OS"));
					p.setRAM(rs.getInt("RAM"));
					p.setROM(rs.getInt("ROM"));
					p.setClockSpeed(rs.getFloat("clockSpeed"));
					p.setExpandable(rs.getInt("expandable"));
					p.setNetorkType(rs.getString("netorkType"));
					p.setScreenSize(rs.getFloat("screenSize"));
					p.setPhoneType(rs.getString("phoneType"));
					p.setSimType(rs.getInt("simType"));
					p.setRearCamera(rs.getFloat("rearCamera"));
					p.setFrontCamera(rs.getFloat("frontCamera"));
					p.setCores(rs.getInt("cores"));
					p.setFM(rs.getString("fm"));
					p.setWifi(rs.getString("wifi"));
					p.setBluethooth(rs.getString("bluethooth"));
					p.setGPRS(rs.getString("GPRS"));
					p.setUSB(rs.getString("USB"));
					p.setFLASH(rs.getString("FLASH"));
					%>
				
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product" id="#zoom">
								<img src="images/products/<%=p.getBrand() %>/<%=p.getProductName() %>/1.jpeg" height="400px" width="auto">							
							</div>
						</div>
						<div class="col-sm-7">
								<div class="product-information"><!--/product-information-->
								<h2><%=p.getProductName()%></h2>
								<p><%=p.getModelNumber() %></p>
								<span>
									<span class="marketPrice"><%=p.getMarketPrice() %></span><span><%=p.getSellingPrice() %></span>
									<span style="color:green;">offer : <%out.print( 100 - (p.getSellingPrice()/p.getMarketPrice())*100  ); %>% off</span>
									<form action="MainController" method="post">
												<input type="hidden" name="pId" value="<%=p.getProductId() %>">
												<input type="hidden" name="key" value="addToCart">
												<label>Quantity:</label>
												<input type="number" name="quantity" value="1">
												<input type="submit" value="Add to cart" class="btn btn-default">
									</form>
									
								</span>
								<p><b>Availability:</b> In Stock</p>
								<p><b>Condition:</b> New</p>
								<p><b>Brand:</b><%=p.getBrand() %></p>
								<p><a href="#details">More details</a> </p>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#details" data-toggle="tab">Details</a></li>
								<li><a href="#reviews" data-toggle="tab">Reviews</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="details" >
								<div class="col-sm-5">
								<h2>General</h2>
								<table>
									  <tr>
									    <th>Name</th>
									    <td><%=p.getProductName() %></td>
									  </tr>
									  <tr>
									  	<th>Model</th>
									    <td><%=p.getModelNumber() %></td>									    
									  </tr>
									  <tr>
									  	<th>Type</th>
									    <td><%=p.getPhoneType() %></td>									    
									  </tr>
									  <tr>
									  	<th>Sim Type</th>
									    <td><%=p.getSimType() %></td>									    
									  </tr>
								</table>
								
								<h2>Display</h2>
								<table>
									  <tr>
									    <th>Screen Size</th>
									    <td><%=p.getScreenSize() %></td>
									  </tr>
								</table>
								
								<h2>Os And Processor</h2>
								<table>
									  <tr>
									    <th>OS</th>
									    <td><%=p.getOS() %></td>
									  </tr>
									  <tr>
									    <th>Processor Core</th>
									    <td><%=p.getCores() %></td>
									  </tr>
									  <tr>
									    <th>Processor Clock Speed</th>
									    <td><%=p.getClockSpeed() %></td>
									  </tr>
								</table>
								
								<h2>Memory</h2>
								<table>
									  <tr>
									    <th>RAM</th>
									    <td><%=p.getRAM() %></td>
									  </tr>
									  <tr>
									    <th>ROM</th>
									    <td><%=p.getROM() %></td>
									  </tr>
									  <tr>
									    <th>Expandable Storage upto</th>
									    <td><%=p.getExpandable() %></td>
									  </tr>
								</table>
								</div>
								<div class="col-sm-5">
								<h2>Camera Features</h2>
								<table>
									  <tr>
									    <th>Rear Camera</th>
									    <td><%=p.getRearCamera() %>MP</td>
									  </tr>
									  <tr>
									    <th>Front Camera</th>
									    <td><%=p.getFrontCamera() %>MP</td>
									  </tr>
								</table>
								<h2>Network Type</h2>
								<table>
									  <tr>
									    <th>Network</th>
									    <td><%=p.getNetorkType() %></td>
									  </tr>
								</table>
								
								<h2>Others</h2>
								<table>
									  <tr>
									    <th>FM</th>
									    <td><%=p.getFM() %></td>
									  </tr>
									  <tr>
									    <th>Wifi</th>
									    <td><%=p.getWifi() %></td>
									  </tr>
									  <tr>
									    <th>Bluetooth</th>
									    <td><%=p.getBluethooth() %></td>
									  </tr>
									  <tr>
									    <th>GPRS</th>
									    <td><%=p.getGPRS() %></td>
									  </tr>
									  <tr>
									    <th>USB</th>
									    <td><%=p.getUSB() %></td>
									  </tr>
									  <tr>
									    <th>Flash</th>
									    <td><%=p.getFLASH() %></td>
									  </tr>
								</table>
								</div>
							</div>							
							<div class="tab-pane fade" id="reviews" >
							
								<%
										ArrayList <Brand> brandList = new ArrayList<Brand>();
										Class.forName("com.mysql.jdbc.Driver");
										Connection con = ConnectionFactory.getInstance().getConnection();
										Statement st = con.createStatement();
										String querystring = "select * from review where pId = " + p.getProductId() + " order By reviewDate desc";
										System.out.println("querystring");
										ResultSet rs1 = st.executeQuery(querystring); // this is for name
										
										while(rs1.next()) {
									%>
										<div class="col-sm-12 review-loop">
											<ul>
												<li><a href=""><i class="fa fa-user"></i><%=rs1.getString("reviewerName") %></a></li>
												<li><a href=""><i class="fa fa-clock-o"></i><%=rs1.getString("reviewTime") %></a></li>
												<li><a href=""><i class="fa fa-calendar-o"></i><%=rs1.getString("reviewDate") %></a></li>
											</ul>
											<p><%=rs1.getString("review") %></p>
										</div>										
									<%} 
										rs.close();
										st.close();
										con.close();
									%>	
							
								
								
	
								
								<div class="col-sm-12">	
									<p><b>Write Your Review</b></p>									
									<form action="MainController" method="post">
										<span>
											<input type="text" placeholder="Your Name"/ name="rName">
											<input type="email" placeholder="Email Address"/ name="rEmail">
										</span>
										<textarea name="review" ></textarea>
										<input type="hidden" name="key" value="review">
										<input type="hidden" name="pId" value="<%=p.getProductId()%>">
										<input type="submit" value="Submit !" class="button btn btn-default pull-right">
									</form>
								</div>
								
							</div>
							
						</div>
					</div><!--/category-tab-->
					
				</div>
			</div>
		</div>
	</section>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script src="js/paginate.js"></script>

</body>
</html>