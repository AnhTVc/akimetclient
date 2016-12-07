<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<html lang="vi">
<%@ page pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta name="author" content="Akimeet">
<meta keywork="akimeet, akimeet.com, www.akimeet" content="">
<meta property="og:title" content="Akimeet - Tìm kiểm ưu đãi từ tất cả các nhà hàng, tất cả các dịch vụ" >
<meta  property="og:description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta property="og:type" content="website">
<meta name="robots" content="index, follow">
<meta property="og:url" content="https://www.akimeet.com/">
<title>Solution for restaurant</title>
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

<!-- Bootstrap Core CSS -->
<style type="text/css">
#sp-bottom {
	padding: 100px 0px 0px;
}
.main-text
{
    position: absolute;
    top: 50px;
    width: 96.66666666666666%;
    color: #FFF;
}
.btn-min-block
{
    min-width: 170px;
    line-height: 26px;
}
.btn-clear
{
    color: #FFF;
    background-color: transparent;
    border-color: #FFF;
    margin-right: 15px;
}
.btn-clear:hover
{
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

</head>
<body id="page-top" class="index" style="min-height: 670px;">
	<!-- Navigation -->
	<jsp:include page="/element/header.jsp"></jsp:include>
	
	<section id="lastsafe" class="">
		<div class="container">
			<div class="row" style="padding-top: 10%">
				<div class="col-lg-1 col-xs-1 col-sm-1"></div>
				<div class="col-lg-10 text-center col-xs-10 col-sm-10">
					<h2 class="section-heading">Lịch sử đặt chỗ</h2>
				</div>
				<div class="col-lg-1 col-xs-1 col-sm-1"></div>
			</div>
			<table class="table table-bordered" style="text-align: center;">
			    <thead >
			      <tr >
			        <th style="text-align: center;">Ngày</th>
			        <th style="text-align: center;">Giờ</th>
			        <th style="text-align: center;">Tên nhà hàng</th>
			        <th style="text-align: center;">Ưu đãi</th>
			        <th style="text-align: center;">Trạng thái</th>
			      </tr>
			    </thead>
			    <tbody style="font-size: 14px;">
			      <tr>
			        <td>23-9-2008</td>
			        <td>11:30 AM</td>
			        <td><a href="domain.com:8080/fooddrink/restaurant?id_sale=123236" >Weta Coffee</a></td>
			        <td>78%</td>
			        <td style="color: red;">Đã xác nhận</td>
			      </tr>
			      <tr>
			        <td>23-9-2008</td>
			        <td>11:30 AM</td>
			        <td><a href="domain.com:8080/fooddrink/restaurant?id_sale=123236" >Weta Coffee</a></td>
			        <td>78%</td>
			        <td style="color: red;">Đã xác nhận</td>
			      </tr>
			    </tbody>
			  </table>
		</div>
	</section>
	<jsp:include page="/element/bottom.jsp"></jsp:include>
</body>
</html>