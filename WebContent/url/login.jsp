<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%
	String contextPath = request.getContextPath();
	String mes = (String)session.getAttribute("message");
%>
<head>
<title>AkiMeet cảm ơn bạn đã sử dụng dịch vụ</title>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Akimeet, www.akimeet.com, akimeet.com, login akimeet.com, akimeet đặt bàn online, login akimeet" />
	
<meta name="description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta name="author" content="Akimeet">
<meta keywork="akimeet, akimeet.com, www.akimeet" content="">
<meta property="og:title" content="Akimeet - Tìm kiểm ưu đãi từ tất cả các nhà hàng, tất cả các dịch vụ" >
<meta  property="og:description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta property="og:type" content="website">
<meta name="robots" content="index, follow">
<meta property="og:url" content="https://www.akimeet.com/">
<!--script-->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">
<style type="text/css">
.login-box {
	position: relative;
	margin: 10px auto;
	width: 600px;
	height: 450px;
	background-color: #fff;
	padding: 10px;
	border-radius: 3px;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.33);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.33);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.33);
}

.lb-header {
	position: relative;
	color: #00415d;
	margin: 5px 5px 10px 5px;
	padding-bottom: 10px;
	border-bottom: 1px solid #eee;
	text-align: center;
	height: 28px;
}

.lb-header a {
	margin: 0 25px;
	padding: 0 20px;
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.lb-header .active {
	color: #029f5b;
	font-size: 18px;
}

.social-login {
	position: relative;
	float: left;
	width: 100%;
	height: auto;
	padding: 10px 0 15px 0;
	border-bottom: 1px solid #eee;
}

.social-login a {
	position: relative;
	float: left;
	width: calc(40% - 8px);
	text-decoration: none;
	color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.05);
	padding: 12px;
	border-radius: 2px;
	font-size: 12px;
	text-transform: uppercase;
	margin: 0 3%;
	text-align: center;
}

.social-login a i {
	position: relative;
	float: left;
	width: 20px;
	top: 2px;
}

.social-login a:first-child {
	background-color: #49639F;
}

.social-login a:last-child {
	background-color: #DF4A32;
}

.email-login, .email-signup {
	position: relative;
	float: left;
	width: 100%;
	height: auto;
	margin-top: 20px;
	text-align: center;
}

.u-form-group {
	width: 100%;
	margin-bottom: 10px;
}

.u-form-group input[type="email"], .u-form-group input[type="password"], .u-form-group input[type="text"]
	{
	width: calc(50% - 22px);
	height: 45px;
	outline: none;
	border: 1px solid #ddd;
	padding: 0 10px;
	border-radius: 2px;
	color: #333;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.u-form-group input:focus {
	border-color: #358efb;
}

.u-form-group button {
	width: 50%;
	background-color: #1CB94E;
	border: none;
	outline: none;
	color: #fff;
	font-size: 14px;
	font-weight: normal;
	padding: 14px 0;
	border-radius: 2px;
	text-transform: uppercase;
}

.forgot-password {
	width: 50%;
	text-align: left;
	text-decoration: underline;
	color: #888;
}

/*Loader*/

.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(images/load.gif) center no-repeat #fff;
}
</style>
<script src='<%=contextPath%>/lib/jquery/jquery.min.js'></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script type="text/javascript">
$(window).load(function() {
	// Animate loader off screen
	$(".se-pre-con").fadeOut("slow");;
});
</script>
</head>
<body style="background-color: #f7f7f7;">
	<div id="dialog_message" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content" style="border-radius: 0">
				<div class="modal-header" style="background: #286090">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="text-align: center; color: #fff">Thông
						báo</h4>
				</div>
				<div class="modal-body">
					<p style="text-align: center;"><%=mes%></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<div class="login-box" style="margin-top: 100px;">
		<div class="lb-header">
			<a href="#" class="active" id="login-box-link">Login</a> <a href="#"
				id="signup-box-link">Sign Up</a>
		</div>
		<div class="social-login">
			<a href="#" type="submit" onclick="javascript:login();"> <i
				class="fa fa-facebook fa-lg"></i> Login in with facebook
			</a> <a href="#" id="customBtn" data-onsuccess="onSignIn"
				id="loginGoogleBtn"> <i class="fa fa-google-plus fa-lg"></i> Log
				in with Google
			</a>
		</div>
		<form class="email-login" action="login" method="post">
			<div class="u-form-group">
				<input type="email" placeholder="Email" name="email_login" required="required"/>
			</div>
			<div class="u-form-group">
				<input type="password" placeholder="Password" name="password_login" required="required"/>
			</div>
			<div class="u-form-group">
				<button type="submit">Log in</button>
			</div>
			<div class="u-form-group">
				<a href="#" class="forgot-password">Forgot password?</a>
			</div>
		</form>
		<form class="email-signup" action="login" method="post">
			<div class="u-form-group">
				<input type="email" placeholder="Email" name="email_register" required="required"/>
			</div>
			<div class="u-form-group">
				<input type="text" placeholder="phonenumber"  name="phonenumber" required="required"/>
			</div>
			<div class="u-form-group">
				<input type="password" placeholder="Password" name="password_register" required="required" />
			</div>
			<div class="u-form-group">
				<input type="password" placeholder="Confirm Password" />
			</div>
			<div class="u-form-group">
				<button>Sign Up</button>
			</div>
		</form>
	</div>
</body>
<div class="se-pre-con"></div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(".email-signup").hide();
		$("#signup-box-link").click(function() {
			$(".email-login").fadeOut(100);
			$(".email-signup").delay(100).fadeIn(100);
			$("#login-box-link").removeClass("active");
			$("#signup-box-link").addClass("active");
		});
		$("#login-box-link").click(function() {
			$(".email-login").delay(100).fadeIn(100);
			;
			$(".email-signup").fadeOut(100);
			$("#login-box-link").addClass("active");
			$("#signup-box-link").removeClass("active");
		});
	</script>
	<script type="text/javascript">
		function loadregister() {
			window.location.href = "business";
		}
	</script>
	<script src="<%=contextPath%>/js/login.js"></script>

	<!-- Google plus -->
	<script src="https://apis.google.com/js/api:client.js"></script>
	<script>
		var googleUser = {};
		var startApp = function() {
			gapi
			.load(
					'auth2',
					function() {
						// Retrieve the singleton for the GoogleAuth library and set up the client.
						auth2 = gapi.auth2
								.init({
									client_id : '670792160571-fb0b0akjjs8m312vphh5os6g521cbf5m.apps.googleusercontent.com',
									cookiepolicy : 'single_host_origin'
								// Request scopes in addition to 'profile' and 'email'
								//scope: 'additional_scope'
								});
						attachSignin(document
								.getElementById('customBtn'));
					});
		};

		function attachSignin(element) {
			debugger
			auth2.attachClickHandler(element, {}, function(googleUser) {
				var googleName = googleUser.getBasicProfile().getName();
				var googleEmail = googleUser.getBasicProfile().getEmail();
				
			/* 	alert(googleEmail); */
				$.ajax({
					url : URL + "login",
					type : "post",
					data : 'name=' + googleName + '&email=' + googleEmail
							+ '&status=2',
					success : function(response) {
						/* alert(response.authen); */
						// you will get response from your php page (what you echo or print)                 
						if (response.authen == "true") {
							window.location.replace("/");
						} else {
							window.location.reload();
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(textStatus, errorThrown);
						window.location.reload();
					}
				});
			}, function(error) {
				alert(JSON.stringify(error, undefined, 2));
			});
		}
		
		document.onreadystatechange = function () {
			  var state = document.readyState
			  if (state == 'complete') {
			      setTimeout(function(){
			          document.getElementById('interactive');
			         document.getElementById('load').style.visibility="hidden";
			      },1000);
			  }
			}
		$(document).ready(function(){
			var message = '<%=mes%>';
			
			if(message != null && message != "null"){
				$("#dialog_message").modal()
				<%session.removeAttribute("message");%>
			}
			
	    });
	</script>
	<script>
		startApp();
	</script>
</html>