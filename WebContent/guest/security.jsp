<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String contextPath = request.getContextPath();
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
<!-- jQuery 2.2.3 -->
<script src="<%=contextPath%>/guest/js/jquery-2.2.3.min.js"></script>
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
</head>
<body style="background-color: #333; font-family: 'Roboto'">
	<div class="wrapper">

		<jsp:include page="element.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="background-color: #ecf0f5">
			<section class="content-header">
			<h1 style="margin-top: 48px; margin-left: 48px; font-size: 28px">
				BẢO VỆ TÀI KHOẢN CỦA QUÝ KHÁCH</h1>
			<br>
			<hr>
			<div style="margin-top: 30px; margin-left: 48px;">
				<h4>Mật khẩu</h4>
				<p>Mật khẩu của bạn chưa được khởi tạo</p>
				<button class="btn" data-toggle="modal" data-target="#myModal"
					style="color: #fff !important; border-color: #bb1219 !important; background: #e4131b !important;">Đổi
					mật khẩu</button>
				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" style="text-align: center;">Đổi mật
									khẩu</h4>
							</div>
							<div class="modal-body">
								<form class="form-inline">
									<input type="text" class="form-control" id="passold"
										placeholder="Mật khẩu cũ"
										style="width: 100%; margin-bottom: 15px;"> <input
										type="text" class="form-control" id="passnew"
										placeholder="Mật khẩu mới"
										style="width: 100%; margin-bottom: 15px;"> <input
										type="text" class="form-control" id="repassnew"
										placeholder="Nhập lại mật khẩu mới"
										style="width: 100%; margin-bottom: 15px;">
								</form>
							</div>
							<div class="modal-footer">
								<button class="btn btn-success" onclick="updatePWD()">Cập
									nhật</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div style="margin-top: 30px; margin-left: 48px;">
				<h4>Thông tin bảo mật</h4>
				<p>Chúng tôi sẽ liên hệ với bạn qua Email và số điện thoại quý
					khách cung cấp ở đây để xác nhận những thay đổi bạn thực hiện với
					tài khoản của mình.</p>

				<table class="table table-bordered"
					style="max-width: 800px; background-color: #fff">
					<tbody>
						<tr>
							<td>vietanh.bkvp@gmail.com <br> <span>Email bạn
									muốn nhận được thông báo</span>
							</td>

							<td><button
									style="background: none; border: none; width: 100%; height: 100%">
									<i class="fa fa-pencil" aria-hidden="true" data-toggle="modal"
										data-target="#changemail"></i>
								</button></td>
						</tr>

						<tr>
							<td>Bạn chưa cung cấp số điện thoại!<br> <span>Số
									điện thoại bạn muốn nhận được thông báo.</span>
							</td>

							<td><button
									style="background: none; border: none; width: 100%; height: 100%"
									data-toggle="modal" data-target="#changphone">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</button></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div id="changemail" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" style="text-align: center;">Thay đổi
								email</h4>
						</div>
						<div class="modal-body">
							<form class="form-inline">
								<input type="text" class="form-control" id="email"
									placeholder="Email" style="width: 100%; margin-bottom: 15px;">
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-success" onclick="editEmail()">Cập
								nhật</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
			<div id="changphone" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" style="text-align: center;">Thay đổi
								số điện thoại</h4>
						</div>
						<div class="modal-body">
							<form class="form-inline">
								<input type="text" class="form-control" id="phone"
									placeholder="Số điện thoại"
									style="width: 100%; margin-bottom: 15px;">
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-success" onclick="editPhone()">Cập
								nhật</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
			</section>
		</div>

	</div>


	<script type="text/javascript">
		function updatePWD() {
			var passnew = $('#passnew').val();
			var repassnew = $('#repassnew').val();

			if (passnew != repassnew) {
				alert("Nhập mật khẩu mới không trùng nhau!")
			} else {
				$.ajax({
					url : "http://www.akimeet.com/Credit/AccountSecurity",
					type : "post",
					data : "passold=" + $('#passold').val() + "&passnew="
							+ $('#passnew').val(),
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
		}

		function editEmail() {
			if (passnew != repassnew) {
				alert("Nhập mật khẩu mới không trùng nhau!")
			} else {
				$.ajax({
					url : "http://www.akimeet.com/Credit/AccountSecurity",
					type : "post",
					data : "email=" + $('#email').val(),
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
		}

		function editPhone() {
			if (passnew != repassnew) {
				alert("Nhập mật khẩu mới không trùng nhau!")
			} else {
				$.ajax({
					url : "http://www.akimeet.com/Credit/AccountSecurity",
					type : "post",
					data : "phone=" + $('#phone').val(),
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
		}
	</script>
</body>
</html>