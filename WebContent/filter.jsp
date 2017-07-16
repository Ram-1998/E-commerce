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

	<div class="col-sm-12 padding-right" id="main-display">
				
					<div class="features_items"><!--New Items-->
						<h2 class="title text-center">filtered Items</h2>
						<%
							String ram = request.getParameter("ram");
							String rom = request.getParameter("rom");
							String nType = request.getParameter("nType");
							String os = request.getParameter("os");
							String min = request.getParameter("min");
							String max = request.getParameter("max");
							
							
							
							ArrayList<product> productList = new ArrayList<product>();
							Class.forName("com.mysql.jdbc.Driver");
							Connection con1 = ConnectionFactory.getInstance().getConnection();
							Statement st1 = con1.createStatement();	
							String query = "select * from product where ";
							
							if(!ram.equals("select")){
								if(query.endsWith("and ") || query.endsWith("where "))
									query+=" RAM="+ ram +" and ";
								else
									query+=" and RAM="+ ram +" and ";
							}
							if(!rom.equals("select")){
								if(query.endsWith("and ") || query.endsWith("where "))
									query+=" ROM="+ rom +" and ";
								else
									query+=" and ROM="+ rom +" and ";
							}
							if(!nType.equals("select")){
								if(query.endsWith("and ") || query.endsWith("where "))
									query+=" netorkType='"+ nType +"' and ";
								else
									query+=" and netorkType='"+ nType +"' and ";
							}
							if(!os.equals("select")){
								if(query.endsWith("and ") || query.endsWith("where "))
									query+=" OS='"+ os +"' and ";
								else
									query+=" and OS='"+ os +"' and ";
							}
							boolean flag=false;
							if(query.endsWith("and "))
							{
								flag=true;
								query+="(";
							}
							if(flag==true)
								query+=")";
							if(query.endsWith("and ()"))
								query=query.substring(0,query.length()-6);
							
							if(query.endsWith("and ") || query.endsWith("where "))
								query+=" SellingPrice BETWEEN "+ min +" AND " + max;
							else
								query+=" and SellingPrice BETWEEN "+ min +" AND " + max;
							
							System.out.println(query);
							
							ResultSet rs = st1.executeQuery(query); // this is for name
							
							
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
							
							if(productList.size() == 0){ %>
								<h2> There is no item mathing to your filter</h2>
								
							}
							
						<%	}else{
							for (int i = 0; i < productList.size(); i++) {
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
										<img src="images/home/sale.png" class="new" alt="" />
								</div>								
							</div>
						</div>
						
						
						<%} }%>
					</div><!--New items-->
					
					
				</div>


		

<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>