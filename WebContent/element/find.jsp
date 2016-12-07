<%@page import="com.project.POJO.REST.SaleResult"%>
<%@page import="com.project.util.ProcessUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.POJO.REST.Campaign"%>
<%@page import="com.project.POJO.REST.Restaurant"%>
<%@page import="com.project.POJO.REST.SaleAddtionREST"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.project.POJO.REST.HomeRESTData"%>
<%@page import="com.project.POJO.REST.Sale"%>
<html lang="vi">
<%@ page pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	HttpSession httpSession = request.getSession();
	SaleResult saleResult = (SaleResult) httpSession.getAttribute("findresult");
	ArrayList<Restaurant> restaurants = saleResult.getRestaurants();
%>
<head>
<meta name="generator" content="MYOB">
<title>Akimeet | Tìm kiếm ưu đãi</title>
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
	class="site com-sppagebuilder view-page no-layout no-task itemid-101 en-gb ltr  sticky-header layout-fluid " style="margin-top: 70px;">
	<!-- header -->
	<div class="body-innerwrapper">
		<jsp:include page="/element/header.jsp"></jsp:include>
		<section id="sp-main-body" style="">
			<div class="row">
				<div id="sp-component" class="col-sm-12 col-md-12">
					<div class="sp-column ">
						<div id="system-message-container"></div>
						<div id="sp-page-builder" class="sp-page-builder  page-1">
							<div class="page-content">
								<jsp:include page="/element/menu.jsp"></jsp:include>
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
																	<a class="btn btn-primary" href="">Xem
																		thêm</a>
																</div>
															</div>
															<div class="row">
																<%
																	
																	Restaurant restaurant = null;
																	Sale sale = null;
																	if (restaurants.size() > 0) {
																		int i =0;
																		for (i = 0; i < restaurants.size(); i++) {
																			restaurant = restaurants.get(i);
																			sale = restaurant.getSales().get(0);
																			if (i % 4 == 0) {
															                              %>
															                              <div class="row">
															                                <%
															                                  }
												                                %>
																<div class="col-sm-6 col-md-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive"
																				src="<%=restaurant.getAvatar()%>" style="width: 100%; height: 130px;">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=sale.getId_sale()%>">Chi
																									tiết</a>
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
																				href="restaurant?id_sale=<%=sale.getId_sale()%>"><%=restaurant.getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=restaurant.getPoistion().getDistrict()%> - <%=restaurant.getPoistion().getCity()%> </span>
																			<br>
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
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 30) %> Người dùng</span></a>
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
									                                  if (i % 4 == 3) {
									                                %>
									                              </div>
									                              <%
									                                }
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

	<jsp:include page="/element/bottom.jsp" />
	<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>
	<script src="<%=contextPath%>/lib/jquery/jquery-ui.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=contextPath%>/lib/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="<%=contextPath%>/lib/jquery/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/js/city_district.js"></script>
	<!-- #endregion Jssor Slider End -->
	<!-- Auto complete -->
</body>

</html>