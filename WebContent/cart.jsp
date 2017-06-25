<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page import="com.connection.*"%>
<%@page import="com.beans.*"%>
<%@page import="java.util.*"%>
<%@ page errorPage="login.jsp" %>
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
	
	
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<%
							int uId = (Integer)request.getSession().getAttribute("customerId");
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = ConnectionFactory.getInstance().getConnection();
							Statement st = con.createStatement();	
							String queryString = "select * from cart where customerId = " + uId + " Order by addDate";
							ResultSet rs = st.executeQuery(queryString); // this is for name
							float totalcost = 0 , shippingCost = 0;
							while (rs.next()) {
							Statement st1 = con.createStatement();
							String queryString2 = "select * from product where ProductId = " + rs.getInt("productId");	
							ResultSet rs1 = st1.executeQuery(queryString2);	
							rs1.first();
						%>
						<tr>
							<td class="cart_product">
								<a href=""><img src="images/products/<%=rs1.getString("brand")%>/<%=rs1.getString("productName")%>/1.jpeg" height="200px" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%=rs1.getString("productName")%></a></h4>
							</td>
							<td class="cart_price">
								<p><%=rs1.getFloat("SellingPrice")%></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<form action="MainController" method="post">
										<input name="cId" type="hidden" value="<%=rs.getInt("cId")%>">
										<input type="hidden" name="key" value="updateCart">
										<input class="cart_quantity_input" type="text" name="quantity" value="<%=rs.getInt("quantity") %>" autocomplete="off" size="2">
										<input type="submit" class="btn btn-default check_out" value="update">
									</form>
									<form action="MainController" method="post">
										<input name="cId" type="hidden" value="<%=rs.getInt("cId")%>">
										<input type="hidden" name="key" value="deleteFromCart">
										<input type="submit" class="btn btn-default check_out" value="delete this item !">
									</form>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><%=rs1.getFloat("SellingPrice")*rs.getInt("quantity") %></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
							
						<%
						totalcost += rs1.getFloat("SellingPrice")*rs.getInt("quantity");
						rs1.close();
						st1.close();
						}
							if(totalcost > 500)
								shippingCost = 0;
							else shippingCost = 100;
						%>

					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>₹ <%=totalcost%></span></li>
							<li>Shipping Cost <span>₹ <%=shippingCost %></span></li>
							<li>Total <span>₹ <%=totalcost+shippingCost %></span></li>
						</ul>
							<%if(totalcost != 0) {%>
								<a class="btn btn-default check_out" href="checkout.jsp">Check Out</a>
							<%}else{ %>
									<h2>There is no item in cart</h2>
							<%}
								session.setAttribute("GrandTotal",totalcost+shippingCost);
							
							%>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
	
	
	

	<jsp:include page="footer.jsp"></jsp:include>
  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>