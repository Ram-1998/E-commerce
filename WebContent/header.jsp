<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page import="com.connection.*"%>
<%@page import="com.beans.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Header | E-Shopper</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
</head>
<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href=""><i class="fa fa-phone"></i> +91 94612-14514</a></li>
								<li><a href=""><i class="fa fa-envelope"></i> shreerambanasal@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-facebook"></i></a></li>
								<li><a href=""><i class="fa fa-twitter"></i></a></li>
								<li><a href=""><i class="fa fa-linkedin"></i></a></li>
								<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->

		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-5">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt="main_logo" /></a>
						</div>
					</div>
    
					<div class="col-sm-7">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<% 
								 if(request.getSession().getAttribute("customerId") == null){
								%>
								<li><a href="login.jsp" class="active"><i class="fa fa-lock"></i> SignUp</a></li>
								<li><a href="login.jsp" class="active"><i class="fa fa-lock"></i> Login</a></li>
								
								<%} else{%>
								
								<li>Hi , <%=request.getSession().getAttribute("customerFname")%></li>
								<li><a href="account.jsp"><i class="fa fa-user"></i> Account</a></li>
								<li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><form action="MainController" method="post">
								<input type="hidden" name="key" value="logout">
								<input type="submit" class="btn btn-default logout" value="Logout">
								</form></li>
								<%} %>
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->

		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp">Home</a></li>
								<li><a href="account.jsp">My Account</a></li>
								<li><a href="aboutus.jsp">About us</a></li>
								<li><a href="order.jsp">Order</a></li>
								<%
								String Type = (String)request.getSession().getAttribute("customerType");
								if(Type != null){
								if(Type.equalsIgnoreCase("A")){									
								%>
								<li><a href="adminMain.jsp">Admin Panel</a></li>
								<%} }%>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
</body>
</html>