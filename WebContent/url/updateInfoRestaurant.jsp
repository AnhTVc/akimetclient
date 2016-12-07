<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<%
	String contextPath = request.getContextPath();
%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Akimeet | Dành cho nhà hàng</title>

<meta name="description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta name="author" content="Akimeet">
<meta keywork="akimeet, akimeet.com, www.akimeet" content="">
<meta property="og:title" content="Akimeet - Tìm kiểm ưu đãi từ tất cả các nhà hàng, tất cả các dịch vụ" >
<meta  property="og:description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta property="og:type" content="website">
<meta name="robots" content="index, follow">
<meta property="og:url" content="https://www.akimeet.com/">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">

<!-- Custom Fonts -->
<link
	href="<%=contextPath%>/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="<%=contextPath%>/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="<%=contextPath%>/css/creative.min.css" rel="stylesheet">


<style type="text/css">
.form_input {
	margin-left: 30px;
	margin-right: 30px;
	margin-top: 20px;
	padding: 20px;
	width: 100%;
	height: 40px;;
	border: 2px solid #fff;
	background: none;
	border-radius: 6px;
	box-shadow: none;
	font-size: 14px;
	color:;
	padding: 20px;
}

.state_choose {
	margin-top: 20px;
	margin-left: 30px;
	width: 100%;
	background-color: #44c7f4;
	border: 2px solid #fff;
	border-radius: 2px;
	height: 44px;
	font-size: 14px;
}
</style>

</head>

<body id="page-top">

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">FoodDrink</a>
			</div>

			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<header>
		<div class="header-content">
			<div class="col-lg-6">
				<div class="header-content-inner">
					<h1 id="homeHeading">Lấp đầy bàn trống cho nhà hàng</h1>
					<hr>
					<p>Cập nhật tên nhà hàng</p>
					<p>Cập nhật địa chỉ nhà hàng</p>
					<p>Cung cấp thông tin liên hệ để chúng tôi liên lạc với bạn</p>
				</div>
			</div>
			<div class="col-lg-6">
				<form action="UpdateInfoRestaurant" method="post">
					<div class="col-sm-12">
						<h2>Cập nhật thông tin nhà hàng</h2>
						<div class="required">
							<input required="required" type="text" class="form_input"
								name="name_restaurant" id="name_restaurant"
								placeholder="Tên nhà hàng">
						</div>
					</div>
					<div class="col-sm-12">
						<div class="required">
							<div class="col-sm-3">
								<select id="city" name="city" title="Choose"
									class="state_choose">
									<option>Chọn thành phố</option>
									<option>Hà Nội</option>
									<option>Thành Phố HCM</option>

								</select>
							</div>
							<div class="col-sm-3">
								<select id="district" name="district"
									class="state_choose">
								</select>
							</div>
							<div class="col-sm-6">
								<input required="required" type="text" class="form_input"
									name="detail_address" placeholder="Địa chỉ chi tiết">
							</div>
						</div>
					</div>

					<div class="col-sm-12">
						<div class="required">
							<input required="required" type="text" class="form_input"
								name="contact_restaurant"
								placeholder="Thông tin liên hệ: e.g: Mr. Đức 0123456789">
						</div>
					</div>
					<button class="btn btn-primary btn-xl page-scroll" type="submit"
						style="margin-top: 30px;">Cập nhập thông tin</button>
				</form>
			</div>

		</div>
	</header>
</body>
<script src='<%=contextPath%>/lib/jquery/jquery.min.js'></script>
<script type="text/javascript"
	src="<%=contextPath%>/js/city_district.js"></script>
</html>
