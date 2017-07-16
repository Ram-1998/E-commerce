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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head><!--/head-->

<body>	
	<jsp:include page="header.jsp"></jsp:include>	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						
						<div class="brands_products"><!--brands_products-->
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
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
										con.close();
										for (int i = 0; i < brandList.size(); i++) {
									%>
										<li><a href="categorizedFilter.jsp?bId=<%=brandList.get(i).getId()%>"> <span class="pull-right"></span><%=brandList.get(i).getName()%></a></li>
									<%} %>								
								</ul>
							</div>
						</div><!--/brands_products-->
						
						<div class=""><!--price-range-->
							<h2>Filters</h2>
							<h2>Price Range</h2>							
							<div class="well text-center">
								 <input type="range"  min="0" max="60000" step="100" value="0"  id="slider1" onChange="showvalue()"><br />
								 <b class="pull-left">₹ 0</b> <b id="value-min">0</b> <b class="pull-right">₹ 60000</b>
								 <h3>To</h3>
								 <input type="range"  min="0" max="60000" step="100"  id="slider2" onChange="showvalue()" ><br />
								 <b class="pull-left">₹ 0</b> <b id="value-max">30000</b> <b class="pull-right">₹ 60000</b>
							</div>
						</div><!--/price-range-->
						<div class=""><!--Os-->
							<h2>OS</h2>
								<div class="filterOption">
									<select name="os" id="os" onchange="loadDoc()">
										<option value="select"> select OS</option>
										<option value="android">Android</option>
										<option value="windows">Windows</option>
										<option value="ios">ios</option>
										<option value="blackberry">Blackberry</option>
										<option value="linux">Linux</option>
									</select>
								</div>
						</div><!--os-->
						<div class="filterOption"><!--RAM-->
							<h2>RAM</h2>
								<div class="">
									<select name="ram" id="ram" onchange="loadDoc()">
										<option value="select"> select RAM</option>
										<option value="1"> 512 Mb</option>
										<option value="1"> 1 Gb</option>
										<option value="2">  2 Gb</option>
										<option value="3">3 Gb</option>
										<option value="4">4 Gb</option>
										<option value="6">6 Gb</option>
									</select>
								</div>
						</div><!--RAM-->
						<div class="filterOption"><!--ROM-->
							<h2>R0M</h2>
								<div class="">
									<select name="rom" id="rom" onchange="loadDoc()">
										<option value="select"> select ROM</option>
										<option value="2">2 Gb</option>
										<option value="4">4 Gb</option>
										<option value="8"> 8 Gb</option>
										<option value="16"> 16 GB</option>
										<option value="32"> 32 GB</option>
										<option value="64"> 64 GB</option>
										<option value="128"> 128 GB</option>
									</select>
								</div>	
						</div><!--ROM-->
						<div class="filterOption"><!--ROM-->
							<h2>Network type</h2>
								<div class="">
									<select name="nType" id="nType" onchange="loadDoc()">
										<option value="select"> select network type</option>
										<option value="2G">2G</option>
										<option value="3G">3G</option>
										<option value="4G">4G</option>
										<option value="4G VOLTE">4G VOLTE</option>
									</select>
								</div>	
						</div><!--network type-->
						         
						         <script>
									function loadDoc() {
									  var ram = document.getElementById("ram").value;
									  var rom = document.getElementById("rom").value;
									  var os= document.getElementById("os").value;
									  var nType = document.getElementById("nType").value; 
									  var min = document.getElementById("slider1").value;
									  var max = document.getElementById("slider2").value;
									 
									  var xhttp;
									  if (window.XMLHttpRequest) {
									    // code for modern browsers
									    xhttp = new XMLHttpRequest();
									    } else {
									    // code for IE6, IE5
									    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
									  }
									  xhttp.onreadystatechange = function() {
									    if (this.readyState == 4 && this.status == 200) {
									      document.getElementById("main-display").innerHTML = this.responseText;
									    }
									  };
									  xhttp.open("GET", "filter.jsp?ram="+ram+"&rom="+rom+"&os="+os+"&nType="+nType+"&min="+min+"&max="+max, true);
									  xhttp.send();
									}
									function showvalue(){
										document.getElementById("value-min").innerHTML = document.getElementById("slider1").value;
										document.getElementById("value-max").innerHTML = document.getElementById("slider2").value;
										loadDoc();
									}
								</script>
						  
						
					</div>
				</div>
				
				<div class="col-sm-9 padding-right" id="main-display">				
					<div class="new_items" id="new_items"><!--New Items-->
						<h2 class="title text-center">New Items</h2>
						<%
							ArrayList<product> productList = new ArrayList<product>();
							Class.forName("com.mysql.jdbc.Driver");
							Connection con1 = ConnectionFactory.getInstance().getConnection();
							Statement st1 = con1.createStatement();						
							rs = st1.executeQuery("select * from product ORDER BY addDate,addTime"); // this is for name
							while (rs.next()) {
							product p=new product();
							p.setProductId(rs.getInt(1));
							p.setProductName(rs.getString(2));
							p.setMarketPrice(rs.getFloat(4));
							p.setSellingPrice(rs.getFloat(5));
							p.setBrand(rs.getString(6));
							productList.add(p);
							}
							rs.close();
							st.close();
							con.close();
							for (int i = 0; i < 6; i++) {
						%>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<div class="indexSize">
												<a href="productDetail.jsp?productId=<%=productList.get(i).getProductId()%>" target="_Blank" >
													<img src="images/products/<%=productList.get(i).getBrand()%>/<%=productList.get(i).getProductName()%>/1.jpeg" height="200px"/>
												</a>
											</div>
											<h2 class="marketPrice"><%=productList.get(i).getMarketPrice()%></h2>
											<h2><%=productList.get(i).getSellingPrice()%></h2>
											<p><%=productList.get(i).getProductName()%></p>
											
											<form action="MainController" method="post">
												<input type="hidden" name="pId" value="<%=productList.get(i).getProductId()%>">
												<input type="hidden" name="key" value="addToCart">
												<input type="hidden" name="quantity" value="1">
												<input type="submit" value="Add to cart" href="#" class="btn btn-default add-to-cart">
											</form>
											
										</div>
										<img src="images/home/new.png" class="new" alt="" />
								</div>								
							</div>
						</div>
						
						
						<%} %>
							<button class="btn btn-default" onclick="viewall()">View All >></button>
							<script>
								function viewall(){
									document.getElementById("new_items").style.display="none";
									document.getElementById("features_items").style.display="none";
									document.getElementById("allItems").style.display="block";
								}
							</script>
					</div><!--New items-->
					
					<div class="features_items" id="features_items"><!--features_items-->
						<h2 class="title text-center">features Items</h2>
						<%
							ArrayList<product> newproductList = new ArrayList<product>();
							Class.forName("com.mysql.jdbc.Driver");
							Connection con2 = ConnectionFactory.getInstance().getConnection();
							Statement st2 = con2.createStatement();						
							rs = st2.executeQuery("select * from product ORDER BY addDate,addTime"); // this is for name
							while (rs.next()) {
							product p=new product();
							p.setProductId(rs.getInt(1));
							p.setProductName(rs.getString(2));
							p.setMarketPrice(rs.getFloat(4));
							p.setSellingPrice(rs.getFloat(5));
							p.setBrand(rs.getString(6));
							productList.add(p);
							}
							rs.close();
							st.close();
							for (int i = 0; i < 6; i++) {
						%>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<div class="indexSize">
												<a href="productDetail.jsp" target="_blank">
													<img src="images/products/<%=productList.get(i).getBrand()%>/<%=productList.get(i).getProductName()%>/1.jpeg" height="200px"/>
												</a>
											</div>
											<h2 class="marketPrice"><%=productList.get(i).getMarketPrice()%></h2>
											<h2><%=productList.get(i).getSellingPrice()%></h2>
											<p><%=productList.get(i).getProductName()%></p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<img src="images/home/sale.png" class="new" alt="" />
								</div>								
							</div>
						</div>
						
						
						<%} %>
					</div><!--features_items-->
					
					<div class="features_items" id="allItems" style="display:none;"><!--All Items-->
						<h2 class="title text-center">All Items</h2>
						<%
							ArrayList<product> allproductList = new ArrayList<product>();
							Class.forName("com.mysql.jdbc.Driver");
							Statement st3 = con2.createStatement();						
							rs = st2.executeQuery("select * from product ORDER BY addDate desc"); // this is for name
							while (rs.next()) {
						%>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<div class="indexSize">
												<a href="productDetail.jsp" target="_blank">
													<img src="images/products/<%=rs.getString(6)%>/<%=rs.getString(2)%>/1.jpeg" height="200px"/>
												</a>
											</div>
											<h2 class="marketPrice"><%=rs.getFloat(4)%></h2>
											<h2><%=rs.getFloat(5)%></h2>
											<p><%=rs.getString(2)%></p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
								</div>								
							</div>
						</div>						
						<%} %>
					</div>
					<div class="features_items" id="allItems" style="display:none;"><!--All Items-->
						<h2 class="title text-center">All Items</h2>
						<%
							ArrayList<product> FilterList = new ArrayList<product>();
							Class.forName("com.mysql.jdbc.Driver");
							Statement filter = con2.createStatement();	
											
							
							
							rs = filter.executeQuery("select * from product "); // this is for name
							while (rs.next()) {
						%>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<div class="indexSize">
												<a href="productDetail.jsp" target="_blank">
													<img src="images/products/<%=rs.getString(6)%>/<%=rs.getString(2)%>/1.jpeg" height="200px"/>
												</a>
											</div>
											<h2 class="marketPrice"><%=rs.getFloat(4)%></h2>
											<h2><%=rs.getFloat(5)%></h2>
											<p><%=rs.getString(2)%></p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
								</div>								
							</div>
						</div>						
						<%} %>
					</div>
					
					
					
					
					
					
					
					<!--All Items-->
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
</body>
</html>