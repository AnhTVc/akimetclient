<%@page import="com.project.POJO.Rate"%>
<%@page import="com.project.POJO.Feedback"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.project.POJO.REST.Campaign"%>
<%@page import="com.project.POJO.REST.SaleResult"%>
<%@page import="com.project.util.constant.*"%>
<%@page import="com.project.util.ProcessUtil"%>
<%@page import="com.project.POJO.REST.Menu"%>
<%@page import="com.project.POJO.REST.GroupMenu"%>
<%@page import="com.project.POJO.REST.Sale"%>
<%@page import="com.project.POJO.REST.Restaurant"%>
<%@page import="com.project.POJO.REST.RestaurantRESTData"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath = request.getContextPath();

	Restaurant restaurantRESTDaya = (Restaurant) session
	.getAttribute("restData");
	//String URL = Constant.URL_DOMAIN + "/fooddrink/";
	Restaurant restaurant= restaurantRESTDaya;
	Sale sale = restaurant.getSales().get(0);
	ArrayList<GroupMenu> groupMenus = restaurantRESTDaya.getGroupMenus();
	
	SaleResult recommendSale = (SaleResult)session.getAttribute("recommend_sale");
%>
<head>
<meta charset="utf-8">
<title>Akimeet | Tìm kiếm thông tin nhà hàng</title>
<meta name="description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta name="author" content="Akimeet">
<meta keywork="akimeet, akimeet.com, www.akimeet" content="">
<meta property="og:title" content="Akimeet - Tìm kiểm ưu đãi từ tất cả các nhà hàng, tất cả các dịch vụ" >
<meta  property="og:description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta property="og:type" content="website">
<meta name="robots" content="index, follow">
<meta property="og:url" content="https://www.akimeet.com/">
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
	background: url(http://akimeet.com/images/load.gif) center no-repeat #fff;
}


<!-- Range slider -->
</style>
<link href="<%=contextPath%>/images/favicon.png" rel="shortcut icon"
	type="image/vnd.microsoft.icon">
<link rel="stylesheet"
	href="<%=contextPath%>/lib/main/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/lib/main/css/sppagebuilder.css" type="text/css">
<link rel="stylesheet" href="<%=contextPath%>/lib/main/css/template.css"
	type="text/css">
<link rel="stylesheet" href="<%=contextPath%>/lib/main/css/preset1.css"
	type="text/css" class="preset">

<link href="<%=contextPath%>/css/customer.css" rel="stylesheet">
<!-- Date time picker -->
<link rel="stylesheet"
	href="<%=contextPath%>/lib/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />

<!-- CSS file input -->
<link href="<%=contextPath%>/lib/fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

<!-- JQuery -->
<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>
<script src="<%=contextPath%>/lib/jquery/jquery-ui.js"></script>
<!-- Plugin JavaScript -->
<script src="<%=contextPath%>/lib/jquery/jquery.easing.min.js"></script>
<!-- End -->

<script type="text/javascript"
	src="<%=contextPath%>/js/city_district.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");
		;
	});
</script>

<!-- File input JS -->
<script src="<%=contextPath%>/lib/fileinput/js/fileinput.min.js" type="text/javascript"></script>
<style type="text/css">
	.modal-full {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
.modal-dialog{
	top: 10%;
}
.modal-full-content {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=contextPath%>/lib/main/js/main.js"
	type="text/javascript"></script>

<script src="<%=contextPath%>/lib/modernizr/2.8.2/modernizr.js"></script>
<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/restaurant.js"></script>
<script src="<%=contextPath%>/js/login.js"></script>
</head>

<body id="page-top" class="index bg-light-gray"
	style="background-color: #f2f2f2">
	<div id="dialog_message" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm" style="top: 10%">

			<!-- Modal content-->
			<div class="modal-content" style="border-radius: 0;">
				<div class="modal-header" style="background: #286090">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="text-align: center; color: #fff">Thông
						báo</h4>
				</div>
				<div class="modal-body">
					<p style="text-align: center;" id="dialog_content"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!--  -->
	<jsp:include page="/element/header.jsp"></jsp:include>

	<!-- Content -->
	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div class="col-sm-8 col-md-8 col-lg-8 col-xs-12">
				<div class="restaurant-info">
					<div style="text-align: center; float: center;">

						<span class="label label-danger noty-safe"><%=sale.getSale_off()%>%
							OFF </span> <img width="800px" height="270px"
							src="<%=restaurant.getAvatar()%>" class="img-responsive"
							style="height: 270px" alt="">

						<h3
							style="text-align: center; font-size: 24px; text-transform: uppercase; color: #EA3D09; font-weight: 600;"><%=restaurant.getName_restaurant()%></h3>
						<div class="row"
							style="text-align: center; position: inherit; padding: 10px; font-size: 13px; padding-top: 25px;">
							<%
								ArrayList<String> times = ProcessUtil.splitStringBySub(
														sale.getTime(), ";");
												//max 4 khung giờ
												if (times.size() == 1) {
													//Có một khung giờ
							%>
							<div class="col-sm-4 col-md-4 col-xs-4"></div>
							<div class="col-sm-4 col-md-4 col-xs-4">
								<span class="label label-success"
									style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(0)%>
								</span>
							</div>
							<div class="col-sm-4 col-md-4 col-xs-4"></div>
							<%
								} else if (times.size() == 2) {
													// Co 2 khung gio
							%>
							<div class="col-sm-2 col-md-2 col-xs-2"></div>
							<div class="col-sm-3 col-md-3 col-xs-3">
								<span class="label label-success"
									style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(0)%>
								</span>
							</div>
							<div class="col-sm-2 col-md-2 col-xs-2"></div>
							<div class="col-sm-3 col-md-3 col-xs-3">
								<span class="label label-success"
									style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(1)%>
								</span>
							</div>
							<div class="col-sm-2 col-md-2 col-xs-2"></div>
							<%
								} else if (times.size() == 3) {
							%>
							<div class="col-sm-1 col-md-1 col-xs-1"></div>
							<div class="col-sm-3 col-md-3 col-xs-3">
								<span class="label label-success"
									style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(0)%>
								</span>
							</div>

							<div class="col-sm-1 col-md-1 col-xs-1"></div>
							<div class="col-sm-3 col-md-3 col-xs-3">
								<span class="label label-success"
									style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(0)%>
								</span>
							</div>
							<div class="col-sm-1 col-md-1 col-xs-1"></div>
							<div class="col-sm-3 col-md-3 col-xs-3">
								<span class="label label-success"
									style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(0)%>
								</span>
							</div>

							<%
								} else if (times.size() == 4) {
							%>
							<div class="row">
								<div class="col-sm-2 col-md-2 col-xs-2"></div>
								<div class="col-sm-3 col-md-3 col-xs-3">
									<span class="label label-success"
										style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(0)%>
									</span>
								</div>
								<div class="col-sm-2 col-md-2 col-xs-2"></div>
								<div class="col-sm-3 col-md-3 col-xs-3">
									<span class="label label-success"
										style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(1)%>
									</span>
								</div>
								<div class="col-sm-2 col-md-2 col-xs-2"></div>
							</div>
							<div class="row" style="margin-top: 25px;">
								<div class="col-sm-2 col-md-2 col-xs-2"></div>
								<div class="col-sm-3 col-md-3 col-xs-3">
									<span class="label label-success"
										style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(2)%>
									</span>
								</div>
								<div class="col-sm-2 col-md-2 col-xs-2"></div>
								<div class="col-sm-3 col-md-3 col-xs-3">
									<span class="label label-success"
										style="font-size: 13px; padding: 5px; background: #158C0B"><%=times.get(3)%>
									</span>
								</div>
								<div class="col-sm-2 col-md-2 col-xs-2"></div>
							</div>
							<%
								} else {
							%>
							<div class="col-sm-4 col-md-4 col-xs-4"></div>
							<div class="col-sm-4 col-md-4 col-xs-4">
								<span class="label label-success"
									style="font-size: 13px; padding: 5px; background: #158C0B">Tất
									cả các khung giờ </span>
							</div>
							<div class="col-sm-4 col-md-4 col-xs-4"></div>
							<%
								}
							%>
						</div>
						<!-- End row time -->
						
						<div class="item-list" style="margin-bottom: 5vh; margin-top: 5vh">
							<div class="row">
								<span style="text-align: left; float: left;"><i
									class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;<%=restaurant.getAddress()%></span>
								<br>
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-4">
										<!-- Đánh giá tổng quan
									Mặc định là 8.0
									Nếu đã có đánh giá cho nhà hàng thì tính trung bình -->
									
									
										<div
											style="float: left; margin-right: 5px; font-size: 20px; font-weight: 700; padding: 12px 0 10px 5px; color: #e52402; text-shadow: 0 1px 1px #FFF; width: 70px;">
											<div>
												<%
													ArrayList<Rate> rates = restaurant.getRates();
													if(rates != null){
														// Count
														int sum = 0;
														for(int i =0; i< rates.size(); i++){
															sum += Integer.valueOf(rates.get(i).getRating());
														}
														
														%>
														<span class="avg-txt-highlight"><%=(sum/rates.size())*2%></span>
														<%
													}else{
														
													}
											
												%>
												
											</div>
											<div
												style="font-weight: 400; color: #777; font-size: 12px; padding-top: 3px;">Đánh
												giá</div>
										</div>
									</div>
									<div class="col-sm-4" style="padding: 12px 0 10px 5px">
										<!-- Người dùng đánh giá
									Yêu cầu đăng nhập với cho đánh giá 
								 -->
										<jsp:include page="/lib/range/ratings.jsp"></jsp:include>
										<div
												style="font-weight: 400; color: #777; font-size: 12px; padding-top: 3px;">Đánh giá của bạn</div>
									</div>
									<div class="col-sm-2"></div>
								</div>

								
							</div>
						</div>
						
						<!-- End Info base -->
					</div>
					
					<div class="row" style="margin-top: 20px">
						<div class="col-sm-4"
							style="border: 1px solid #ddd; background: #fff;">
							<button style="background: none; border: none; width: 100%"
								data-toggle="modal" data-target="#modalPhone">
								<span class="btn-event"> <i class="fa fa-phone"
									aria-hidden="true"></i>&nbsp; Gọi điện
								</span>
							</button>

							<!-- Modal -->
							<div class="modal fade" id="modalPhone" role="dialog"
								style="text-align: center; top: 10%">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h5>Điện thoại</h5>
										</div>
										<div class="modal-body">
											<p style="font-size: 20px; color: #278c07; font-weight: 700;">
												<i class="fa fa-phone" aria-hidden="true"></i>&nbsp;<%=restaurant.getPhone_number()%></p>
											
										</div>
										<p style="font-size: 13px; color: red; text-align: left; margin-left: 15px;">Phản hồi online: 01677826011</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4"
							style="border: 1px solid #ddd; background: #fff;">

							<button style="background: none; border: none; width: 100%"
								data-toggle="modal" data-target="#modalAddress">
								<span class="btn-event"> <i class="fa fa-location-arrow"
									aria-hidden="true"></i>&nbsp;Xem địa chỉ
								</span>
							</button>
							<!-- Modal -->
							<div class="modal fade" id="modalAddress" role="dialog"
								style="text-align: center; top: 10%">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h5>Địa chỉ</h5>
										</div>
										<!-- Đánh giá -->
										<div class="modal-body">
											<p style="font-size: 14px;">
												<i class="fa fa-location-arrow" aria-hidden="true"></i>&nbsp;<%=restaurant.getAddress()%></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4"
							style="border: 1px solid #ddd; background: #fff;">
							<button style="background: none; border: none; width: 100%" id="btn-open-comment">
								<span class="btn-event"><i class="fa fa-comment-o"
									aria-hidden="true"></i>&nbsp;Bình luận </span>
							</button>
							<div class="modal fade" id="modalComment" role="dialog" style="top: 10%">
								<div class="modal-dialog modal-lg ">
									<div class="modal-content modal-full-content">
										<div class="modal-header" style="background-color: #f5f5f5">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h5>Viết bình luận</h5>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="form-group">
													<div style="margin-bottom: 25px" class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-pencil" aria-hidden="true"></i></span> 
														<input
															id="title_comment" type="text" class="form-control"
															name="title_comment" value=""
															placeholder="Nhập tiêu đề, ví dụ: Món ăn ở đây rất tuyệt"
															require>
													</div>
												</div>
												<div class="form-group">
													<textarea class="form-control" rows="5" id="comment"
														placeholder="Nhập nội dung bình luận"></textarea>
												</div>
												
												<div style="margin-left: 25px; margin-right: 25px;">
													<p>Tải ảnh lên (ấn và giữ phím Ctrl để chọn nhiều ảnh)</p>
													<div class="kv-main">
														<form  id="imageUploadForm" action="javascript:;" enctype="multipart/form-data" method="post" accept-charset="utf-8">
															<input id="file-0a" class="file add_more" type="file"  multiple=true
																data-min-file-count="1">
															<br>
														</form>
													</div>
												</div>
												<!-- Upload file -->
												<script type="text/javascript">
													var data;
													// Function comment
													$(document).ready(function (e) {
														//	Change text
														$(".btn.btn-default.fileinput-upload.fileinput-upload-button span").text("Thực hiện bình luận");
														$(".btn.btn-default.fileinput-remove.fileinput-remove-button span").text("Xóa ảnh");
													    $('#imageUploadForm').on('submit',(function(e) {
													    	// Check form input
													    	var title = $("#title_comment").val();
													    	var content = $("#comment").val();
													    	var idRestaurant = <%=restaurant.getId_restaurant()%>;
													    	data = "title=" + title + "&" +
													    				"content=" + content + "&" +
													    				"idRestaurant=" + idRestaurant;
													        e.preventDefault();
													        var formData = new FormData(this);
													        $.each($("input[type='file']")[0].files, function(i, file) {
													        	formData.append('file', file);
													        }); 
													        //	ajax upload image
													        $.ajax({
													            type:'POST',
													            url: 'binh-luan',
													            data:formData,
													            async: false,
													            cache: false,
													            contentType: false,
													            processData: false,
													            success:function(data){
													            	if(data.result == 'success'){
													            		postComment();
													            		
													            	}else{
													            		alert('Thực hiện bình luận không thành công');
													            	}
													            	
													                
													            },
													            error: function(data){
													                console.log("error");
													                console.log(data);
													                alert('Thực hiện bình luận không thành công');
													            }
													        });
													    }));
																
													});
	
													function postComment() {
														alert(data);
														$.ajax({
													        type:'POST',
													        url: 'binh-luan',
													        data: data,
													        success:function(data){
													            if(data.result == 'success'){
													            	alert('Bạn đã thực hiện bình luận thành công, cảm ơn bạn!')
													            }else{
													            	alert('Thực hiện bình luận không thành công');
													            }
													        },
													        error: function(data){
													            console.log("error");
													            console.log(data);
													            alert('Thực hiện bình luận không thành công');
													        }
													    });
													}
												</script>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Hình ảnh | menu | thực đơn -->
				<div>
					<nav class="navbar navbar-light bg-faded">
					<ul class="nav navbar-nav">
						<li class="nav-item active" style="background: #ed1c24;"><a
							onclick="toggleVisibilityImage()" class="nav-link"
							href="#image_restaurant" style="color: #fff">Hình ảnh <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item" style="background: #ed1c24"><a
							onclick="toggleVisibilityMenu()" class="nav-link"
							href="#menu_restaurant" style="color: #fff">Thực đơn</a></li>
						<li class="nav-item" style="background: #ed1c24;"
							onclick="toggleVisibilityIntro()"><a class="nav-link"
							style="color: #fff" href="#restaurant_intro">Thông tin</a></li>

					</ul>
					</nav>
					<div class="info_restaurant">
						<div id="image_restaurant">
							<div class="row">
								<%
									String image = restaurant.getImages();
															if (image != null) {
																ArrayList<String> listURL = ProcessUtil.splitStringBySub(image,
																		",");
																if (listURL != null && listURL.size() > 0) {
																	for (int i = 0; i < listURL.size(); i++) {
								%>
								<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"
									style="margin-bottom: 10px;">
									<div id="gallery-listing">
										<div style="position: relative; text-align: center;">
											<img class="img-responsive" src="<%=listURL.get(i)%>" title="Akimeet | <%=restaurant.getName_restaurant()%>">
										</div>
										<!--//END:gallery-listing-->

									</div>

								</div>
								<%
									}
								} else {
								%><p>Không có dữ liệu</p>
								<%
									}
								} else {
								%><p style="text-align: center;">Không có dữ liệu</p>
								<%
									}
								%>
							</div>
						</div>
						<div id="menu_restaurant" style="display: none">
							<div
								style="background: #fff none repeat scroll 0 0; border-radius: 2px; float: left; padding: 15px; width: 670px;">
								<%
									for (int i = 0; i < groupMenus.size(); i++) {
																ArrayList<Menu> menus = groupMenus.get(i).getMenu();
								%>
								<h4><%=groupMenus.get(i).getName()%></h4>
								<div class="row">
									<%
										if (menus != null) {
										for (int j = 0; j < menus.size(); j++) {
									%>
									<div class="col-sm-6" style="padding: 10px;">
										<div class="col-sm-4">
											<img style="width: 60px; height: 60px;"
												title="Akimeet | <%=menus.get(j).getName() %>" src="<%=menus.get(j).getImage()%>">
										</div>
										<div class="col-sm-6" style="padding: 5px;">
											<span class="ng-binding"><%=menus.get(j).getName()%></span> <span
												class="ng-binding"><%=menus.get(j).getPrice()%>,000 ₫</span>
										</div>
									</div>
									<%
										}
									}
									%>
								</div>
								<%
									}
								%>
							</div>
						</div>
						<div id="restaurant_intro" style="display: none;"
							class="r-tabs-panel r-tabs-state-active">
							<p><%=restaurant.getIntroduce()%></p>
						</div>

					</div>

				</div>
				
				<!-- Feedback -->
				<%
					ArrayList<Feedback> feedbacks = restaurant.getFeedbacks();
					if(feedbacks != null){
						Feedback feedback;
						for(int i =0; i< feedbacks.size(); i++){
							feedback = new Feedback();
							feedback = feedbacks.get(i);
							
							%>
							<div>
					<div
						style="position: relative; background: #fff; line-height: 15px; padding-top: 15px; padding-left: 15px; padding-top: 15px; padding-bottom: 15px; margin-top: 10px">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-2">
								<p
									style="text-transform: capitalize; text-overflow: ellipsis; font-weight: 700;">
									<%=feedback.getCustomer().getName() %>
								</p>
								<span style="font-size: 11px; color: #666;"
									title="<%=feedback.getTimeCreate() %>"><%=feedback.getTimeCreate() %></span>
							</div>
							<div class="col-md-8"></div>
							<!-- <div class="col-md-1">
								<div
									style="background: #03ae03; color: #fff; text-align: center; border-radius: 100px; display: block; width: 32px; height: 32px; font-size: 12px; line-height: 32px; overflow: hidden;">
									<span>7.0</span>
								</div>
							</div> -->
						</div>
						<hr>
						<h4 style="font-weight: 800"><%=feedback.getTitle() %></h4>
						<div style="line-height: 25px;">
							<p
								style="white-space: pre-line; font-size: 14px; line-height: 1.4em;"><%=feedback.getContent() %></p>
						</div>
						<div class="row">
						<%
							String images = feedback.getImages();
							if(images != null){
								ArrayList<String> arrayImage = ProcessUtil.splitStringBySub(images, ",");
								if(arrayImage != null){
									for(int j =0; j< arrayImage.size(); j++){
										%>
										<div class="col-md-2" style="margin-left: 5px">
								<img alt="" title="Akimeet | <%=restaurant.getName_restaurant() %>" height="175px" width="175px"
									src="<%=arrayImage.get(j)%>">
								</div>
										<%
									}
								}
							}
						
						%>
						</div>
					</div>
				</div> 
							<%
						}
					}
				%>
				<!-- End feedback -->
				<!-- End left -->
			</div>
			
			<div class="col-sm-4 col-md-4 col-lg-4 col-xs-12"
				style="margin-top: 15px;">
				<div class="booking-form" style="">
					<div class="form-title" style="color: red;">
						<small style="font-size: 15px; color: red;">Giảm giá <span
							style="color: red; font-weight: bold;"><%=sale.getSale_off()%>%</span>
						</small>
					</div>
					<hr class="dotted-reverse">
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label"
								style="font-family: inherit; font-weight: normal; text-transform: uppercase; color: #fff; font-size: 12px;">Số
								người</label>
							<div class="col-right">
								<select name="pax" class="dropbtn" id="count_reservation"
									style="text-align: center; height: 30px; font-size: 12px;">
									<option selected="selected" value="1">1</option>
									<%
										for (int i = 0; i < 100; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label"
								style="font-family: inherit; font-weight: normal; text-transform: uppercase; font-size: 12px; color: #fff;">Chọn
								ngày</label>
							<div class="col-right">
								<div class='input-group date' id='datetimepicker'>
									<input style="border-radius: 0" type='text' required
										class="form-control" id="date_reservation" /> <span
										class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label"
								style="font-family: inherit; font-weight: normal; text-transform: uppercase; color: #fff; font-size: 12px;">Chọn
								giờ</label>
							<div class="col-right">
								<div class='input-group date' id='datetimepicker6'>
									<input style="border-radius: 0" type='text' required
										class="form-control" id="time_reservation" /> <span
										class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>

						<button id="btn-book" class="btn btn-default login-required"
							style="background-color: #ed1c24; color: #fff;" type="submit">Tiếp
							tục</button>
						<div id="reservationModal" class="modal fade" role="dialog"  style="top: 10%">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content" style="border-radius: 0">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="text-align: center;">Bạn
											thực hiện đặt bàn</h4>
									</div>
									<div class="modal-body">
										<table class="table table-bordered">
											<thead>
												<tr style="text-align: center;">
													<th>Nhà hàng</th>
													<th>Số người</th>
													<th>Khung giờ</th>
													<th>Ngày</th>
													<th>Ưu đãi</th>
												</tr>
											</thead>
											<tbody>
												<tr style="text-align: center; font-size: 13px;">
													<td id="name_restaurant"><%=restaurant.getName_restaurant()%></td>
													<td id="count"></td>
													<td id="time"></td>
													<td id="date"></td>
													<td id="sale">Không có ưu đãi</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<div class="row">
											<div class="col-sm-4">
												<button type="submit" class="btn  my-button btn-success"
													onclick="reservation()">Đặt chỗ</button>
											</div>
											<div class="col-sm-4">
												<button type="button" class="btn btn-warning"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div id="loginModal" class="modal fade" role="dialog">
							<!-- Modal content-->
							<div class="content">
								<div id="loginbox" style="margin-top: 50px; border-radius: 0"
									class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
									<div class="panel panel-info modal-dialog  modal-content">
										<div class="panel-heading"
											style="background-color: #31708f; color: #fff">
											<div class="panel-title">Đăng nhập</div>
											<div
												style="float: right; font-size: 80%; position: relative; top: -10px">
												<a href="#">Forgot password?</a>
											</div>
										</div>

										<div style="padding-top: 30px" class="panel-body">

											<div style="display: none" id="login-alert"
												class="alert alert-danger col-sm-12"></div>

											<form id="loginform" class="form-horizontal" action="login"
												method="post">

												<div style="margin-bottom: 25px" class="input-group">
													<span class="input-group-addon"><i
														class="glyphicon glyphicon-user"></i></span> <input
														id="email_login" type="text" class="form-control"
														name="email_login" value="" placeholder="email" require>
												</div>

												<div style="margin-bottom: 25px" class="input-group">
													<span class="input-group-addon"><i
														class="glyphicon glyphicon-lock"></i></span> <input
														id="password_login" type="password" class="form-control"
														name="password_login" placeholder="password" require>
												</div>
												<div style="margin-top: 10px" class="form-group">
													<!-- Button -->

													<div class="col-sm-12 controls">
														<button id="btn-login" href="#" class="btn btn-success"
															type="submit">Đăng nhập</button>
														&nbsp; &nbsp;hoặc

													</div>
													<div class="col-sm-12 controls" style="margin-top: 25px;">
														<div class="col-sm-6">
															<a href="#" type="submit" class="btn"
																style="background-color: #49639F; color: #fff;"
																onclick="javascript:login();">Đăng nhập với Facebook</a>
														</div>
														<div class="col-sm-6">
															<p id="customBtn">
																<a href="#" data-onsuccess="onSignIn"
																	id="loginGoogleBtn" class="btn"
																	style="background-color: #DF4A32; color: #fff;">Đăng
																	nhập với Google</a>
															</p>
														</div>
													</div>
												</div>


												<div class="form-group">
													<div class="col-md-12 control">
														<div
															style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
															Don't have an account! <a href="#"
																onClick="$('#loginbox').hide(); $('#signupbox').show()">
																Sign Up Here </a>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div id="signupbox"
									style="display: none; margin-top: 7%; background-color: none;"
									class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
									<div class="panel panel-info" style="">
										<div class="panel-heading"
											style="background-color: #31708f; color: #fff">
											<div class="panel-title">Đăng ký</div>
											<div
												style="float: right; font-size: 85%; position: relative; top: -10px">
												<a id="signinlink" href="#"
													onclick="$('#signupbox').hide(); $('#loginbox').show()">Đăng
													nhập</a>
											</div>
										</div>
										<div class="panel-body">
											<form id="signupform" class="form-horizontal" action="login"
												method="post">

												<div id="signupalert" style="display: none"
													class="alert alert-danger">
													<p>Error:</p>
													<span></span>
												</div>

												<div class="form-group">
													<label for="email" class="col-md-3 control-label">Email</label>
													<div class="col-sm-1"></div>
													<div class="col-md-8">
														<input type="text" class="form-control"
															name="email_register" id="email_register"
															placeholder="Email Address">
													</div>
												</div>

												<div class="form-group">
													<label for="icode" class="col-md-3 control-label">Phone
														number</label>
													<div class="col-sm-1"></div>
													<div class="col-md-8">
														<input type="text" class="form-control" name="phonenumber"
															id="phonenumber" placeholder="phone number">
													</div>
												</div>

												<div class="form-group">
													<label for="password" class="col-md-3 control-label">Password</label>
													<div class="col-sm-1"></div>
													<div class="col-md-8">
														<input type="password" class="form-control" id="password"
															name="password" placeholder="Password">
													</div>
												</div>

												<div class="form-group">
													<label for="password" class="col-md-3 control-label">Rep
														Password</label>
													<div class="col-sm-1"></div>
													<div class="col-md-8">
														<input type="password" class="form-control" name="passwd"
															placeholder="Password">
													</div>
												</div>

												<div class="form-group" style="margin-top: 25px;">
													<!-- Button -->
													<div class=" col-md-12">
														<button id="btn-signup" type="button"
															class="btn btn-success" style="text-align: center;">
															Đăng ký</button>
														<span style="margin-left: 8px;">hoặc đăng ký với</span>
													</div>
													<div class="col-sm-12 controls" style="margin-top: 25px;">
														<div class="col-sm-6">
															<a href="#" type="submit" class="btn"
																style="background-color: #49639F; color: #fff;"
																onclick="javascript:login();">Đăng nhập với Facebook</a>
														</div>
														<div class="col-sm-6">
															<p id="customBtn">
																<a href="#" data-onsuccess="onSignIn"
																	id="loginGoogleBtn" class="btn"
																	style="background-color: #DF4A32; color: #fff;">Đăng
																	nhập với Google</a>
															</p>
														</div>
													</div>

												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal warning -->
						<div id="warningModal" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content"
									style="text-align: center; border-radius: 0">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Chú ý</h4>
									</div>
									<div class="modal-body">
										<p>Bạn vui lòng thực hiện chọn đủ các thông tin.</p>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
				<!-- Khuyen cao -->
				<div class="booking-remark">
					<div class="remark-title">QUY ĐỊNH</div>
					<p>
						<strong>Thời gian khuyến mãi:</strong>
					</p>
					<ul>
						<li style="font-size: 13px;">Giảm <%=sale.getSale_off() %> % </li>
					</ul>
					<p>
						<strong>Điều kiện áp dụng:</strong>
					</p>
					<ul style="font-size: 13px;">
						<li>Áp dụng cho menu chính</li>
						<li>Chương trình ưu đãi không bao gồm thức uống có cồn</li>
						<li>Không áp dụng cho đơn hàng mang về.</li>
						<li>Không bao gồm các hình thức khuyến mãi khác.</li>
						<li>Áp dụng cho cả ngày lễ, tết</li>
						<li>Nhà hàng sẽ giữ chỗ trước và sau thời điểm đặt bàn 15
							phút.</li>
						<li>Khách hàng vui lòng cung cấp xác nhận đặt bàn trước khi
							gọi món.</li>
					</ul>
				</div>

			</div>
		</div>

	</div>
	<hr>
	<!-- Gợi ý -->

	<div class="container">
		<h4 style="text-align: center; font-size: 24px;">Có thể bạn quan
			tâm</h4>
		<div class="row">
			<%
				if(recommendSale != null){
					Restaurant restaurant2;
					Sale sale2;
						for(int i =0; i< recommendSale.getRestaurants().size(); i++){
							 restaurant2 = recommendSale.getRestaurants().get(i);
							 System.out.print("========> Resstauarant: " + restaurant2.getId_restaurant() + "\n");
							 sale2 = restaurant2.getSales().get(0);
							 System.out.print("========> Sale: " + sale2.getId_sale() + "\n");
			%>
			<div class="col-sm-6 col-md-3" style="padding-left: 15px;">
				<div class="product-template">
					<figure> <img class="img-responsive" title="Akimeet | <%=restaurant2.getName_restaurant() %>"
						src="<%=restaurant2.getAvatar()%>"
						style="width: 100%; height: 150px"> <figcaption>
					<div class="vertical-middle">
						<div>
							<div class="links">
								<div>
									<a class="link-item-details btn btn-primary btn-md"
										href="restaurant?id_sale=<%=sale2.getId_sale()%>">Chi tiết</a>
								</div>
							</div>
						</div>
					</div>
					</figcaption> </figure>
					<div class="item-header">
						<h3>
							<a href="restaurant?id_sale=<%=sale2.getId_sale()%>"><%=restaurant2.getName_restaurant()%></a>
						</h3>
						<span class="item-seller">Ở <a
							href="restaurant?id_sale=<%=sale2.getId_sale()%>"><%=restaurant2.getPoistion().getDetail()%></a></span>
						<span class="item-category"><%=restaurant2.getPoistion().getDistrict()%>
							- <%=restaurant2.getPoistion().getCity()%> </span>
						<!-- Thời gian -->
						<br>
						<%
							ArrayList<String> time = ProcessUtil.splitStringBySub(sale2
													.getTime(), ";");																				
														if(times != null || times.size() > 0){
															if(times.size() == 1){
						%>
						<span class="label label-success label-time-safe"
							style="font-size: 11px; margin: 0; background-color: #158C0B"><%=time.get(0)%></span>
						<%
							}else if(times.size() > 1){
						%>
						<span class="label label-success label-time-safe"
							style="font-size: 11px; margin: 0; background-color: #158C0B"><%=time.get(0)%></span>
						<span class="label label-success label-time-safe"
							style="font-size: 11px; margin: 0; background-color: #158C0B"><%=time.get(1)%></span>
						<%
							}else{
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
							<%=sale2.getFrom_date()%>
							tới
							<%=sale2.getTo_date()%></p>
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
						<form class="purchase">
							<input name="item_id" value="1525996" type="hidden">
							<button type="submit" class="product-purchase"
								style="background-color: #EA3D09">
								<span> <span class="product-price"> <span><%=sale2.getSale_off()%></span><span>%</span>
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
	<jsp:include page="/element/bottom.jsp"></jsp:include>
	<script type="text/javascript">
	var saleOff = "0";
	function isEmpty(val){
	    return (val === undefined || val == null || val.length <= 0) ? true : false;
	}
	
	$(document).ready(function(){
		var id_customer = "<%=session.getAttribute("id_custommer")%>";
		$("#btn-open-comment").click(function(){
			if (id_customer != 'null') {
				$("#modalComment").modal('show')
			}else{
				//	Login
				$("#loginModal").modal()
			}
		});
		
		
	    $("#btn-book").click(function(){
	        
				if (id_customer != 'null') {
					var count = $("#count_reservation").val();
					var date = $("#date_reservation").val();
					var time = $("#time_reservation").val();

					if (isEmpty(date) || isEmpty(time)) {
						//Chưa nhập đủ thông tin
						$("#warningModal").modal('show')
					} else {
						document.getElementById("count").innerHTML = count;
						document.getElementById("date").innerHTML = date;
						document.getElementById("time").innerHTML = time;
						<%Gson gson = new Gson();%>
						debugger
						
						var str = <%=gson.toJson(sale.getTime())%>;
						
						var res = str.split(";");
						for(i =0; i< res.length ; i ++){
							var timetemp = res[i].split("-");
							var fromtime = toDate(timetemp[0], "h:m")
							var totime = toDate(timetemp[1], "h:m")
							
							var choosetime = toDate(time, "h:m")
							if(choosetime <= totime )
								if(choosetime >= fromtime){
									document.getElementById("sale").innerHTML = <%=sale.getSale_off()%>
									saleOff = <%=sale.getSale_off()%>
								}
						}
						
						$("#reservationModal").modal()
					}

				} else {
					//Nguoi dung chua login.
					$("#loginModal").modal()
				}
			});
		});
		
		function reservation() {
			//Thực hiện chức năng đặt bàn
			var data = 'id_restaurant=<%=restaurant.getId_restaurant()%>&id_sale=<%=sale.getId_sale()%>'
					+ '&date='
					+ $("#date_reservation").val()
					+ '&time='
					+ $("#time_reservation").val()
					+ '&count_people='
					+ $("#count_reservation").val() + '&sale_off=' + saleOff;
			debugger;
			$
					.ajax({
						url : "dat-cho",
						type : "post",
						data : data,
						success : function(response) {
							debugger;
							// you will get response from your php page (what you echo or print)  
							$("#reservationModal").modal('hide');
							document.getElementById("dialog_content").innerHTML = response.message;
							$("#dialog_message").modal()
						},
						error : function(jqXHR, textStatus, errorThrown) {
							//alert(textStatus, errorThrown);
							document.getElementById("dialog_content").innerHTML = errorThrown;
							$("#dialog_message").modal()
							window.location.reload();
						}
					});
		}

		function toDate(dStr, format) {
			var now = new Date($("#date_reservation").val());
			if (format == "h:m") {
				now.setHours(dStr.substr(0, dStr.indexOf(":")));
				now.setMinutes(dStr.substr(dStr.indexOf(":") + 1));
				now.setSeconds(0);
				return now;
			} else
				return "Invalid Format";
		}
	</script>
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
											cookiepolicy : 'single_host_origin',
										// Request scopes in addition to 'profile' and 'email'
										//scope: 'additional_scope'
										});
								attachSignin(document
										.getElementById('customBtn'));
							});
		};

		function attachSignin(element) {
			console.log(element.id);
			auth2.attachClickHandler(element, {}, function(googleUser) {
				/* document.getElementById('name').innerText = "Signed in: " +
				    googleUser.getBasicProfile().getName(); */
				var googleName = googleUser.getBasicProfile().getName();
				var googleEmail = googleUser.getBasicProfile().getEmail();

				//alert(googleEmail);
				$.ajax({
					url : URL + "login",
					type : "post",
					data : 'name=' + googleName + '&email=' + googleEmail
							+ '&status=2',
					success : function(response) {
						alert(response.authen);
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
	</script>
	<script>
		startApp();
	</script>
	
</body>
<div class="se-pre-con"></div>
</html>