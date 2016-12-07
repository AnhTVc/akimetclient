<%@page import="com.project.util.constant.*"%>
<%@page import="com.project.POJO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String contextPath = request.getContextPath();

	Customer customer = (Customer) session.getAttribute("customer");
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
</head>
<body style="background-color: #333; font-family: 'Roboto'">
	<div class="wrapper">
		<jsp:include page="element.jsp"></jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="background-color: #ecf0f5">
			<section class="content-header">
			<h1 style="margin-top: 48px; margin-left: 48px; font-size: 28px">
				THÔNG TIN CƠ BẢN CỦA QUÝ KHÁCH</h1>
			<hr>
			<div style="margin-top: 30px; margin-left: 48px;">
				<div class="box" style="max-width: 500px; text-align: center;">
					<p
						style="font-size: 16px; font-family: Roboto-Bold; color: #333 !important; margin: 0 0 10px;">
						<b>Thông tin cá nhân</b>
					</p>
					<table class="table table-bordered" style="max-width: 100%;">
						<tbody>
							<tr>
								<td>Tên</td>

								<td><%=customer.getName()%></td>
							</tr>

							<tr>
								<td>Email</td>

								<td><%=customer.getEmail()%></td>
							</tr>
							<tr>
								<td>Số điện thoại</td>

								<td><%=customer.getPhoneNumber()%></td>
							</tr>
						</tbody>
					</table>

				</div>
				<button class="btn" data-toggle="modal" data-target="#myModal"
					style="color: #fff !important; border-color: #bb1219 !important; background: #e4131b !important;">Chỉnh
					sửa</button>
				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog"
					style="font-family: 'Roboto'">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" style="text-align: center;">Chỉnh
									sửa thông tin</h4>
							</div>
							<div class="modal-body">
								<form class="form-inline">
									<input type="text" class="form-control" id="name"
										placeholder="Họ và tên"
										style="width: 100%; margin-bottom: 15px;"> <input
										type="text" class="form-control" id="email"
										placeholder="Email" style="width: 100%; margin-bottom: 15px;">
									<input type="text" class="form-control" id="phonenumber"
										placeholder="Số điện thoại"
										style="width: 100%; margin-bottom: 15px;">
								</form>

							</div>
							<div class="modal-footer">
								<button  class="btn btn-success"
									onclick="updateCustomer()">Cập nhật</button>
								<button type="button" class="btn btn-default"
									 data-dismiss="modal">Đóng</button>
							</div>
						</div>

					</div>
				</div>
			</div>
			</section>
		</div>

	</div>
	<!-- jQuery 2.2.3 -->
	<script src="<%=contextPath%>/lib/jquery/jquery.min.js"></script>
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
	<script src="<%=contextPath%>/gues
	t/js/demo.js"></script>
	<script type="text/javascript">
		function updateCustomer() {
			$.ajax({
				url : "http://www.akimeet.com/Credit/GeneralInfo",
				type : "post",
				data : "name=" + $('#name').val() + "&email="
						+ $('#email').val() + "&phonenumber="
						+ $('#phonenumber').val(),
				success : function(data) {
					var message = data.message;

					$('#message_box').text = message;
					$("#dialog_message").modal()
					window.location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					//alert(textStatus, errorThrown);
					window.location.reload();
				}
			});
		}
	</script>
</body>
</html>