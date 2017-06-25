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
		<section style="margin-left:20%;">
		<%
		customer c = new customer();
		c = (customer)request.getSession().getAttribute("customer");
		int uId = (int)request.getSession().getAttribute("customerId");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = ConnectionFactory.getInstance().getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from customer where customerId ="+ uId +" ;");
		rs.first();
		%>
		<form action="MainController" method="post">
			<table>
				<tr>
					<th>First name : </th>
					<td><input type="text" name="fname" value="<%=rs.getString("customerFname")%>" ></td>
				</tr>
				<tr>
					<th>Last name</th>
					<td><input type="text" name="lname" value="<%=rs.getString("customerLname")%>"></td>
				</tr>
				<tr>
					<th>Phone</th>
					<td><input type="text" name="phone" value="<%=rs.getString("customerPhone")%>" disabled></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><input type="text" name="email" value="<%=rs.getString("customerEmail")%>" disabled></td>
				</tr>
				<tr>
					<th>Address</th>
					<td><input type="text" name="address" value="<%=rs.getString("customerAddress")%>"></td>
				</tr>
				<tr>
					<th>City</th>
					<td><input type="text" name="city" value="<%=rs.getString("customerCity")%>"></td>
				</tr>
				<tr>
					<th>State</th>
					<td><input type="text" name="state" value="<%=rs.getString("customerState")%>"></td>
				</tr>
				<tr>
					<th>Zip</th>
					<td><input type="text" name="zip" value="<%=rs.getString("customerZip")%>"></td>
				</tr>
			</table>
			<input type="hidden" name="key" value="updateCustomer">
			<input type="submit" value="update changes" class="btn btn-default cart">
		</form>	
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