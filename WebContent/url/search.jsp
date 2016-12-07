<%@page import="com.project.util.ProcessUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.POJO.REST.Sale"%>
<%@page import="com.project.POJO.REST.Restaurant"%>
<%@page import="com.project.POJO.REST.SaleResult"%>
<%@page import="com.project.POJO.REST.Campaign"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
HttpSession httpSession = request.getSession();
SaleResult saleResult = (SaleResult) httpSession
		.getAttribute("sale_result_search");
%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Akimeet | Tìm kiếm nhà hàng</title>

<meta name="description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta name="author" content="Akimeet">
<meta keywork="akimeet, akimeet.com, www.akimeet" content="">
<meta property="og:title" content="Akimeet - Tìm kiểm ưu đãi từ tất cả các nhà hàng, tất cả các dịch vụ" >
<meta  property="og:description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta property="og:type" content="website">
<meta name="robots" content="index, follow">
<meta property="og:url" content="https://www.akimeet.com/">
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
.dropdown {
	/*   position: absolute; */
	/*  top:50%; */
	/*   transform: translateY(-50%); */
	
}

a {
	color: #fff;
}

.dropdown dd, .dropdown dt {
	margin: 0px;
	padding: 0px;
}

.dropdown ul {
	margin: -1px 0 0 0;
}

.dropdown dd {
	position: relative;
}

.dropdown a, .dropdown a:visited {
	text-decoration: none;
	outline: none;
	font-size: 13px;
}

.dropdown dt a {
	/* background-color: #4F6877; */
	display: block;
	padding: 8px 20px 5px 10px;
	min-height: 25px;
	line-height: 24px;
	overflow: hidden;
	border: 0;
	width: 272px;
}

.dropdown dt a span, .multiSel span {
	cursor: pointer;
	display: inline-block;
	padding: 0 3px 2px 0;
}

.dropdown dd ul {
	background-color: #eee;
	border: 0;
	color: #fff;
	display: none;
	line-height: 40px;
	left: 0px;
	padding: 2px 15px 2px 5px;
	position: absolute;
	top: 2px;
	/* 	width: 297px; */
	list-style: none;
	height: 100px;
	overflow: auto;
	color: #555555;
	border: 1px solid #ccc;
	z-index: 10;
}

.dropdown span.value {
	display: none;
}

.dropdown dd ul li a {
	padding: 5px;
	display: block;
}

.dropdown dd ul li a:hover {
	background-color: #fff;
}

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

<!--
Create by anhtvc -->.hida {
	color: #EA3D09;
	font-size: 18px;
}

.btn-delete-tag {
	width: 12px;
	height: 12px;
	background: #fff
		url('https://www.tablenow.vn/Style/Images/icons/btn-delete-tag.png')
		no-repeat;
	position: absolute;
	z-index: 4;
	top: -6px;
	right: 10px;
	cursor: pointer;
	border-radius: 50%;
}

.btn-delete-tag-topic {
	width: 12px;
	height: 12px;
	background: #fff
		url('https://www.tablenow.vn/Style/Images/icons/btn-delete-tag.png')
		no-repeat;
	position: absolute;
	z-index: 4;
	top: -6px;
	right: 10px;
	cursor: pointer;
	border-radius: 50%;
}

.btn-delete-tag-culinary {
	width: 12px;
	height: 12px;
	background: #fff
		url('https://www.tablenow.vn/Style/Images/icons/btn-delete-tag.png')
		no-repeat;
	position: absolute;
	z-index: 4;
	top: -6px;
	right: 10px;
	cursor: pointer;
	border-radius: 50%;
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
<body style="background-color: #fff">
	<jsp:include page="/element/header.jsp"></jsp:include>
	<div class="" style="margin-top: 80px;">
		<div class="row" style="margin-bottom: -10px">
			<div class="col-sm-1"></div>
			<div class="col-sm-1" style="margin-right: 35px;">
				<select class="dropbtn" style="min-height: auto">
					<option>Hà Nội</option>
					<option>Hồ Chí Minh</option>
					<option>Đà Nẵng</option>
				</select>
			</div>
			<div class="col-sm-4">
				<div class="form-inner">
					<div class="sppb-addon-container " style="">
						<div class="ajax-product-search" style="border: 1px solid #ccc;">
							<form class="product-search-form" action="tim-kiem-uu-dai-khi-dat-ban" method="get">
								<div class="form-inner">
									<input name="keyword" class="form-control input-product-search"
										class="ajax-typeahead" placeholder="Tìm kiếm tất cả mọi thứ"
										style="min-height: auto" autocomplete="on" type="text"
										data-provide="typeahead">
									<button type="submit" class="btn "
										style="min-height: auto; height: auto; margin-top: 5px;">
										<i class="fa fa-search " aria-hidden="true"
											style="height: 100%"></i>
									</button>
								</div>
							</form>
							<div class="product-search-results" style="display: none;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="background-color: #eee; margin-top: 10px;">
			<div class="col-sm-1"></div>
			<div class="col-sm-3">
				<dl class="dropdown address"
					style="border: 1px solid #ccc; margin-top: 15px;">
					<dt>
						<a href="#" style="font-size: 14px;"> <span class="hida"
							style="font-size: 14px; color: #555555"> <i
								class="fa fa-caret-down" aria-hidden="true">&nbsp;&nbsp;&nbsp;
									ĐỊA ĐIỂM </i>
						</span>

						</a>
					</dt>
					<dd>
						<div class="mutliSelect " style="font-size: 14px; color: #555555">
							<ul style="height: auto;">
								<li><input type="checkbox" value="100" />
									&nbsp;&nbsp;&nbsp;Quận Ba Đình</li>
								<li><input type="checkbox" value="105" />
									&nbsp;&nbsp;&nbsp;Quận Cầu Giấy</li>
								<li><input type="checkbox" value="102" />
									&nbsp;&nbsp;&nbsp;Quận Đống Đa</li>
								<li><input type="checkbox" value="114" />
									&nbsp;&nbsp;&nbsp;Quận Hà Đông</li>
								<li><input type="checkbox" value="102" />
									&nbsp;&nbsp;&nbsp;Quận Hai Bà Trưng</li>
								<li><input type="checkbox" value="101" />
									&nbsp;&nbsp;&nbsp;Quận Hoàn Kiếm</li>
								<li><input type="checkbox" value="107" />
									&nbsp;&nbsp;&nbsp;Quận Hoàng Mai</li>
								<li><input type="checkbox" value="108" />
									&nbsp;&nbsp;&nbsp;Quận Long Biên</li>
								<li><input type="checkbox" value="104" />
									&nbsp;&nbsp;&nbsp;Quận Tây Hồ</li>
								<li><input type="checkbox" value="106" />
									&nbsp;&nbsp;&nbsp;Quận Thanh Xuân</li>
								<li><input type="checkbox" value="129" />
									&nbsp;&nbsp;&nbsp;Quận Nam Từ Liêm</li>
								<li><input type="checkbox" value="115" />
									&nbsp;&nbsp;&nbsp;Thị xã Sơn Tây</li>
								<li><input type="checkbox" value="130" />
									&nbsp;&nbsp;&nbsp;Quận Bắc Từ Liêm</li>
							</ul>

						</div>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dropdown topic"
					style="border: 1px solid #ccc; margin-top: 15px;">
					<dt>
						<a href="#" style="font-size: 14px;"> <span class="hida"
							style="font-size: 14px; color: #555555"> <i
								class="fa fa-caret-down" aria-hidden="true">&nbsp;&nbsp;&nbsp;
									CHỦ ĐỀ </i>
						</span>

						</a>
					</dt>
					<dd>
						<div class="mutliSelectTopic"
							style="font-size: 14px; color: #555555">
							<ul style="height: auto;">
								<li><input type="checkbox" value="30001" />
									&nbsp;&nbsp;&nbsp;Ăn vặt</li>
								<li><input type="checkbox" value="30002" />
									&nbsp;&nbsp;&nbsp;Góc phố</li>
								<li><input type="checkbox" value="30003" />
									&nbsp;&nbsp;&nbsp;Lãng mạn</li>
								<li><input type="checkbox" value="30004" />
									&nbsp;&nbsp;&nbsp;Gia đình sum họp</li>
								<li><input type="checkbox" value="30005" />
									&nbsp;&nbsp;&nbsp;Nhiều hơn thế nữa</li>
							</ul>

						</div>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dropdown culinary"
					style="border: 1px solid #ccc; margin-top: 15px;">
					<dt>
						<a href="#" style="font-size: 14px;"> <span class="hida"
							style="font-size: 14px; color: #555555"> <i
								class="fa fa-caret-down" aria-hidden="true">&nbsp;&nbsp;&nbsp;
									ẨM THỰC </i>
						</span>

						</a>
					</dt>
					<dd>
						<div class="mutliSelectCulinary"
							style="font-size: 14px; color: #555555">
							<ul style="height: auto;">
								<li><input type="checkbox" value="40001" />
									&nbsp;&nbsp;&nbsp;Buffer</li>
								<li><input type="checkbox" value="40002" />
									&nbsp;&nbsp;&nbsp;Món Á</li>
								<li><input type="checkbox" value="40003" />
									&nbsp;&nbsp;&nbsp;Món Âu</li>
								<li><input type="checkbox" value="40004" />
									&nbsp;&nbsp;&nbsp;Món Thái</li>
								<li><input type="checkbox" value="40005" />
									&nbsp;&nbsp;&nbsp;Món Hoa</li>
								<li><input type="checkbox" value="40006" />
									&nbsp;&nbsp;&nbsp;Món dân tộc</li>
								<li><input type="checkbox" value="40007" />
									&nbsp;&nbsp;&nbsp;Ăn chơi</li>
								<li><input type="checkbox" value="40008" />
									&nbsp;&nbsp;&nbsp;Nhiều hơn thế nữa</li>
							</ul>

						</div>
					</dd>
				</dl>
			</div>
			<div class="col-sm-2">
				<p style="margin-top: 25px;"><%=saleResult.getRestaurants().size() %> kết quả tìm kiếm cho "<%=request.getAttribute("keyword") %>"</p>
			</div>
		</div>
		<div class="row" style="margin-top: 25px;">
			<div class="col-sm-4"></div>
			<div class="col-sm-2">
				<span class="multiSelCulinary"
					style="cursor: pointer; text-align: center; width: 100%; padding: 0 7px; display: none; background-color: #F38140; color: #fff; border-radius: 2px; -webkit-border-radius: 2px;">Chủ
					đề</span> <span class="btn-delete-tag-culinary" style="display: none"></span>
			</div>
			<div class="col-sm-2">
				<span class="multiSel"
					style="cursor: pointer; text-align: center; width: 100%; padding: 0 7px; display: none; background-color: #F38140; color: #fff; border-radius: 2px; -webkit-border-radius: 2px;">Địa
					điểm</span> <span class="btn-delete-tag" style="display: none"></span>
			</div>
			<div class="col-sm-2">
				<span class="multiSelTopic"
					style="cursor: pointer; text-align: center; width: 100%; padding: 0 7px; display: none; background-color: #F38140; color: #fff; border-radius: 2px; -webkit-border-radius: 2px;">Chủ
					đề</span> <span class="btn-delete-tag-topic" style="display: none"></span>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>


	<script type="text/javascript">
		$(".address dt a").on('click', function() {
			$(".address dd ul").slideToggle('fast');
		});

		$(".topic dt a").on('click', function() {
			$(".topic dd ul").slideToggle('fast');
		});

		$(".culinary dt a").on('click', function() {
			$(".culinary dd ul").slideToggle('fast');
		});
		$(".dropdown dd ul li a").on('click', function() {
			$(".dropdown dd ul").hide();
		});

		function getSelectedValue(id) {
			return $("#" + id).find("dt a span.value").html();
		}

		$(document).bind('click', function(e) {
			var $clicked = $(e.target);
			if (!$clicked.parents().hasClass("dropdown"))
				$(".dropdown dd ul").hide();
		});
		var count = 0;
		var data = '';
		var address = [];
		var topics = [];
		var culinary = [];
		$('.mutliSelect input[type="checkbox"]').on(
				'click',

				function() {
					var title = $(this).closest('.mutliSelect').find(
							'input[type="checkbox"]').val(), title = $(this)
							.val();

					if ($(this).is(':checked')) {
						count += 1;
						var html = '<span title="' + title + '">' + title
								+ '</span>';
						$('.multiSel').css({
							display : "inline-block"
						});
						$('.btn-delete-tag').show();
						$('.multiSel').html(
								'<span title="' + count + '">Địa điểm ('
										+ count + ')</span>');
						/* $(".hida").hide(); */

						address.push(title);
					} else {
						count -= 1;
						debugger;
						$('.multiSel').html(
								'<span title="' + count + '">Địa điểm ('
										+ count + ')</span>');
						for (i = 0; i < address.length; i++) {
							if (address[i] == title)
								delete address[i];
						}
					}

					//Goi len server lay du lieu
					data = 'type=filter&A=' + address + '&T=' + topics + '&C=' + culinary;
					filter();

				});

		var countTopic = 0;
		$('.mutliSelectTopic input[type="checkbox"]').on(
				'click',
				function() {
					var title = $(this).closest('.mutliSelectTopic').find(
							'input[type="checkbox"]').val(), title = $(this)
							.val();
					if ($(this).is(':checked')) {
						countTopic += 1;
						var html = '<span title="' + title + '">' + title
								+ '</span>';
						$('.multiSelTopic').css({
							display : "inline-block"
						});
						$('.btn-delete-tag-topic').show();
						$('.multiSelTopic').html(
								'<span title="' + count + '">Chủ đề ('
										+ countTopic + ')</span>');
						topics.push(title);
						/* $(".hida").hide(); */
					} else {
						countTopic -= 1;
						$('.multiSelTopic').html(
								'<span title="' + countTopic + '">Địa điểm ('
										+ countTopic + ')</span>');
						for (i = 0; i < topics.length; i++) {
							if (topics[i] == title)
								delete topics[i];
						}
					}
					data = 'type=filter&A=' + address + '&T=' + topics + '&C=' + culinary;
					filter();
				});

		var countCulinary = 0;
		$('.mutliSelectCulinary input[type="checkbox"]').on(
				'click',

				function() {
					var title = $(this).closest('.mutliSelectCulinary').find(
							'input[type="checkbox"]').val(), title = $(this)
							.val();

					debugger;
					if ($(this).is(':checked')) {
						countCulinary += 1;
						var html = '<span title="' + title + '">' + title
								+ '</span>';
						$('.multiSelCulinary').css({
							display : "inline-block"
						});
						$('.btn-delete-tag-culinary').show();
						$('.multiSelCulinary').html(
								'<span title="' + count + '">Ẩm thực ('
										+ countCulinary + ')</span>');
						/* $(".hida").hide(); */
						culinary.push(title);
					} else {
						countCulinary -= 1;
						$('.multiSelCulinary').html(
								'<span title="' + countCulinary + '">Ẩm thực ('
										+ countCulinary + ')</span>');
						for (i = 0; i < culinary.length; i++) {
							if (culinary[i] == title)
								delete culinary[i];
						}
					}
					data = 'type=filter&A=' + address + '&T=' + topics + '&C=' + culinary;
					filter();
				});

		function filter() {
			$.ajax({
				url : "tim-kiem-uu-dai-khi-dat-ban",
				type : "get",
				data : data,
				success : function(response) {
					//alert(response.result);
					// you will get response from your php page (what you echo or print)                 
					if (response.result == "true") {
						window.location.reload();
					} else {
						window.location.reload();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(textStatus, errorThrown);
					window.location.reload();
				}
			});
		}
	</script>

	<section class="sppb-section " style="margin: 0px; padding: 70px 0;">
	<div class="sppb-container">
		<div class="sppb-row">
			<div class="sppb-col-sm-12">
				<div class="sppb-addon-container " style="">
					<div class="sppb-addon sppb-addon-items items-featured ">
						<div class="sppb-addon-content">
							<div class="sppb-addon-header clearfix">
								<div class="pull-left">
									<h3>Tìm kiếm ưu đãi</h3>
								</div>
								<!-- <div class="pull-right">
									<a class="btn btn-primary" href="/items?sort=featured">Xem
										thêm</a>
								</div> -->
							</div>
							<div class="row">
								<%
								
									if (saleResult.getRestaurants() != null) {
										for (int i = 0; i < saleResult.getRestaurants().size(); i++) {
											
											Restaurant restaurant = saleResult.getRestaurants().get(i);
											Sale sale = restaurant.getSales().get(0);
								%>
								<div class="col-sm-6 col-md-3">
									<div class="product-template">
										<figure> <img class="img-responsive"
											src="<%=restaurant.getAvatar()%>"> <figcaption>
										<div class="vertical-middle">
											<div>
												<div class="links">
													<div>
														<a class="link-item-details btn btn-primary btn-md"
															href="restaurant?id_sale=<%=sale.getId_sale()%>">Chi
															tiết</a>
													</div>
												</div>
											</div>
										</div>
										</figcaption> </figure>
										<div class="item-header">
											<h3>
												<a
													href="restaurant?id_sale=<%=sale.getId_sale()%>"><%=restaurant.getName_restaurant()%></a>
											</h3>
											<span class="item-seller">Ở <a
												href="/profile/DesigningWorld"><%=restaurant.getPoistion().getDetail() %></a></span> <span
												class="item-category"><%=restaurant.getPoistion().getDistrict() %> - <%=restaurant.getPoistion().getCity() %> </span><br>
											<!-- Thời gian -->
											<%
												ArrayList<String> times = ProcessUtil.splitStringBySub(
																sale.getTime(), ";");
														if (times != null || times.size() <= 0) {
															if (times.size() == 1) {
											%>
											<span class="label label-success label-time-safe"
												style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
											<%
												} else if (times.size() > 1) {
											%>
											<span class="label label-success label-time-safe"
												style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
											<span class="label label-success label-time-safe"
												style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(1)%></span>
											<%
												} else {
											%>
											<span class="label label-success label-time-safe"
												style="font-size: 11px; margin: 0; background-color: #158C0B">Áp
												dụng tất cả khung giờ</span>
											<%
												}
														}
											%>
											<!-- Kết thúc thời gian -->
											<p
												style="font-style: normal; font-size: 12px; margin-top: 15px; color: #9E8D0C">
												Áp dụng từ
												<%=sale.getFrom_date()%>
												tới
												<%=sale.getTo_date()%></p>
										</div>
										<div class="product-meta clearfix">
											<form class="cart" method="post">
												<input name="product_cart" value="1525996" type="hidden">
												<a class="item-add-to-cart" href="#"><span
													class="product-purchased" data-toggle="tooltip"
													data-placement="top" title=""
													data-original-title="Click to add to cart"><i
														class="sb-icon-cart"></i> 11 Người dùng</span></a>
											</form>
											<form class="purchase" action="/cart" method="get">
												<input name="item_id" value="1525996" type="hidden">
												<button type="submit" class="product-purchase"
													style="background-color: #EA3D09">
													<span> <span class="product-price"> <span><%=sale.getSale_off()%></span><span>%</span>
													</span>
													</span>
												</button>
											</form>
										</div>
									</div>
								</div>
								<%
									}
									}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<%@include file="/element/bottom.jsp" %>
</body>
</html>