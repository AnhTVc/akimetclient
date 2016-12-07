<%@page import="com.project.POJO.REST.Home"%>
<%@page import="com.project.POJO.REST.Drink"%>
<%@page import="com.project.POJO.REST.Entertainment"%>
<%@page import="com.project.util.ProcessUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.POJO.REST.Campaign"%>
<%@page import="com.project.POJO.REST.SaleResult"%>
<%@page import="com.project.POJO.REST.SpecialSale"%>
<%@page import="com.project.POJO.REST.LastSale"%>
<%@page import="com.project.POJO.REST.CareSale"%>
<%@page import="com.project.POJO.REST.HomeRESTData"%>
<html lang="vi">
<%@ page pageEncoding="UTF-8"%>
<head>
<%
	String contextPath = request.getContextPath();
	HttpSession httpSession = request.getSession();
	//Dữ liệu trang home
	Home home = (Home) session
	.getAttribute("home_data");
	
	SaleResult careSale = home.getCare_sale();
	SaleResult lastSale = home.getLast_sale();
	SaleResult specialSale = home.getSpecial_sale();
	SaleResult sale_bussiness = home.getSale_business();

	
	// Update new for form :))
	Entertainment entertainment = (Entertainment) session.getAttribute("entertainment");
	Drink drink = (Drink) session.getAttribute("drink");
%>
<meta name="google-site-verification" content="rKNr80_lzlHrX0uMX4GD4X90Dkp018CqUjpYrIQAy7Q" />

<title>AkiMeet - giải pháp đặt chỗ và nhận ưu đãi</title>

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

<link rel="stylesheet" href="<%=contextPath%>/css/index.css"
	type="text/css" class="preset">
	
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
	
<!-- Notify web app -->
<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async='async'></script>
<script type="text/javascript">
var OneSignal = window.OneSignal || [];
OneSignal.push(["init", {
  appId: "7063d9ee-4031-4a82-985e-0d9e21837c6d",
  autoRegister: true, /* Set to true to automatically prompt visitors */
  subdomainName: 'akimeet.onesignal.com',
  notifyButton: {
      enable: true /* Set to false to hide */
  }
}]);
</script>

<!-- End Notify web app -->
</head>
<body
	class="site com-sppagebuilder view-page no-layout no-task itemid-101 en-gb ltr  sticky-header layout-fluid ">
	<div class="body-innerwrapper">
		<jsp:include page="/element/header.jsp"></jsp:include>

		<!-- Body -->
		<section id="sp-main-body" style="">
			<div class="row">
				<div id="sp-component" class="col-sm-12 col-md-12">
					<div class="sp-column ">
						<div id="system-message-container"></div>
						<div id="sp-page-builder" class="sp-page-builder  page-1">
							<div class="page-content">
								<section class="sppb-section  section-intro"
									>
									<!-- Body header -->
									<div id="carousel-example-generic" class="carousel slide"
										data-ride="carousel">
										<div class="carousel-inner"  style="float: center; left: none; height: 300px;">
											<div class="item active">
												<img src="<%=contextPath %>/images/gal2.jpg"
													alt="Akimeet - đặt bàn miễn phí" title="Akimeet - Đặt bàn miễn phí">
											<div class="item" style="float: center; left: none">
												<img src="<%=contextPath %>/images/gal1.jpg" style="width: 100%; height: 100%"
													alt="Akimeet - đặt bàn miễn phí" title="Akimeet - Đặt bàn miễn phí">
											</div>
											</div>
											<div class="item">
												<img src="<%=contextPath %>/images/gal3.jpg"
													alt="Akimeet - đặt bàn miễn phí" title="Akimeet - Đặt bàn miễn phí">
												
											</div>
										</div>
										
									</div>
									<div class="main-text hidden-xs sppb-container" style="color: #EA3D09; margin-top: 3%">
										<div class="col-md-12 text-center">
											<div class="sppb-section-title sppb-text-center">
											<h2 class="sppb-title-heading" style="">
												<span style="font-weight: 600">AkiMeet</span>
											</h2>
											<p class="sppb-title-subheading" style="color: white; font-size: 24px;">Lấy ưu đãi ăn uống mà
												không hề phải thành toán trước.</p>
										</div>
										<div class="sppb-row">
											<div class="sppb-col-sm-3">
												<div class="sppb-addon-container " style=""></div>
											</div>
											<div class="sppb-col-sm-6">
												<div class="sppb-addon-container " style="">
													<div class="ajax-product-search">
														<form class="product-search-form" action="tim-kiem-uu-dai-khi-dat-ban"
															method="get">
															<div class="form-inner">
																<input name="keyword"
																	class="form-control input-product-search" class="ajax-typeahead"
																	placeholder="Tìm kiếm tất cả mọi thứ"
																	autocomplete="on" type="text" data-provide="typeahead">
																<button type="submit" class="btn btn-primary ">
																	<i class="fa fa-search fa-lg" aria-hidden="true"></i>
																</button>
															</div>
														</form>
														<div class="product-search-results" style="display: none;"></div>
													</div>
												</div>
											</div>
											<div class="sppb-col-sm-3">
												<div class="sppb-addon-container " style=""></div>
											</div>
										</div>
										</div>
									</div>
									<!-- Menu -->
									<jsp:include page="/element/menu.jsp"></jsp:include>
									<!-- End header -->
								</section>
								
								<section class="sppb-section">
									
									<div class="container" >

										<ul class="nav nav-tabs" role="tablist" >
											<li style="background-color: #d2845e"><a style="color: #fff; font-size: 16px; padding-left: 35px; padding-right: 35px;" ><i class="fa fa-cutlery" aria-hidden="true"></i>
											Ẩm thực</a></li>
											<li class="active"><a href="#home-new-1"
												aria-controls="home-new" role="tab" data-toggle="tab">Ưu
													đãi đặc biệt</a></li>
											<li><a href="#home-bestseller-1"
												aria-controls="home-bestseller" role="tab" data-toggle="tab">Ưu
													đãi mới nhất</a></li>
											<li><a href="#home-discount-1"
												aria-controls="home-discount" role="tab" data-toggle="tab">Quan
													tâm nhất</a></li>
											
										</ul>
										<div class="tab-content" style="padding: 0">

											<div class="tab-pane active" id="home-new-1"
												data-impress-list-title="Home | Ẩm thực | Ưu đãi đặc biệt">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<div class="row">
																<%
																	for(int i = 0; i < specialSale.getRestaurants().size(); i++){
																		if (i % 4 == 0) {
												                              %>
												                              <div class="row">
												                                <%
												                                  }
												                                %>
																<div class="col-sm-6 col-md-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" alt="<%=specialSale.getRestaurants().get(i).getName_restaurant()%>" 
																				title="Akimeet | <%=specialSale.getRestaurants().get(i).getName_restaurant()%>" data-title="Akimeet | <%=specialSale.getRestaurants().get(i).getName_restaurant()%>"
																				src="<%=specialSale.getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=specialSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi tiết</a>
																							</div>
																						</div>
																					</div>
																				</div>
																			</figcaption>
																		</figure>
																		<div class="item-header">
																			<h3>
																				<a
																					href="restaurant?id_sale=<%=specialSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=specialSale.getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=specialSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=specialSale.getRestaurants().get(i).getPoistion().getDetail() %></a></span> <span
																				class="item-category"><%=specialSale.getRestaurants().get(i).getPoistion().getDistrict() %> - <%=specialSale.getRestaurants().get(i).getPoistion().getCity() %>
																			</span><br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(specialSale.getRestaurants().get(i).getSales().get(0)
																					.getTime(), ";");																				
																						if(times != null || times.size() <= 0){
																							if(times.size() == 1){
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
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
																				<%=specialSale.getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=specialSale.getRestaurants().get(i).getSales().get(0).getTo_date()%></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200) %> Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
													 							<button type="submit" class="product-purchase" style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=specialSale.getRestaurants().get(i).getSales().get(0).getSale_off() %></span><span>%</span>
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
																%>
															</div>
														</div>
													</div>
												</div>
												<a class="home-see-all"
													href="/sach-tieng-viet-noi-bat/c1419"> Xem tất cả ưu
													đãi đặc biệt &nbsp;<i class="fa fa-caret-right"></i>
												</a>
											</div>
											<div class="tab-pane " id="home-bestseller-1"	data-impress-list-title="Home | Ẩm thực | Ưu đãi mới nhất">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<div class="row">
																<%
																for(int i = 0; i < 4; i++){
																%>
																<div class="col-sm-6 col-md-3">
																	<div class="product-template">
																		<figure>
																			<img title="Akimeet | <%=lastSale.getRestaurants().get(i).getName_restaurant()%>" 
																				data-title="Akimeet | <%=lastSale.getRestaurants().get(i).getName_restaurant()%>"
																				class="img-responsive"
																				src="<%=lastSale.getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=lastSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi tiết</a>
																							</div>
																						</div>
																					</div>
																				</div>
																			</figcaption>
																		</figure>
																		<div class="item-header">
																			<h3>
																				<a
																					href="restaurant?id_sale=<%=lastSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=lastSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getPoistion().getDetail()%></a></span> <span
																				class="item-category"><%=lastSale.getRestaurants().get(i).getPoistion().getDistrict()%> - <%=lastSale.getRestaurants().get(i).getPoistion().getCity()%>
																			</span><br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(lastSale.getRestaurants().get(i).getSales().get(0)
																					.getTime(), ";");																				
																						if(times != null || times.size() <= 0){
																							if(times.size() == 1){
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
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
																				<%=lastSale.getRestaurants().get(i).getSales().get(0).getFrom_date()%>
																				tới
																				<%=lastSale.getRestaurants().get(i).getSales().get(0).getTo_date()%></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200) %> Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase" style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=lastSale.getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
																					</span>
																					</span>
																				</button>
																			</form>
																		</div>
																	</div>
																</div>
																<%
																	}
																%>
															</div>
															<div class="row">
																<%
																for(int i = 4; i < 8; i++){
																%>
																<div class="col-sm-6 col-md-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=lastSale.getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=lastSale.getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=lastSale.getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=lastSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi tiết</a>
																							</div>
																						</div>
																					</div>
																				</div>
																			</figcaption>
																		</figure>
																		<div class="item-header">
																			<h3>
																				<a
																					href="restaurant?id_sale=<%=lastSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=lastSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getPoistion().getDetail()%></a></span> <span
																				class="item-category"><%=lastSale.getRestaurants().get(i).getPoistion().getDistrict()%> - <%=lastSale.getRestaurants().get(i).getPoistion().getCity()%>
																			</span><br>
																			<br><!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(lastSale.getRestaurants().get(i).getSales().get(0)
																					.getTime(), ";");																				
																						if(times != null || times.size() <= 0){
																							if(times.size() == 1){
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
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
																				<%=lastSale.getRestaurants().get(i).getSales().get(0).getFrom_date()%>
																				tới
																				<%=lastSale.getRestaurants().get(i).getSales().get(0).getTo_date()%></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200) %> Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase" style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=lastSale.getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
																					</span>
																					</span>
																				</button>
																			</form>
																		</div>
																	</div>
																</div>
																<%
																	}
																%>
															</div>
														</div>
													</div>
												</div>
												<a class="home-see-all"
													href="/sach-tieng-viet-noi-bat/c1419"> Xem tất cả ưu đãi mới nhất &nbsp;<i class="fa fa-caret-right"></i>
												</a>
											</div>
											<div class="tab-pane" id="home-discount-1"
												data-impress-list-title="Home | Ẩm thực | Ưu đãi quan tâm nhất">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<div class="row">
																<%
																for(int i = 0; i < 4; i++){
																%>
																<div class="col-sm-6 col-md-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=careSale.getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=careSale.getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=careSale.getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi tiết</a>
																							</div>
																						</div>
																					</div>
																				</div>
																			</figcaption>
																		</figure>
																		<div class="item-header">
																			<h3>
																				<a
																					href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getPoistion().getDetail()%></a></span> <span
																				class="item-category"><%=lastSale.getRestaurants().get(i).getPoistion().getDistrict() %> - <%=lastSale.getRestaurants().get(i).getPoistion().getCity() %>
																			</span>
																			<br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(careSale.getRestaurants().get(i).getSales().get(0)
																					.getTime(), ";");																				
																						if(times != null || times.size() <= 0){
																							if(times.size() == 1){
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
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
																				<%=careSale.getRestaurants().get(i).getSales().get(0).getFrom_date()%>
																				tới
																				<%=careSale.getRestaurants().get(i).getSales().get(0).getTo_date()%></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200) %> Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase" style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=careSale.getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
																					</span>
																					</span>
																				</button>
																			</form>
																		</div>
																	</div>
																</div>
																<%
																	}
																%>
															</div>
															<div class="row">
																<%
																for(int i = 4; i < 8; i++){
																%>
																<div class="col-sm-6 col-md-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=careSale.getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=careSale.getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=careSale.getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi tiết</a>
																							</div>
																						</div>
																					</div>
																				</div>
																			</figcaption>
																		</figure>
																		<div class="item-header">
																			<h3>
																				<a
																					href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i).getPoistion().getDetail()%></a></span> <span
																				class="item-category"><%=lastSale.getRestaurants().get(i).getPoistion().getDistrict() %> - <%=lastSale.getRestaurants().get(i).getPoistion().getCity() %>
																			</span>
																			<br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(careSale.getRestaurants().get(i).getSales().get(0)
																					.getTime(), ";");																				
																						if(times != null || times.size() <= 0){
																							if(times.size() == 1){
																								%>
																								<span class="label label-success label-time-safe" style="font-size: 11px; margin: 0; background-color: #158C0B"><%=times.get(0)%></span>
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
																				<%=careSale.getRestaurants().get(i).getSales().get(0).getFrom_date()%>
																				tới
																				<%=careSale.getRestaurants().get(i).getSales().get(0).getTo_date()%></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200) %> Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase" style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=careSale.getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
																					</span>
																					</span>
																				</button>
																			</form>
																		</div>
																	</div>
																</div>
																<%
																	}
																%>
															</div>
														</div>
													</div>
												</div>
												<a class="home-see-all"
													href="/sach-tieng-viet-noi-bat/c1419"> Xem tất cả ưu đã được quan tâm nhiều nhất &nbsp;<i class="fa fa-caret-right"></i>
												</a>
											</div>
										</div>
									</div>
								</section>
								
								<!-- Đồ uống -->
								<section class="sppb-section"
									style="background-color: #f7f7f7 !important; padding-top: 10px;">
									<div class="container">
										<ul class="nav nav-tabs" role="tablist">
											<li style="background-color: #f8b93e"><a
												style="color: #fff; font-size: 16px; padding-left: 35px; padding-right: 35px;"><i class="fa fa-glass" aria-hidden="true"></i> Đồ uống</a></li>
											<li class="active"><a href="#drink-CAFEENENT"
												aria-controls="home-new" role="tab" data-toggle="tab">Cafe sự kiện</a></li>
											<li><a href="#drink-GIAIKHAT"
												aria-controls="home-bestseller" role="tab" data-toggle="tab">Giải khát - không gian đẹp</a></li>
											<li><a href="#drink-MOC"
												aria-controls="home-discount" role="tab" data-toggle="tab">Mộc</a></li>
											<li><a href="#drink-BONGDA"
												aria-controls="home-discount" role="tab" data-toggle="tab">Bóng đá</a></li>
											<li><a href="#drink-SACH"
												aria-controls="home-discount" role="tab" data-toggle="tab">Sách</a></li>
											<li><a href="#drink-THUCUNG"
												aria-controls="home-discount" role="tab" data-toggle="tab">Thú cưng</a></li>
											<li><a href="#drink-PHIM"
												aria-controls="home-discount" role="tab" data-toggle="tab">Phim</a></li>
										</ul>
										<div class="tab-content" style="padding: 0">
											<div class="tab-pane active" id="drink-CAFEENENT"
												data-impress-list-title="Home | Đồ uống | cafe sự kiện">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < drink.getRestaurantCafeEvent()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=drink.getRestaurantCafeEvent().getRestaurants().get(i)
						.getPoistion().getCity()%> </span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(drink.getRestaurantCafeEvent().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=drink.getRestaurantCafeEvent().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
											</div>
											
											<div class="tab-pane" id="drink-GIAIKHAT"
												data-impress-list-title="Home | Đồ uống | cafe sự kiện">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < drink.getRestaurantGiaiKhat()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=drink.getRestaurantGiaiKhat().getRestaurants().get(i)
						.getPoistion().getCity()%> </span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(drink.getRestaurantGiaiKhat().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=drink.getRestaurantGiaiKhat().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
											</div>
										
											<div class="tab-pane" id="drink-MOC"
												data-impress-list-title="Home | Đồ uống | cafe Mộc">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < drink.getRestaurantMoc()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="<%=drink.getRestaurantMoc().getRestaurants().get(i).getName_restaurant() %>"
																				data-title="<%=drink.getRestaurantMoc().getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=drink.getRestaurantMoc().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=drink.getRestaurantMoc().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=drink.getRestaurantMoc().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantMoc().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=drink.getRestaurantMoc().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantMoc().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=drink.getRestaurantMoc().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=drink.getRestaurantMoc().getRestaurants().get(i)
						.getPoistion().getCity()%> </span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(drink.getRestaurantMoc().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=drink.getRestaurantMoc().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=drink.getRestaurantMoc().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=drink.getRestaurantMoc().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
											</div>
										
											<div class="tab-pane" id="drink-BONGDA"
												data-impress-list-title="Home | Đồ uống | cafe Bóng đá">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < drink.getRestaurantBongDa()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=drink.getRestaurantBongDa().getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=drink.getRestaurantBongDa().getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=drink.getRestaurantBongDa().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=drink.getRestaurantBongDa().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=drink.getRestaurantBongDa().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantBongDa().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=drink.getRestaurantBongDa().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantBongDa().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=drink.getRestaurantBongDa().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=drink.getRestaurantBongDa().getRestaurants().get(i)
						.getPoistion().getCity()%> </span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(drink.getRestaurantBongDa().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=drink.getRestaurantBongDa().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=drink.getRestaurantBongDa().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=drink.getRestaurantBongDa().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
											</div>
										
											<div class="tab-pane " id="drink-SACH"
												data-impress-list-title="Home | Đồ uống | cafe sách">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < drink.getRestaurantSach()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=drink.getRestaurantSach().getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=drink.getRestaurantSach().getRestaurants().get(i).getName_restaurant()%>"
																				src="<%=drink.getRestaurantSach().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=drink.getRestaurantSach().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=drink.getRestaurantSach().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantSach().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=drink.getRestaurantSach().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantSach().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=drink.getRestaurantSach().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=drink.getRestaurantSach().getRestaurants().get(i)
						.getPoistion().getCity()%> </span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(drink.getRestaurantSach().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=drink.getRestaurantSach().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=drink.getRestaurantSach().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=drink.getRestaurantSach().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
											</div>
										
											<div class="tab-pane " id="drink-THUCUNG"
												data-impress-list-title="Home | Đồ uống | cafe thú cưng">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < drink.getRestaurantThuCung()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=drink.getRestaurantThuCung().getRestaurants().get(i).getName_restaurant() %>"
																				data-title="Akimeet | <%=drink.getRestaurantThuCung().getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=drink.getRestaurantThuCung().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=drink.getRestaurantThuCung().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=drink.getRestaurantThuCung().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantThuCung().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=drink.getRestaurantThuCung().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantThuCung().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=drink.getRestaurantThuCung().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=drink.getRestaurantThuCung().getRestaurants().get(i)
						.getPoistion().getCity()%> </span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(drink.getRestaurantThuCung().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=drink.getRestaurantThuCung().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=drink.getRestaurantThuCung().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=drink.getRestaurantThuCung().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
											</div>
										
											<div class="tab-pane " id="drink-PHIM"
												data-impress-list-title="Home | Đồ uống | cafe xem phim">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < drink.getRestaurantPhim()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=drink.getRestaurantPhim().getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=drink.getRestaurantPhim().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=drink.getRestaurantPhim().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=drink.getRestaurantPhim().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantPhim().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=drink.getRestaurantPhim().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=drink.getRestaurantPhim().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=drink.getRestaurantPhim().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=drink.getRestaurantPhim().getRestaurants().get(i)
						.getPoistion().getCity()%> </span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(drink.getRestaurantPhim().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=drink.getRestaurantPhim().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=drink.getRestaurantPhim().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=drink.getRestaurantPhim().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>

								<!-- Giải trí -->
								<section class="sppb-section" style="padding-top: 10px; ">
									
									<div class="container" >

										<ul class="nav nav-tabs" role="tablist" >
											<li style="background-color: #7cb342"><a style="color: #fff; font-size: 16px; padding-left: 35px; padding-right: 35px;" ><i class="fa fa-music" aria-hidden="true"></i>
											Giải trí</a></li>
											<li class="active"><a href="#entertainment-karaoke"
												aria-controls="home-new" role="tab" data-toggle="tab">Karaoke</a></li>
											<li><a href="#entertainment-hatchonhaunghe"
												aria-controls="home-bestseller" role="tab" data-toggle="tab">Hát cho nhau nghe</a></li>
											<li><a href="#entertainment-rapchieuphim"
												aria-controls="home-discount" role="tab" data-toggle="tab">Rạp chiếu phim</a></li>
											<li><a href="#entertainment-khuvuichoi"
												aria-controls="home-discount" role="tab" data-toggle="tab">Khu vui chơi</a></li>
											
										</ul>
										<div class="tab-content" style="padding: 0">
											<div class="tab-pane active" id="entertainment-karaoke"
												data-impress-list-title="Home | Giải trí | Karaoke">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < entertainment.getRestaurantKaraoke()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																					<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getSales().get(0).getId_sale()%>">
																				<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getPoistion().getDistrict()%>
																				- <%=entertainment.getRestaurantKaraoke().getRestaurants().get(i)
						.getPoistion().getCity()%>
																			</span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(entertainment.getRestaurantKaraoke().getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getSales().get(0).getFrom_date() %>
																				tới
																				<%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=entertainment.getRestaurantKaraoke().getRestaurants().get(i).getSales().get(0).getSale_off()%></span><span>%</span>
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
																%>
														</div>
													</div>
												</div>
												
											</div>
										
											<div class="tab-pane " id="entertainment-hatchonhaunghe"
												data-impress-list-title="Home | Giải trí | Hát cho nhau nghe">
												<div class="swiper-carousel-wrapper">
													<div
														class="swiper-container home-product swiper-container-horizontal">
														<div class="swiper-wrapper">
															<%
																for (int i = 0; i < entertainment.getRestaurantHatChoNhauNghe()
																		.getRestaurants().size(); i++) {
																	if (i % 4 == 0) {
															%>
															<div class="row">
																<%
																	}
																%>
																<div class="col-sm-3">
																	<div class="product-template">
																		<figure>
																			<img class="img-responsive" title="Akimeet | <%=entertainment.getRestaurantHatChoNhauNghe()
																					.getRestaurants().get(i).getName_restaurant() %>"
																				src="<%=entertainment.getRestaurantHatChoNhauNghe()
						.getRestaurants().get(i).getAvatar()%>" style="width: 100%; height: 130px">
																			<figcaption>
																				<div class="vertical-middle">
																					<div>
																						<div class="links">
																							<div>
																								<a
																									class="link-item-details btn btn-primary btn-md"
																									href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>">Chi
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
																					href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i)
						.getName_restaurant()%></a>
																			</h3>
																			<span class="item-seller">Ở <a
																				href="restaurant?id_sale=<%=careSale.getRestaurants().get(i).getSales().get(0).getId_sale()%>"><%=lastSale.getRestaurants().get(i)
						.getPoistion().getDetail()%></a></span>
																			<span class="item-category"><%=lastSale.getRestaurants().get(i)
						.getPoistion().getDistrict()%>
																				- <%=lastSale.getRestaurants().get(i)
						.getPoistion().getCity()%>
																			</span> <br>
																			<!-- Thời gian -->
																			<%
																				ArrayList<String> times = ProcessUtil.splitStringBySub(careSale
																							.getRestaurants().get(i).getSales().get(0).getTime(), ";");
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
																				<%=careSale.getRestaurants().get(i).getSales().get(0)
						.getFrom_date()%>
																				tới
																				<%=careSale.getRestaurants().get(i).getSales().get(0).getTo_date() %></p>
																		</div>
																		<div class="product-meta clearfix">
																			<form class="cart" method="post">
																				<input name="product_cart" value="1525996"
																					type="hidden"> <a class="item-add-to-cart"
																					href="#"><span class="product-purchased"
																					data-toggle="tooltip" data-placement="top" title=""
																					data-original-title="Click to add to cart"><i
																						class="sb-icon-cart"></i> <%=ProcessUtil.random(10, 200)%>
																						Người dùng</span></a>
																			</form>
																			<form class="purchase" action="/cart" method="get">
																				<input name="item_id" value="1525996" type="hidden">
																				<button type="submit" class="product-purchase"
																					style="background-color: #EA3D09">
																					<span> <span class="product-price"> <span><%=careSale.getRestaurants().get(i).getSales().get(0)
						.getSale_off()%></span><span>%</span>
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
																%>
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
		<div class="offcanvas-overlay"></div>
	</div>
	<jsp:include page="/element/bottom.jsp"></jsp:include>

</body>
<div class="se-pre-con"></div>
<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>
<script src="<%=contextPath%>/lib/jquery/jquery-ui.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=contextPath%>/lib/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="<%=contextPath%>/lib/jquery/jquery.easing.min.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/js/city_district.js"></script>
<script src="http://cdn.jsdelivr.net/typeahead.js/0.9.3/typeahead.min.js"></script>
<!-- Google Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-85044115-1', 'auto');
  ga('send', 'pageview');

</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-85044115-2', 'auto');
  ga('send', 'pageview');

</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>
<!-- End Google Analytics -->
</html>