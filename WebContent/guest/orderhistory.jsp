

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%
	String contextPath = request.getContextPath();
	//GuestData guestData = (GuestData) session.getAttribute("guestData");
	String abc = (String) request.getAttribute("abc");
	//request.setAttribute("reservations", guestData.getReservations());
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Akimeet</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="<%=contextPath%>/guest/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/guest/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<%=contextPath%>/guest/css/skins/_all-skins.min.css">
<!-- Custom Fonts -->
<link href="<%=contextPath%>/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
<!-- Custom Fonts -->
<!-- jQuery 2.2.3 -->
<script src="<%=contextPath%>/guest/js/jquery-2.2.3.min.js"></script>
</head>
<body style="background-color: #333;">
	<div class="wrapper">

		<jsp:include page="element.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="background-color: #ecf0f5">
			<section class="content-header">
			<h1 style="margin-top: 48px; margin-left: 48px; font-size: 28px">
				LỊCH SỬ ĐẶT BÀN</h1>
			<hr>
			<div class="row" style="margin-top: 48px; margin-left: 48px;">
				<div class="col-sm-4">
					Xem từ
					<div class="form-group">
						<div class='input-group date' id='datetimepicker1'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <i class="fa fa-calendar"
								aria-hidden="true"></i>
							</span>
						</div>
					</div>

				</div>
				<div class="col-sm-4">
					Xem đến
					<div class="form-group">
						<div class='input-group date' id='datetimepicker2'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <i class="fa fa-calendar"
								aria-hidden="true"></i>
							</span>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					Loại giao dịch
					<div class="dropdown" style="width: 100%">
						<button class="btn btn-default dropdown-toggle" type="button"
							data-toggle="dropdown" style="border-radius: 0;">
							Tất cả giao dịch<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">Chờ xác nhận</a></li>
							<li><a href="#">Đã xử lý</a></li>
							<li><a href="#">Hủy</a></li>
						</ul>
					</div>
				</div>

			</div>
			<div class="row" style="float: center; text-align: center;">
				<button class="btn"
					style="color: #fff !important; border-color: #bb1219 !important; background: #e4131b !important;">Tìm
					kiếm</button>
			</div>
			<div class="row" style="margin-left: 48px; margin-right: 40px;">
				<h5>Đơn hàng</h5>
				<table class="table table-bordered"
					style="background-color: #fff; font-family: 'Roboto'; font-size: 14px;">
					<thead>
						<tr>
							<th>Tên nhà hàng</th>
							<th>Địa chỉ</th>
							<th>Ưu đãi</th>
							<th>Thời gian giữ chỗ</th>
							<th>Thời gian đặt</th>
							<th>Số người</th>
							<th>Trạng thái</th>
							<th><i class="fa fa-cogs" aria-hidden="true"></i></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${reservationsList }">
							<tr>


								<td>${item.nameRestaurant}</td>
								<td>${item.addressDetail}</td>
								<td>${item.saleOff}%</td>
								<td>${item.time} ngày ${item.date}</td>
								<td>${item.timeCreate}</td>
								<td>${item.countPeople}</td>
								<td>${item.status}</td>
								<td><button style="background: none; border: none;">
										<i class="fa fa-trash" aria-hidden="true"></i>
									</button></td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</section>
		</div>

	</div>

	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<!-- Bootstrap 3.3.6 -->
	<script src="<%=contextPath%>/guest/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->

	<!-- AdminLTE App -->
	<script src="<%=contextPath%>/guest/js/app.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="<%=contextPath%>/guest/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=contextPath%>/guest/js/demo.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#datetimepicker1').datetimepicker({
				viewMode : 'days',
				format : 'DD/MM/YYYY'
			});
			$('#datetimepicker2').datetimepicker({
				viewMode : 'days',
				format : 'DD/MM/YYYY'
			});
		});
	</script>
</body>
</html>