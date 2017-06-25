<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page import="com.connection.*"%>
<%@page import="com.beans.*"%>
<%@page import="java.util.*"%>
<%@page errorPage="login.jsp" %>
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
	
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="index.jsp">Home</a></li>
				  <li class="active">Order Detail</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="col-md-2">Order Id</td>
							<td class="col-md-4">Detail</td>
							<td class="col-md-2">Grand Total</td>
							<td class="col-md-2">Order Status</td>
							<td class="col-md-2">Payment Status</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<%
							int uId = (Integer)request.getSession().getAttribute("customerId");
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = ConnectionFactory.getInstance().getConnection();
							Statement st = con.createStatement();	
							String queryString = "select * from customer_order  where customerId = " + uId + " Order by addDate";
							ResultSet rs = st.executeQuery(queryString); // this is for name
							while (rs.next()) {
							Statement st1 = con.createStatement();
						%>
						<tr>
							<td class="col-md-2">
								<%=rs.getInt("orderId") %>
							</td>
							<td class="col-md-4">
								<h4>
									<table>
										<tr
										><th>Item Name</th>
										<th>Quantity</th>
										</tr>
										<% 
										String productList = "select p.productName,o.quantity from order_detail o,product p where o.productId = p.productId and orderid="+rs.getInt("orderId");				
										ResultSet rs1 = st1.executeQuery(productList);
										while(rs1.next()){
										%>
										<tr>
											<td><%=rs1.getString(1) %></td>
											<td><%=rs1.getString(2) %></td>
										</tr>
										<%}
										rs1.close();
										%>
									</table>
									
								</h4>
							</td>
							<td class="col-md-2">
								<p><%=rs.getFloat("order_total")%></p>
							</td>
							<td class="col-md-2">
								<p><%=rs.getString("delivery_status")%></p>
							</td>
							<td class="col-md-2">
								<p class="cart_total_price"><%=rs.getString("payment_status")%></p>
							</td>
						</tr>
					<%} %>
					
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
	

	<jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>