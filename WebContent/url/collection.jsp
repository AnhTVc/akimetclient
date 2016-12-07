<%@page import="com.project.POJO.REST.SaleResult"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.project.util.ProcessUtil"%>
<%@page import="com.project.util.constant.*"%>
<%@page import="com.project.POJO.REST.SaleAddtionREST"%>
<%@page import="com.project.POJO.REST.Sale"%>
<%@page import="com.project.POJO.REST.Restaurant"%>
<%@page import="com.project.POJO.REST.Campaign"%>
<%@page import="com.project.POJO.REST.SaleAddtion"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<html lang="vi">
<%@ page pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String URL = Config.URL_DOMAIN + "/akimeet/";
	HttpSession httpSession = request.getSession();
	SaleResult saleAddtion = (SaleResult) httpSession
			.getAttribute("sale_addtion");
%>
<head>

<title>Akimeet | Tìm kiếm ưu đãi</title>

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
	background: url(//akimeet.com/images/load.gif) center no-repeat #fff;
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
<script src="<%=contextPath%>/lib/main/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="<%=contextPath%>/lib/main/js/main.js"
	type="text/javascript"></script>
<script src="<%=contextPath%>/lib/jquery/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/js/city_district.js"></script>
</head>
<body class="site com-sppagebuilder view-page no-layout no-task itemid-101 en-gb ltr  sticky-header layout-fluid " style="margin-top: 70px;">
	<!-- Navigation -->
	<jsp:include page="/element/header.jsp"></jsp:include>
	<div class="body-innerwrapper">
		<section id="sp-main-body" style="">
			<div class="row">
				<div id="sp-component" class="col-sm-12 col-md-12">
					<div class="sp-column ">
						<div id="system-message-container"></div>
						<div id="sp-page-builder" class="sp-page-builder  page-1">
							<div class="page-content">
								<section class="sppb-section "
									style="margin: 0px; padding: 70px 0;">
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
																<div class="pull-right">
																	<a class="btn btn-primary" href="/items?sort=featured">Xem thêm</a>
																</div>
															</div>
															<div class="row">
																<%
																if(saleAddtion != null){
																	for (int i = 0; i < saleAddtion.getRestaurants().size(); i++) {
																		Restaurant restaurant = saleAddtion.getRestaurants().get(i);
																		Sale sale = restaurant.getSales().get(0);
																	
																%>
																<div class="col-sm-6 col-md-3" style="margin-top: 30px;">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" height="100px" title="Akimeet | <%=restaurant.getName_restaurant() %>"
																				src="<%=restaurant.getAvatar()%>">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=sale.getId_sale()%>">Chi tiết</a>
																							</div>
																						</div>
																					</div>
																				</div>
																			</figcaption>
																		</figure>
																		<div class="item-header">
																			<h3>
																				<a
																					href="restaurant?id_sale=<%=sale.getId_sale()%>"><%=restaurant.getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=sale.getId_sale()%>">44 Trần đại nghĩa</a></span> <span
																				class="item-category">Hai bà trưng - Hà nội
																			</span>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(sale
																					.getTime(), ";");																				
																						if(times != null || times.size() <= 0){
																							if(times.size() == 1){
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(i)%></span>
																								<%
																							}else if(times.size() > 1){
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(1)%></span>
																								<%
																							}else{
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B">Áp dụng tất cả khung giờ</span>
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
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> 11 Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase" style="background-color: #EA3D09">
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
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- End -->
	<%@include file="/element/bottom.jsp" %>
</body>
<div class="se-pre-con"></div>

</html>