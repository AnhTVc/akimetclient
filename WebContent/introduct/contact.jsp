<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String contextPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liên hệ với Akimeet</title>
<meta name="generator" content="MYOB">
<link href="<%=contextPath%>/images/favicon.png" rel="shortcut icon"
	type="image/vnd.microsoft.icon">
<link rel="stylesheet"
	href="<%=contextPath%>/lib/main/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/lib/main/css/sppagebuilder.css" type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/lib/main/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=contextPath%>/lib/main/css/template.css"
	type="text/css">
<link rel="stylesheet" href="<%=contextPath%>/lib/main/css/preset1.css"
	type="text/css" class="preset">
<style type="text/css">
#sp-bottom {
	padding: 100px 0px 0px;
}

.main-text {
	position: absolute;
	top: 50px;
	width: 96.66666666666666%;
	color: #FFF;
}

.btn-min-block {
	min-width: 170px;
	line-height: 26px;
}

.btn-clear {
	color: #FFF;
	background-color: transparent;
	border-color: #FFF;
	margin-right: 15px;
}

.btn-clear:hover {
	color: #000;
	background-color: #FFF;
}

.theiaStickySidebar:after {
	content: "";
	display: table;
	clear: both;
}

.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

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
<script src="<%=contextPath%>/lib/modernizr/2.8.2/modernizr.js"></script>
<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");
		;
	});
</script>

<script src="<%=contextPath%>/lib/main/js/jquery.min.js"
	type="text/javascript"></script>
<script src="<%=contextPath%>/lib/main/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="<%=contextPath%>/lib/main/js/main.js"
	type="text/javascript"></script>
</head>
<body
	class="site com-sppagebuilder view-page no-layout no-task itemid-101 en-gb ltr  sticky-header layout-fluid "
	style="margin-top: 70px;">
	<!-- header -->
	<div class="body-innerwrapper">
		<jsp:include page="/element/header.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<jsp:include page="/introduct/tabbar.jsp" />

				</div>
				<div class="col-sm-9"
					style="background-color: #fff; border: 1px solid #ccc; margin-top: 15px; overflow: hidden; padding: 10px 25px;">

					<h3 style="color: #f48221">Contact Us</h3>
					<p>Thank you for visiting akimeet.com. Take a moment to tell us
						how we’re doing, or you have any questions, feel free to ask us.</p>

					<div class="row">
						<div class="col-sm-8">
							<div class="col-sm-4"
								style="padding-top: 10px; margin-bottom: 5px">
								<p>Tôi là:</p>
							</div>
							<div class="col-sm-8" style="margin-bottom: 5px">
								<select class="form-control" id="sel1">
									<option>---Select---</option>
									<option>Khách hàng</option>
									<option>Nhà hàng</option>
									<option>Khác</option>
								</select>
							</div>
							<div class="col-sm-4"
								style="padding-top: 10px; margin-bottom: 5px">Họ và tên:</div>
							<div class="col-sm-8" style="margin-bottom: 5px">
								<div class="form-group">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="col-sm-4"
								style="padding-top: 10px; margin-bottom: 5px">Email:</div>
							<div class="col-sm-8" style="margin-bottom: 5px">
								<div class="form-group">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="col-sm-4"
								style="padding-top: 10px; margin-bottom: 5px">Số điện
								thoại:</div>
							<div class="col-sm-8" style="margin-bottom: 5px">
								<div class="form-group">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="col-sm-4"
								style="padding-top: 10px; margin-bottom: 5px">Nội dung:</div>
							<div class="col-sm-8" style="margin-bottom: 5px">
								<div class="form-group">
									<textarea class="form-control" rows="5" id="comment"></textarea>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="contact-img">
								<img src="http://offpeak.vn/assets/images/img_contact.png">
							</div>
						</div>
					</div>
					<hr>
					<div style="text-align: center; margin-bottom: 25px">
						<strong>www.akimeet.com</strong>
						<p>akimeet.com@gmail.com</p>
					</div>

				</div>

			</div>

		</div>
	</div>


</body>
</html>