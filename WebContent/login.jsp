<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login | E-Shopper</title>
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

	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						<span style="color:red;"><p>
								<%
								String loginerror = (String)request.getAttribute("loginerror");
								if(loginerror != null)
								out.println(loginerror); 
								%>
							</p></span>
						<form action="MainController" method="post">
							<input type="email" placeholder="Email Address" name="email"/>
							<input type="password" placeholder="Password" name="password"/>
							<input type="hidden" name="key" value="login">
							<button type="submit" name="login" value="Login" class="btn btn-default">Login</button>
						</form>
					</div><!--/login form-->
				</div>
				
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
						<span style="color:red;"><p>
								<%
								String registererror = (String)request.getAttribute("registererror");
								if(registererror != null)
								out.println(registererror); 
								%>
						<form action="MainController" method="post" onSubmit="return validateform();" name="registerForm">
							<input type="text" placeholder="First Name" name="fname" id="fname" onchange="firstName()"/><span id="fnameError"></span>
							<input type="text" placeholder="Last Name" name="lname" id="lname" onchange="lastName()"/><span id="lnameError"></span>
							<input type="number" placeholder="Phone Number"name="phone" id="mob"/>
							<input type="email" placeholder="Email Address"name="email"/>
							<input type="text" placeholder="Address" name="address"/>
							<input type="text" placeholder="city"name="city"/>
							<input type="text" placeholder="state"name="state"/>
							<input type="number" placeholder="zip" name="zip" maxlength="6"/>
							<input type="text" placeholder="Password" name="password"  id="pass1"/><span id="PassError"></span>
							<input type="text" placeholder="Confirm Password" name="cpassword"  id="pass2"/>
							<input type="hidden" name="key" value="register">
							<button type="submit" class="btn btn-default" name="submit">Signup</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	<script type="text/javascript">
				function validateform(){  
					var fname=document.registerForm.fname.value;
					var lname=document.registerForm.lname.value; 
					var phone=document.registerForm.phone.value;  
					var address=document.registerForm.address.value;
					var city=document.registerForm.city.value;
					var state=document.registerForm.state.value;
					var zip=document.registerForm.zip.value;
					var pass= document.registerForm.password.value;
					var cpass= document.registerForm.cpassword.value;
					  
					if (fname==null || fname==""){  
					  alert("First Name can't be blank");  
					  return false;  
					}else if(lname==null || lname==""){  
						  alert("Last Name can't be blank");  
						  return false;  
					}else if(phone.length != 10){  
						  alert("mobile number is not valid");  
						  return false;  
					}else if(address==null || address==""){  
						  alert("Address can't be blank");  
						  return false;  
					}else if(city==null || city==""){  
						  alert("city can't be blank");  
						  return false;  
					}else if(state==null || state==""){  
						  alert("state can't be blank");  
						  return false;  
					}else if(zip.length != 6){  
						  alert("Zip is not valid");  
						  return false;  
					}else if(pass==null || pass==""){  
						  alert("Password can't be blank");  
						  return false;  
					}else if(pass != cpass){  
						  alert("Password And Confirm Password does not match !");  
						  return false;  
					}
				}

	</script>


	<jsp:include page="footer.jsp"></jsp:include>



    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
