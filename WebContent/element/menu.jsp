<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu của akimeet</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);

.navbar-nav>li>.dropdown-menu {
	margin-top: 20px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
}

.navbar-default .navbar-nav>li>a {
	width: 200px;
	font-weight: bold;
}

.mega-dropdown {
	position: static !important;
	width: 100%;
}

.mega-dropdown-menu {
	padding: 20px 0px;
	width: 100%;
	box-shadow: none;
	-webkit-box-shadow: none;
}

.mega-dropdown-menu:before {
	content: "";
	border-bottom: 15px solid #fff;
	border-right: 17px solid transparent;
	border-left: 17px solid transparent;
	position: absolute;
	top: -15px;
	left: 285px;
	z-index: 10;
}

.mega-dropdown-menu:after {
	content: "";
	border-bottom: 17px solid #ccc;
	border-right: 19px solid transparent;
	border-left: 19px solid transparent;
	position: absolute;
	top: -17px;
	left: 283px;
	z-index: 8;
}

.mega-dropdown-menu>li>ul {
	padding: 0;
	margin: 0;
}

.mega-dropdown-menu>li>ul>li {
	list-style: none;
}

.mega-dropdown-menu>li>ul>li>a {
	display: block;
	padding: 3px 20px;
	clear: both;
	font-weight: normal;
	line-height: 1.428571429;
	color: #999;
	white-space: normal;
}

.mega-dropdown-menu>li ul>li>a:hover, .mega-dropdown-menu>li ul>li>a:focus
	{
	text-decoration: none;
	color: #444;
	background-color: #f5f5f5;
}

.mega-dropdown-menu .dropdown-header {
	color: #428bca;
	font-size: 18px;
	font-weight: bold;
}

.mega-dropdown-menu form {
	margin: 3px 20px;
}

.mega-dropdown-menu .form-group {
	margin-bottom: 3px;
}
</style>
<link rel="stylesheet"
	href="<%=contextPath%>/lib/main/css/bootstrap.min.css" />
<script src="<%=contextPath%>/lib/main/js/jquery.min.js"></script>

<script src="<%=contextPath%>/lib/main/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default" style="border-radius: 0px; background-color: none;">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target=".js-navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

		</div>


		<div class="collapse navbar-collapse js-navbar-collapse" style="background-color: f4f4f4 ">
			<ul class="nav navbar-nav">
				<li class="dropdown mega-dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">Ẩm thực
						&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down" aria-hidden="true"></i>
				</a>

					<ul class="dropdown-menu mega-dropdown-menu row">
						<li class="col-sm-3">
							<div style="margin-top: 25x;">
								<img
									src="https://media.foody.vn/res/g20/199275/prof/s480x300/foody-mobile-thai1-jpg-613-635932166894043510.jpg"
									class="img-responsive"
									alt="Ẩm thực | Akimeet | hình ảnh ẩm thực">
							</div>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Ưu đãi</li>
								<li><a href="Collection?type=specialSale">Ưu đãi đặc biệt</a></li>
								<li><a href="Collection?type=lastSale">Ưu đãi mới nhất</a></li>
								<li><a href="Collection?type=careSale">Được quan tâm nhiều nhất</a></li>
								<li class="divider"></li>

							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Chủ đề</li>
								<li><a href="tim-kiem-theo-chu-de?keyword=30001">Ăn vặt</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=30002">Góc phố</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=30003">Lãng mạn</a></li>
								<!-- <li class="divider"></li> -->
								<li><a href="tim-kiem-theo-chu-de?keyword=30004">Gia đình sum họp</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=30005">Nhiều hơn thế nữa</a></li>
								<li class="divider"></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Đồ ăn</li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40001">Buffer</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40002">Món Á</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40003">Món Âu</a></li>
								<li class="divider"></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40004">Món thái</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40005">Món hoa</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40006">Món dân tộc</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40007">Ăn chơi</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=40008">Nhiều hơn thế nữa</a></li>
							</ul>
						</li>
						<li class="col-sm-3"></li>
					</ul></li>

			</ul>

			<ul class="nav navbar-nav">
				<li class="dropdown mega-dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">Đồ uống
						&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down" aria-hidden="true"></i>
				</a>

					<ul class="dropdown-menu mega-dropdown-menu row">
						<li class="col-sm-3">
							<div style="padding: 10px">
								<img alt="Đồ uống | Akimeet | Hình ảnh cho đồ uống" src="https://media.foody.vn/res/g14/136610/prof/s480x300/foody-mobile-p3-jpg-572-635767224453333814.jpg">
							</div>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Chủ đề</li>
								<li><a href="tim-kiem-theo-chu-de?keyword=3101">Cafe sự kiện</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=3102">Giải khát</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=3103">Mộc</a></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Chủ đề</li>
								<li><a href="tim-kiem-theo-chu-de?keyword=3104">Cafe bóng đá</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=3105">Cafe sách</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=3106">Cafe thú cưng</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=3107">Cafe Phim</a></li>
							</ul>
						</li>
					</ul></li>

			</ul>

			<ul class="nav navbar-nav">
				<li class="dropdown mega-dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">Giải trí
						&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down" aria-hidden="true"></i>
				</a>

					<ul class="dropdown-menu mega-dropdown-menu row">
						<li class="col-sm-3">
							<div style="margin-top: 25px">
								<img alt="Giải trí | Akimeet | hình ảnh cho giải trí"
									src="https://media.foody.vn/res/g2/14767/prof/s480x300/foody-mobile-hmb-f-jpg-925-635780088947972317.jpg">
							</div>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Loại hình</li>
								<li><a href="tim-kiem-theo-chu-de?keyword=2102">Hát cho nhau nghe</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=2101">Karaoke</a></li>
								<li class="divider"></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=2103">Rạp chiếu phim</a></li>
								<li><a href="tim-kiem-theo-chu-de?keyword=2104">Khu vui chơi</a></li>
								<li class="divider"></li>
							</ul>
						</li>

						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Tổng quan</li>
								<li><a href="#">Tầm nhìn đẹp</a></li>
								<li><a href="#">Không gian mới lạ</a></li>
								<li><a href="#">Chất lượng hoàn hảo</a></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Giá cả</li>
								<li><a href="#">Sắp xếp từ thấp đến cao</a></li>
								<li><a href="#">Từ cao đến thấp</a></li>
								<li class="divider"></li>
								<li><a href="#">Giá bình dân</a></li>
								<li><a href="#">Sang trọng</a></li>
							</ul>
						</li>
					</ul></li>

			</ul>
			<ul class="nav navbar-nav">
				<li class="dropdown mega-dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">Làm đẹp
						&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down" aria-hidden="true"></i>
				</a>

					<ul class="dropdown-menu mega-dropdown-menu row">
						<li class="col-sm-3">
							<ul>

							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Spa</li>
								<li><a href="#">Chưa có dữ liệu</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Tóc</li>
								<li><a href="#">Chưa có dữ liệu</a></li>
							</ul>
						</li>

					</ul></li>

			</ul>
			<ul class="nav navbar-nav">
				<li class="dropdown mega-dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">Du lịch
						&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down" aria-hidden="true"></i>
				</a>

					<ul class="dropdown-menu mega-dropdown-menu row">
						<li class="col-sm-3">
							<ul>

							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Dịch vụ du lịch</li>
								<li><a href="#">Chưa có dữ liệu</a></li>

							</ul>
						</li>

					</ul></li>

			</ul>
		</div>
		<!-- /.nav-collapse --> </nav>
	</div>
</body>
</html>