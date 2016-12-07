<%@page import="java.util.List"%>
<%@page import="com.project.POJO.Reservation"%>
<%@page import="com.project.POJO.Menu"%>
<%@page import="com.project.POJO.GroupMenu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.POJO.Restaurant"%>
<%@page import="com.project.POJO.Boss"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
	String contextPath = request.getContextPath();
	Boss boss = (Boss) session.getAttribute("boss_current");
	Restaurant restaurant = boss.getRestaurant();
	ArrayList<GroupMenu> groupMenus = restaurant.getGroupMenus();
	
	String mes = (String)session.getAttribute("message");
	ArrayList<Reservation> deservations = restaurant.getDeservationsUpComing();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta name="author" content="Akimeet">
<meta keywork="akimeet, akimeet.com, www.akimeet" content="">
<meta property="og:title" content="Akimeet - Tìm kiểm ưu đãi từ tất cả các nhà hàng, tất cả các dịch vụ" >
<meta  property="og:description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta property="og:type" content="website">
<meta name="robots" content="index, follow">
<meta property="og:url" content="https://www.akimeet.com/">
<title>Akimeet | Quản lý nhà hàng</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">

<!-- MetisMenu CSS -->
<link href="<%=contextPath%>/lib/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="<%=contextPath%>/css/admin/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=contextPath%>/css/admin/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="<%=contextPath%>/css/admin/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=contextPath%>/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/css/admin/admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
<link href="<%=contextPath%>/css/inputfile.min.css" media="all"
	rel="stylesheet" type="text/css" />
<style type="text/css">
h5 {
	margin-top: 6px;
	margin-bottom: 6px;
}
.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;

	background: url(images/default/load.gif) center no-repeat #fff;
}
</style>
<script
	src="<%=contextPath %>/lib/modernizr/2.8.2/modernizr.js"></script>
<script
	src="<%=contextPath %>/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript">
$(window).load(function() {
	// Animate loader off screen
	$(".se-pre-con").fadeOut("slow");
	;
});
</script>
</head>

<body>
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
					<p style="text-align: center;" id="message_box"><%=mes%></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<h3 style="font-weight: 600;"><%=restaurant.getName()%></h3>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
				<!-- 	<li class="divider"></li> -->
					<li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="#"><i class="fa fa-edit fa-fw"></i> Nhà hàng<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#menu_adminrestauarnt">Thực đơn</a></li>
							<li><a href="#introduce_adminrestauarnt">Giới thiệu</a></li>
							<li><a href="#image_adminrestauarnt">Giới thiệu</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-table fa-fw"></i> Đặt bàn<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#book_restaurant">Xem thông tin đăt bàn</a></li>
						</ul> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>
		<!--===================================================-->
		<div id="page-wrapper">
			<!-- /.row -->
			<div class="row"
				style="float: center; text-align: center; margin-bottom: 15px; padding-top: 15px;">
				<div class="col-lg-8" style="float: center;">
					<%
						String avatar = restaurant.getAvatar();
						String imageavatar = "http://localhost:8080/fooddrink/img/image-not-found.png";
						if (avatar != null) {
							//Gán URL ảnh avatar 
							imageavatar = avatar;
						}
					%>
					<a style="background: none;"> <img src="<%=imageavatar%>"
						style="height: 100%;" class="img-responsive img-rounded" alt="">
					</a>

				</div>
				<div class="col-lg-4" style="border-radius: 0">
					<div class="panel panel-default"
						style="margin-left: 10px; margin-right: 10px; border-radius: 0">
						<div class="panel-heading" style="background: #F4BC5A">
							<i class="fa fa-bell fa-fw"></i> Chỉnh sửa thông tin
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="list-group">
								<button href="#" class="list-group-item"
									style="text-align: left; border-radius: 0;" data-toggle="modal"
									data-target="#edit_info_restaurant">
									<i class=""></i>Cập nhật thông tin nhà hàng<span
										class="pull-right text-muted small"><em></em> </span>
								</button>
								<!-- Modal edit information restaurant -->
								<div class="modal fade" id="edit_info_restaurant" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<form class="modal-content" action="UpdateBasic" method="post"
											style="width: 100%; border-radius: 0;">
											<div class="modal-header" style="background: #286090; color: #fff">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Cập nhật
													thông tin</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<div class="row"
														style="padding: 10px; text-align: left; font-size: 13px;">
														<div class="col-lg-3">Tên nhà hàng</div>
														<div class="col-lg-8">
															<input type="text" class="form-control"
																name="name_restaurant_update"
																id="name_restaurant_update"
																style="font-size: 12px; border-radius: 0"
																placeholder="<%=restaurant.getName()%>">
														</div>

														<div class="col-lg-3" style="margin-top: 10px;">Địa
															điểm</div>
														<div class="col-lg-8" style="margin-top: 10px;">

															<div class="col-sm-4">
																<select id="city" name="city" title="Choose"
																	style="font-size: 12px; width: 100%; border-radius: 0"
																	class="form-control">
																	<option>Hà Nội</option>
																	<option>Thành Phố HCM</option>

																</select>
															</div>
															<div class="col-sm-4">
																<select id="district" name="district"
																	style="width: 100%; font-size: 12px; border-radius: 0;"
																	class="form-control">
																</select>
															</div>
															<div class="col-sm-4">
																<input type="text" class="form-control"
																	name="detail_address_update" style="font-size: 12px;"
																	placeholder="Địa chỉ chi tiết">
															</div>
														</div>
														<div class="col-lg-3" style="margin-top: 10px;">Thông
															tin liên hệ</div>
														<div class="col-lg-8" style="margin-top: 10px;">
															<input type="text" class="form-control"
																id="contact_restaurant_update"
																name="contact_restaurant_update"
																style="font-size: 12px; border-radius: 0"
																placeholder="<%=restaurant.getContact()%>">
														</div>
														
														<div class="col-lg-3" style="margin-top: 10px;">Giới thiệu nhà hàng</div>
														<div class="col-lg-8" style="margin-top: 10px;">
															<textarea class="form-control" rows="5"
																id="introduce_restaurant_update"
																name="introduce_restaurant_update"
																style="font-size: 12px; border-radius: 0"
																placeholder="<%=restaurant.getIntroduce()%>"></textarea>
															
														</div>
													</div>

												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													style="border-radius: 0" data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary my-button">Save
													changes</button>
											</div>

										</form>
									</div>
								</div>
								<!-- End modal -->

								<button  class="list-group-item"
									style="text-align: left; border-radius: 0" data-toggle="modal"
									data-target="#edit_info_sale">
									Cập nhật thông tin giảm giá<span
										class="pull-right text-muted small"><em></em> </span>
								</button>

								<!-- Modal thông tin -->
								<div class="modal fade" id="edit_info_sale" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header" style="background: #286090; color: #fff">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel" style="color: #fff">Cập nhật
													thông tin giảm giá</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<h5 style="color: #ed1c24;">Cập nhật khung giờ giảm
														giá</h5>
													<!-- Row 1 -->
													<div class="row" style="text-align: center;">
														<div class="col-lg-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Từ</div>
														<div class="col-lg-4">
															<div class="form-group">
																<div class='input-group date'
																	id='datetimepickerfromfirst'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timefromfirst" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>

														<div class="col-lg-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Đến</div>
														<div class="col-lg-4">
															<div class="form-group">
																<div class='input-group date' id='datetimepickertofirst'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timetofirst" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>
														<div class="col-lg-1">
															<button class="btn btn-default btn-success"
																style="float: left; height: 34px;"
																id="modal-button-add-sale" onclick="minusTime()">
																<i class="fa fa-minus" aria-hidden="true"></i>
															</button>
														</div>
														<div class="col-lg-1">
															<button class="btn btn-default btn-success"
																style="float: left; height: 34px;"
																id="modal-button-add-sale" onclick="addTime()">
																<i class="fa fa-plus-circle" aria-hidden="true"></i>
															</button>
														</div>
													</div>

													<!-- Row 2 -->
													<div class="row" id="rowTimeTwo" style="display: none;">
														<div class="col-sm-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Từ</div>
														<div class="col-sm-4">
															<div class="form-group">
																<div class='input-group date' id='datetimepickertoTwo'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timefromtwo" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>

														<div class="col-sm-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Đến</div>
														<div class="col-sm-4">
															<div class="form-group">
																<div class='input-group date' id='datetimepickerfromTwo'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timetotwo" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>

													</div>

													<div class="row" id="rowTimeThree" style="display: none;">
														<div class="col-sm-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Từ</div>
														<div class="col-sm-4">
															<div class="form-group">
																<div class='input-group date' id='datetimepickertoThree'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timefromthree" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>

														<div class="col-sm-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Đến</div>
														<div class="col-sm-4">
															<div class="form-group">
																<div class='input-group date'
																	id='datetimepickerfromThree'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timetothree" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>

													</div>
													<div class="row" id="rowTimeFour" style="display: none;">
														<div class="col-sm-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Từ</div>
														<div class="col-sm-4">
															<div class="form-group">
																<div class='input-group date' id='datetimepickertoFour'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timefromfour" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>

														<div class="col-sm-1"
															style="text-align: center; height: 34px; margin-top: 10px;">Đến</div>
														<div class="col-sm-4">
															<div class="form-group">
																<div class='input-group date'
																	id='datetimepickerfromFour'>
																	<input style="border-radius: 0" type='text'
																		class="form-control" id="timetofour" /> <span
																		class="input-group-addon"> <span
																		class="glyphicon glyphicon-time"></span>
																	</span>
																</div>
															</div>
														</div>

													</div>
													<!-- to -->

													<h5 style="text-align: center; color: #ed1c24;">Cập
														nhật ngày áp dụng</h5>
													<div class="row"
														style="margin-left: -20px; margin-right: 5px;">

														<div class="col-sm-2"
															style="text-align: center; margin-top: 10px;">Từ
															ngày</div>
														<div class="col-sm-4">
															<div class='input-group date' id='datetimepicker6'>
																<input style="border-radius: 0" type='text'
																	class="form-control" id="fromdate" /> <span
																	class="input-group-addon"> <span
																	class="glyphicon glyphicon-calendar"></span>
																</span>
															</div>
														</div>
														<div class="col-sm-2"
															style="text-align: center; margin-top: 10px;">Tới
															ngày</div>

														<div class="col-sm-4">
															<div class='input-group date' id='datetimepicker7'>
																<input style="border-radius: 0" type='text'
																	class="form-control" id="todate" /> <span
																	class="input-group-addon"> <span
																	class="glyphicon glyphicon-calendar"></span>
																</span>
															</div>
														</div>
													</div>
													<h5
														style="text-align: center; color: #ed1c24; margin-top: 10px;">Cập
														nhật chi tiết giảm giá</h5>
													<div class="row">

														<div class="col-lg-3"
															style="text-align: center; margin-top: 10px;">Chi
															tiết giảm giá</div>
														<div class="col-lg-6">
															<input style="border-radius: 0" type="text"
																class="form-control" id="detailsale" name="detailsale"
																placeholder="%">
														</div>
													</div>

													<div id="content-modal"></div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													style="border-radius: 0" data-dismiss="modal">Close</button>
												<button style="border-radius: 0" type="button"
													class="btn btn-primary my-button" onclick="updateSale()">Save
													changes</button>
											</div>

										</div>
									</div>
								</div>
								<!-- ./Modal -->
								
								<button href="#" class="list-group-item"
									style="text-align: left; border-radius: 0" data-toggle="modal"
									data-target="#edit_avatar">
									Cập nhật ảnh đại diện<span
										class="pull-right text-muted small"><em></em> </span>
								</button>
								<div class="modal fade" id="edit_avatar" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content" style="border-radius: 0">
											<div class="modal-header" style="background: #286090; color: #fff">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Cập nhật ảnh đại diện</h4>
											</div>
											<div class="modal-body">
												<form action="UploadIMGAvatar" method="post"
													enctype="multipart/form-data">
													<div class="row" style="padding: 15px; text-align: left;border-radius: 0">
														<div class="col-sm-12">
															<input style="border-radius: 0;" id="file" type="file"
																class="file" name="file">
														</div>
														<div class="col-sm-1"></div>
													</div>
												</form>
											</div>
											<h5 style="text-align: center; color: red; font-size: 13px;">Vui
											lòng chọn ảnh có size lớn hơn 960x480</h5>

										</div>
									</div>
								</div>
							</div>
							<!-- /.list-group -->

						</div>
						<!-- /.panel-body -->
					</div>
				</div>

			</div>
			<!-- /.row -->
			<!-- Danh sách đặt bàn -->
			<div class="row" id="book_restaurant">
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> Thông tin đặt chỗ
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="list-group" style="text-align: center;">
								<h5>Sắp diễn ra</h5>
								<%
									if(deservations != null){
										for(int i =0; i< deservations.size(); i++){
								%>
								<button class="list-group-item" style="text-align: left;"
									onclick="loadReservation(<%=deservations.get(i).getIdDeservation()%>)">
									<i class="fa fa-fw"></i><%=deservations.get(i).getNameCustomer()%>
									<%=deservations.get(i).getCountPeople()%>
									ghế <span class="pull-right text-muted small"><em><%=deservations.get(i).getTime()%>-<%=deservations.get(i).getDate()%></em>
									</span>
								</button>
								<%
										}
									}
								%>
							</div>
							<!-- /.list-group -->
							<a href="#" class="btn btn-default btn-block">Cũ hơn</a>
						</div>
						<!-- /.panel-body -->
					</div>


					<!-- /.panel .chat-panel -->
				</div>
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Chi tiết đặt bàn
							<!-- <div class="pull-right">
								<div class="btn-group">
									<button type="button"
										class="btn btn-default btn-xs dropdown-toggle"
										data-toggle="dropdown">
										Actions <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li><a href="#">Xác nhận</a></li>
										<li><a href="#">Hủy yêu cầu</a></li>
									</ul>
								</div>
							</div> -->
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" id="content-reservation">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td>Tên người đặt bàn</td>
										<td id="name_customer"></td>
									</tr>
									<tr>
										<td>Số ghế đặt</td>
										<td id="count_people_reservation"></td>
									</tr>
									<tr>
										<td>Thời gian đặt</td>
										<td id="time_reservation"></td>
									</tr>
									<tr>
										<td>Email/Face liên hệ</td>
										<td><a href="#" id="email_reservation"></a></td>
									</tr>
									<tr>
										<td>SDT liên hệ</td>
										<td id="phone_number_reservation"></td>
									</tr>
									<tr>
										<td>Trạng thái</td>
										<td id="status_reservation"></td>
									</tr>
								</tbody>
							</table>
							<button class="btn btn-default btn-success" data-toggle="modal" id="confirm"
								data-target="#confirm_dialog" style="border-radius: 0;">Xác
								nhận</button>

							<!-- Modal -->
							<div class="modal fade" id="confirm_dialog" role="dialog">
								<div class="modal-dialog modal-sm">

									<!-- Modal content-->
									<div class="modal-content" style="border-radius: 0;">
										<div class="modal-header" style="background: #286090; color: #fff">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title" id="title_comfirm"
												style="text-align: center; border-radius: 0;">Xác nhận
												khách hàng</h4>
										</div>
										<div class="modal-body"
											style="float: none; text-align: center;">
											<button type="button" class="btn btn-default"
												data-dismiss="modal" style="border-radius: 0;">Không</button>
											<button style="border-radius: 0" type="button" onclick="confirm()"
												class="btn btn-primary my-button">Có</button>
										</div>
										<div class="modal-footer">
											<h5 style="text-align: center; color: red; font-size: 13px;" id="recomment_comfirm">Chỉ
												thực hiện xác nhận khi khách hàng đến ăn đúng quy định</h5>
										</div>
									</div>

								</div>
							</div>

							<button class="btn btn-default btn-warning" data-toggle="modal" id="cancel"
								data-target="#cancel_dialog" style="border-radius: 0;">Hủy đơn</button>


							<!-- Modal -->
							<div class="modal fade" id="cancel_dialog" role="dialog">
								<div class="modal-dialog modal-sm">

									<!-- Modal content-->
									<div class="modal-content" style="border-radius: 0;">
										<div class="modal-header" style="background: #286090; color: #fff">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title"
												style="text-align: center; border-radius: 0;">Hủy giữ
												chỗ</h4>
										</div>
										<div class="modal-body"
											style="float: none; text-align: center;">
											<button type="button" class="btn btn-default"
												data-dismiss="modal" style="border-radius: 0;">Không</button>
											<button style="border-radius: 0" type="button"
												class="btn btn-primary my-button">Có</button>
										</div>
										<div class="modal-footer">
											<h5 style="text-align: center; color: red; font-size: 13px;">Thực
												hiện hủy khi không thể phục vụ khách hàng vào thời điếm này</h5>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->

				</div>
				<!-- /.col-lg-8 -->

				<!-- /.col-lg-4 -->
			</div>

			<!-- Cập nhật thông tin nhà hàng -->
			<div class="row"
				style="background: #F7F7EF; padding-top: 10px;" id="menu_adminrestauarnt">
				<button class="btn btn-default btn-success my-button"
					data-toggle="modal" data-target="#add_group_menu">Thêm/sửa
					nhóm món ăn
				</button>
				<!-- Modal edit information restaurant -->
				<div class="modal fade" id="add_group_menu" tabindex="-1"
					style="border-radius: 0;" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content" style="border-radius: 0;">
							<div class="modal-header" style="background: #286090; color: #fff">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"
									style="text-align: center;">Thêm/sửa nhóm món ăn</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<div class="row" style="padding: 15px; text-align: left;">
										<div class="col-sm-4" style="margin-top: 10px;">Chỉnh
											sửa nhóm món ăn</div>
										<div class="col-sm-8">
											<div class="row">
												<%
													for(int i =0; i< groupMenus.size(); i++){
												%><div class="col-sm-12">
													<input type="text" class="form-control"
														style="border-radius: 0; margin-bottom: 10px;"
														onchange="editGroupMenu(this, <%=groupMenus.get(i).getIdGroupMenu()%>)"
														id="name_group_menu_<%=groupMenus.get(i).getIdGroupMenu()%>"
														placeholder="<%=groupMenus.get(i).getName()%>">
												</div>
												<%
													}
												%>
											</div>
										</div>
									</div>
									<hr>
									<div class="row" style="padding: 15px; text-align: left;">
										<div class="col-sm-2" style="margin-top: 10px;">Tên nhóm</div>
										<div class="col-sm-7">
											<input type="text" class="form-control"
												style="border-radius: 0;" name="add_name_group_menu"
												id="add_name_group_menu" placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
										<div class="col-sm-1">
											<button class="btn btn-default btn-success"
												style="float: left; height: 34px; width: 100%; border-radius: 0;"
												id="modal-button-add-sale" onclick="minusGroupmenu()">
												<i class="fa fa-minus" aria-hidden="true"></i>
											</button>

										</div>
										<div class="col-sm-1">
											<button class="btn btn-default btn-success"
												style="float: left; height: 34px; width: 100%; border-radius: 0;"
												id="modal-button-add-sale" onclick="addGroupmenu()">
												<i class="fa fa-plus-circle" aria-hidden="true"></i>
											</button>
										</div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_one">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_one"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none"
										id="row_add_name_group_menu_two">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_two"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_three">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_three"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_four">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_four"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_five">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_five"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_six">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_six"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_seven">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_seven"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_eight">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_eight"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_nine">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_nine"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>
									<div class="row"
										style="padding: 15px; text-align: left; display: none;"
										id="row_add_name_group_menu_ten">
										<div class="col-sm-2"></div>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="add_name_menu"
												style="border-radius: 0;" id="add_name_group_menu_ten"
												placeholder="e.g: Món tráng miệng">
										</div>
										<div class="col-sm-1"></div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										style="border-radius: 0;" data-dismiss="modal">Close</button>
									<button class="btn btn-primary my-button"
										onclick="updateGroupMenu()">Save changes</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ./Modal -->

				<button class="btn btn-default btn-success my-button"
					data-toggle="modal" data-target="#add_menu">Thêm món ăn</button>
				<!-- Modal edit information restaurant -->
				<div class="modal fade" id="add_menu" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header" style="background: #286090; color: #fff">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"
									style="text-align: center;">Nhập thông tin món ăn</h4>
							</div>
							<div>
								<div class="modal-body">
									<form class="form-group" action="CreateMenu" method="post">
										<div class="row" style="padding: 15px; text-align: left;">
											<div class="col-sm-1"></div>
											<div class="col-sm-3">Tên món ăn</div>
											<div class="col-sm-7">
												<input type="text" class="form-control" name="add_name_menu"
													style="border-radius: 0;" id="add_name_menu"
													required="required" placeholder="e.g: gà hấp">
											</div>
											<div class="col-sm-1"></div>
										</div>
										<div class="row" style="padding: 15px; text-align: left;">
											<div class="col-sm-1"></div>
											<div class="col-sm-3">Giá</div>
											<div class="col-sm-7">
												<input type="text" class="form-control" id="add_price_menu"
													style="border-radius: 0;" name="add_price_menu"
													required="required" placeholder="e.g: 200K">
											</div>
											<div class="col-sm-1"></div>
										</div>
										<div class="row" style="padding: 15px; text-align: left;">
											<div class="col-sm-1"></div>
											<div class="col-sm-3">Mô tả</div>
											<div class="col-sm-7">
												<textarea class="form-control" rows="5"
													style="border-radius: 0;" id="add_describe_menu"
													name="add_describe_menu"
													placeholder="e.g: Gà tươi mạch hoạch thơm ngon bổ dưỡng"></textarea>
											</div>
											<div class="col-sm-1"></div>
										</div>
										<div class="row" style="padding: 15px; text-align: left;">
											<div class="col-sm-1"></div>
											<div class="col-sm-3">Nhóm món ăn</div>
											<div class="col-sm-7">
												<select id="add_menu_in_group_memu"
													name="add_menu_in_group_memu" title="Choose"
													style="font-size: 12px; width: 100%; border-radius: 0"
													class="form-control">
													<%
														for(int i =0; i< groupMenus.size(); i++){
													%><option value="<%=groupMenus.get(i).getIdGroupMenu()%>"><%=groupMenus.get(i).getName()%></option>
													<%
														}
													%>

												</select>
											</div>
											<div class="col-sm-1"></div>
										</div>
										<div class="row" style="padding: 15px; text-align: left;">
											<div class="col-sm-1"></div>
											<div class="col-sm-3">Phân loại món ăn</div>
											<div class="col-sm-7">
												<select id="add_menu_in_classify"
													name="add_menu_in_classify" title="Choose"
													style="font-size: 12px; width: 100%; border-radius: 0"
													class="form-control">
													<option value="1">Buffet</option>
													<option value="2">Món dân tộc</option>
													<option value="3">Món hoa</option>
													<option value="4">Món thái</option>
													<option value="5">Món Âu Mĩ</option>
													<option value="6">Đồ uống</option>
													<option value="8">Món ăn bình dân</option>
													<option value="7">Khác</option>
												</select>
											</div>
											<div class="col-sm-1"></div>
										</div>
										<h5 style="text-align: center; color: red; font-size: 13px;">Vui
											lòng phân loại món ăn để người dùng rễ ràng tìm kiếm</h5>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary my-button">Thêm
												món ăn</button>
										</div>

									</form>
									<hr>
									<form action="UploadIMGMenu" method="post"
										enctype="multipart/form-data">
										<div class="row" style="padding: 15px; text-align: left;">
											<div class="col-sm-1"></div>
											<div class="col-sm-3">Ảnh món ăn</div>
											<div class="col-sm-12">
												<input style="border-radius: 0;" id="file" type="file"
													class="file" name="file">
											</div>
											<div class="col-sm-1"></div>
										</div>
									</form>
									<h5 style="text-align: center; color: red; font-size: 13px;">Vui
										lòng cập nhật thông tin trước khi up ảnh</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ./Modal -->

				<!-- Quản trị các món ăn -->
				<h2 style="text-align: center;">Danh sách thực đơn</h2>
 <%
					if(restaurant != null){
						if(groupMenus != null){
							for(int i =0; i< groupMenus.size(); i++){
				%>
				<div class="row">
					<h4 style="margin-left: 15px;">
						<%=groupMenus.get(i).getName()%>
					</h4>
					<%
						ArrayList<Menu> menus = groupMenus.get(i).getMenus();
						if(menus != null){
							for(int j=0; j< menus.size(); j++){
								Menu menu = menus.get(j);
								String image = menu.getImage();
					%>
					<div class="col-sm-4"
						style="padding: 10px; border: 1px solid #ddd; margin-left: 25px;">
						<div class="col-sm-3">
							<img style="width: 60px; height: 60px;"
								alt="<%=menus.get(j).getImage()%>" title="" src="<%=menus.get(j).getImage()%>">
						</div>
						<div class="col-sm-8" style="padding: 5px;">
							<span class="ng-binding"><%=menus.get(j).getName()%></span><br> <span
								class="ng-binding" style="font-size: 13px;"><%=menus.get(j).getPrice()%>,000
								₫</span>
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modaleditmenu>">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</button>
							<div class="modal fade" id="modaleditmenu"role="dialog">
								<div class="modal-dialog" >
									<div class="modal-content">
										<div class="modal-header"
											style="background: #286090; color: #fff">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div>
											<div class="modal-body">
												<div class="form-group" >
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Tên món ăn</div>
														<div class="col-sm-7">
															<input type="text" class="form-control"
																name="edit_name_menu" style="border-radius: 0;"
																id="edit_name_menu" required="required"
																placeholder="<%=menus.get(j).getName()%>">
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Giá</div>
														<div class="col-sm-7">
															<input type="text" class="form-control"
																id="edit_price_menu" style="border-radius: 0;"
																name="edit_price_menu" required="required"
																placeholder="<%=menus.get(j).getPrice()%>">
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Mô tả</div>
														<div class="col-sm-7">
															<textarea class="form-control" rows="5"
																style="border-radius: 0;" id="edit_describe_menu"
																name="edit_describe_menu"
																placeholder="<%=menus.get(j).getDescribe()%>"></textarea>
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Nhóm món ăn</div>
														<div class="col-sm-7">
															<select id="edit_menu_in_group_memu"
																name="edit_menu_in_group_memu" title="Choose"
																style="font-size: 12px; width: 100%; border-radius: 0"
																class="form-control">
																<%
																	for (int a = 0; a < groupMenus.size(); a++) {
																%><option value="<%=groupMenus.get(a)
											.getIdGroupMenu()%>"><%=groupMenus.get(a).getName()%></option>
																<%
																	}
																%>

															</select>
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Phân loại món ăn</div>
														<div class="col-sm-7">
															<select id="edit_menu_in_classify"
																name="edit_menu_in_classify" title="Choose"
																style="font-size: 12px; width: 100%; border-radius: 0"
																class="form-control">
																<option value="1">Buffet</option>
																<option value="2">Món dân tộc</option>
																<option value="3">Món hoa</option>
																<option value="4">Món thái</option>
																<option value="5">Món Âu Mĩ</option>
																<option value="6">Đồ uống</option>
																<option value="8">Món ăn bình dân</option>
																<option value="7">Khác</option>
															</select>
														</div>
														<div class="col-sm-1"></div>
													</div>
													<h5
														style="text-align: center; color: red; font-size: 13px;">Vui
														lòng phân loại món ăn để người dùng rễ ràng tìm kiếm</h5>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" onclick="editmenu(<%=menus.get(j).getIdMenu() %>)"
															data-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary my-button">Save Change</button>
													</div>

												</div>
												<hr>
												<h5 style="text-align: center; color: red; font-size: 13px;">Vui
													lòng cập nhật thông tin trước khi up ảnh</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<%
						}
																																																																																																																																																						}
					%>
				</div>
				<hr>
				<%
					}
					}
				}
				%>
				<%-- <c:forEach items="<%=groupMenus %>" var="item">
					<div class="row">
						<h4 style="margin-left: 15px;">
							${item.name }
							<%=groupMenus.get(i).getName()%>
						</h4>
						<c:forEach items="${item.menus }" var="menu">
							<div class="col-sm-4"
								style="padding: 10px; border: 1px solid #ddd; margin-left: 25px;">
								<div class="col-sm-3">
									<img style="width: 60px; height: 60px;"
										alt="${menu.image}" title="" src="${menu.image}">
								</div>
								<div class="col-sm-8" style="padding: 5px;">
									<span class="ng-binding">${menu.name}</span><br> <span
										class="ng-binding" style="font-size: 13px;">${menu.price},000
										₫</span>
								</div>
								<div class="col-sm-1">
									<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modaleditmenu>">
										<i class="fa fa-pencil" aria-hidden="true"></i>
									</button>
									<div class="modal fade" id="modaleditmenu" tabindex="-1" role="dialog"
										aria-labelledby="modaleditmenu">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header"
													style="background: #286090; color: #fff">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title" id="myModalLabel"
														style="text-align: center;">Chỉnh sửa thông tin món ăn</h4>
												</div>
												<div>
													<div class="modal-body">
														<div class="form-group" >
															<div class="row" style="pediting: 15px; text-align: left;">
																<div class="col-sm-1"></div>
																<div class="col-sm-3">Tên món ăn</div>
																<div class="col-sm-7">
																	<input type="text" class="form-control"
																		name="edit_name_menu" style="border-radius: 0;"
																		id="edit_name_menu" required="required"
																		placeholder="${menu.name}">
																</div>
																<div class="col-sm-1"></div>
															</div>
															<div class="row" style="pediting: 15px; text-align: left;">
																<div class="col-sm-1"></div>
																<div class="col-sm-3">Giá</div>
																<div class="col-sm-7">
																	<input type="text" class="form-control"
																		id="edit_price_menu" style="border-radius: 0;"
																		name="edit_price_menu" required="required"
																		placeholder="${menu.price}">
																</div>
																<div class="col-sm-1"></div>
															</div>
															<div class="row" style="pediting: 15px; text-align: left;">
																<div class="col-sm-1"></div>
																<div class="col-sm-3">Mô tả</div>
																<div class="col-sm-7">
																	<textarea class="form-control" rows="5"
																		style="border-radius: 0;" id="edit_describe_menu"
																		name="edit_describe_menu"
																		placeholder="${menu.describe}"></textarea>
																</div>
																<div class="col-sm-1"></div>
															</div>
															<div class="row" style="pediting: 15px; text-align: left;">
																<div class="col-sm-1"></div>
																<div class="col-sm-3">Nhóm món ăn</div>
																<div class="col-sm-7">
																	<select id="edit_menu_in_group_memu"
																		name="edit_menu_in_group_memu" title="Choose"
																		style="font-size: 12px; width: 100%; border-radius: 0"
																		class="form-control">
																		<%
																			for (int a = 0; a < groupMenus.size(); a++) {
																		%><option value="<%=groupMenus.get(a)
													.getIdGroupMenu()%>"><%=groupMenus.get(a).getName()%></option>
																		<%
																			}
																		%>
		
																	</select>
																</div>
																<div class="col-sm-1"></div>
															</div>
															<div class="row" style="pediting: 15px; text-align: left;">
																<div class="col-sm-1"></div>
																<div class="col-sm-3">Phân loại món ăn</div>
																<div class="col-sm-7">
																	<select id="edit_menu_in_classify"
																		name="edit_menu_in_classify" title="Choose"
																		style="font-size: 12px; width: 100%; border-radius: 0"
																		class="form-control">
																		<option value="1">Buffet</option>
																		<option value="2">Món dân tộc</option>
																		<option value="3">Món hoa</option>
																		<option value="4">Món thái</option>
																		<option value="5">Món Âu Mĩ</option>
																		<option value="6">Đồ uống</option>
																		<option value="8">Món ăn bình dân</option>
																		<option value="7">Khác</option>
																	</select>
																</div>
																<div class="col-sm-1"></div>
															</div>
															<h5
																style="text-align: center; color: red; font-size: 13px;">Vui
																lòng phân loại món ăn để người dùng rễ ràng tìm kiếm</h5>
															<div class="modal-footer">
																<button type="button" class="btn btn-default" onclick="editmenu(${menu.getIdMenu()})"
																	data-dismiss="modal">Close</button>
																<button type="submit" class="btn btn-primary my-button">Save Change</button>
															</div>
		
														</div>
														<hr>
														<h5 style="text-align: center; color: red; font-size: 13px;">Vui
															lòng cập nhật thông tin trước khi up ảnh</h5>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<hr>
				</c:forEach> --%>
				<%-- <%
					if(restaurant != null){
						if(groupMenus != null){
							for(int i =0; i< groupMenus.size(); i++){
				%>
				<div class="row">
					<h4 style="margin-left: 15px;">
						<%=groupMenus.get(i).getName()%>
					</h4>
					<%
						ArrayList<Menu> menus = groupMenus.get(i).getMenus();
						if(menus != null){
							for(int j=0; j< menus.size(); j++){
								Menu menu = menus.get(j);
								String image = menu.getImage();
					%>
					<div class="col-sm-4"
						style="padding: 10px; border: 1px solid #ddd; margin-left: 25px;">
						<div class="col-sm-3">
							<img style="width: 60px; height: 60px;"
								alt="<%=menu.getImage()%>" title="" src="<%=image%>">
						</div>
						<div class="col-sm-8" style="padding: 5px;">
							<span class="ng-binding"><%=menu.getName()%></span><br> <span
								class="ng-binding" style="font-size: 13px;"><%=menu.getPrice()%>,000
								₫</span>
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modaleditmenu>">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</button>
							<div class="modal fade" id="modaleditmenu" tabindex="-1" role="dialog"
								aria-labelledby="modaleditmenu">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header"
											style="background: #286090; color: #fff">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel"
												style="text-align: center;">Chỉnh sửa thông tin món ăn</h4>
										</div>
										<div>
											<div class="modal-body">
												<div class="form-group" >
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Tên món ăn</div>
														<div class="col-sm-7">
															<input type="text" class="form-control"
																name="edit_name_menu" style="border-radius: 0;"
																id="edit_name_menu" required="required"
																placeholder="<%=menu.getName()%>">
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Giá</div>
														<div class="col-sm-7">
															<input type="text" class="form-control"
																id="edit_price_menu" style="border-radius: 0;"
																name="edit_price_menu" required="required"
																placeholder="<%=menu.getPrice()%>">
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Mô tả</div>
														<div class="col-sm-7">
															<textarea class="form-control" rows="5"
																style="border-radius: 0;" id="edit_describe_menu"
																name="edit_describe_menu"
																placeholder="<%=menu.getDescribe()%>"></textarea>
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Nhóm món ăn</div>
														<div class="col-sm-7">
															<select id="edit_menu_in_group_memu"
																name="edit_menu_in_group_memu" title="Choose"
																style="font-size: 12px; width: 100%; border-radius: 0"
																class="form-control">
																<%
																	for (int a = 0; a < groupMenus.size(); a++) {
																%><option value="<%=groupMenus.get(a)
											.getIdGroupMenu()%>"><%=groupMenus.get(a).getName()%></option>
																<%
																	}
																%>

															</select>
														</div>
														<div class="col-sm-1"></div>
													</div>
													<div class="row" style="pediting: 15px; text-align: left;">
														<div class="col-sm-1"></div>
														<div class="col-sm-3">Phân loại món ăn</div>
														<div class="col-sm-7">
															<select id="edit_menu_in_classify"
																name="edit_menu_in_classify" title="Choose"
																style="font-size: 12px; width: 100%; border-radius: 0"
																class="form-control">
																<option value="1">Buffet</option>
																<option value="2">Món dân tộc</option>
																<option value="3">Món hoa</option>
																<option value="4">Món thái</option>
																<option value="5">Món Âu Mĩ</option>
																<option value="6">Đồ uống</option>
																<option value="8">Món ăn bình dân</option>
																<option value="7">Khác</option>
															</select>
														</div>
														<div class="col-sm-1"></div>
													</div>
													<h5
														style="text-align: center; color: red; font-size: 13px;">Vui
														lòng phân loại món ăn để người dùng rễ ràng tìm kiếm</h5>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" onclick="editmenu(<%=menu.getIdMenu() %>)"
															data-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary my-button">Save Change</button>
													</div>

												</div>
												<hr>
												<h5 style="text-align: center; color: red; font-size: 13px;">Vui
													lòng cập nhật thông tin trước khi up ảnh</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<%
						}
																																																																																																																																																						}
					%>
				</div>
				<hr>
				<%
					}
					}
				}
				%> --%>


			</div>
			<!-- /.row -->
			<!-- Giới thiệu nhà hàng -->
			<div class="row" style="padding: 15px;" id="introduce_adminrestaurant">
				<h2 style="text-align: center;">Giới thiệu nhà hàng</h2>
				<p><%=restaurant.getIntroduce() %></p>

				<%-- <button class="btn btn-default btn-success"
					style="float: center; padding-top: 10px; border-radius: 0;"
					data-toggle="modal" data-target="#edit_introduce">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
				</button>

				<div class="modal fade" id="edit_introduce" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<form class="modal-dialog" role="document" action="chinh-sua-thong-tin-gioi-thieu-nha-hang" method="post">
						<div class="modal-content" style="border-radius: 0;">
							<div class="modal-header" style="background: #286090; color: #fff">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"
									style="text-align: center;">Chỉnh sửa giới thiệu nhà hàng</h4>
							</div>
							<div class="modal-body">
								<textarea class="form-control" rows="20"
									style="border-radius: 0;" id="edit_introduce_restaurant"
									name="edit_introduce"
									placeholder="<%=restaurant.getIntroduce()%>"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal" style="border-radius: 0;">Close</button>
								<button type="submit" class="btn btn-primary"
									style="border-radius: 0;">Save changes</button>
							</div>
						</div>
					</form>
				</div> --%>
			</div>
			<!-- /.row -->
			<div class="row" style="background: #F7F7EF; padding: 10px;" id="image_adminrestaurant">
				<button class="btn btn-default btn-success my-button"
					data-toggle="modal" data-target="#add_image">Thêm ảnh</button>
				<div class="modal fade" id="add_image" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content" style="border-radius: 0;">
							<div class="modal-header" style="background: #286090; color: #fff">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"
									style="text-align: center; color: #fff">Thêm ảnh cho nhà hàng</h4>
							</div>
							<form action="UploadIMGImage" method="post"
								enctype="multipart/form-data">
								<div class="modal-body">
									<input style="border-radius: 0;" id="file" type="file"
										class="file" name="file">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" style="border-radius: 0;">Close</button>
									<button type="submit" class="btn btn-primary"
										style="border-radius: 0;">Thêm mới</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<h2 style="text-align: center;">Danh mục hỉnh ảnh</h2>
				<%
					ArrayList<String> image = restaurant.getImages();
					if(image != null){
						for (int i =0; i< image.size(); i++){
				%>
				<div class="col-lg-3" style="text-align: center; padding: 10px;">
					<div style="background-color: #fff;">

						<img class="img-thumbnail" style="position: relative;"
							id="gallery-listing" src="<%=image.get(i)%>">
					</div>
				</div>
				<%
					}
																																																																																														}
				%>
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>

	<!-- jQuery -->
	<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>
	<script src="<%=contextPath%>/lib/jquery/jquery-ui.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=contextPath%>/lib/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=contextPath%>/lib/metisMenu/metisMenu.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=contextPath%>/js/admin/sb-admin-2.js"></script>
	<!-- Load data with ajax -->
	<script src="<%=contextPath%>/js/fileinput.js" type="text/javascript"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		var message = '<%=mes%>';
		
		if(message != null && message != "null"){
			$("#dialog_message").modal()
			<%session.removeAttribute("message");%>
		}
		
    });
	</script>

	<!-- /#wrapper -->
	<script src="<%=contextPath%>/js/admin/adminrestaurant.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/js/city_district.js"></script>
	
</body>
<div class="se-pre-con"></div>
</html>
