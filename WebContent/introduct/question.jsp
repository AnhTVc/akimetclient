<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String contextPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Câu hỏi</title>
<meta name="generator" content="MYOB">
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
	class="site com-sppagebuilder view-page no-layout no-task itemid-101 en-gb ltr  sticky-header layout-fluid "
	style="margin-top: 70px;">
	<!-- header -->
	<div class="body-innerwrapper">
		<jsp:include page="/element/header.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<jsp:include page="/introduct/tabbar.jsp" />

				</div>
				<div class="col-sm-9"
					style="background-color: #fff; border: 1px solid #ccc; margin-top: 15px; overflow: hidden; padding: 10px 25px;">

					<h3 style="color: #f48221">Hỏi đáp</h3>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">AkiMeet.com
								là gì?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>AkiMeet.com là một trang mạng giúp bạn tiết kiệm chi phí và
								thời gian khi đặt bàn trực tiếp tại một nhà hàng nào đó.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">AkiMeet
								hoạt động như thế nào?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Tất cả những địa điểm ăn uống đều có những lúc vắng khách
								vào những giờ thấp điểm. Chính vì thế, AkiMeet.com sẽ hợp tác với
								các chủ nhà hàng, thực hiện những ưu đãi giảm giá vào những
								khung giờ thấp điểm nhằm tạo ra lợi ích 2 bên cho cả thực khách
								lẫn chủ nhà hàng.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Làm
								thế nào để sử dụng AkiMeet.com?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Trước tiên hãy đăng ký tài khoản trên AkiMeet.com. Tiếp
								theo, hãy lựa chọn 1 cửa hàng yêu thích trong danh sách của
								AkiMeet, chọn khung giờ tương ứng với những mức độ ưu đãi khác
								nhau để đặt bàn. Sau đó, bạn sẽ nhận được 1 email xác nhận đặt
								bàn. Và nhớ, hãy xuất trình đơn xác minh đặt bàn cho nhân viên
								khi đến nhà hàng nhé. Sử dụng AkiMeet thường xuyên sẽ giúp bạn
								tiết kiệm chi phí hằng ngày. Thật quá dễ dàng đúng không nào!</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Chi
								phí đặt hàng là bao nhiêu?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Đặt bàn thông qua AkiMeet sẽ hoàn toàn miễn phí.</p>
						</div>
					</div>

					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Khi
								nào tôi cần xuất trình đơn xác minh đặt hàng?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Ngay khi vào nhà hàng, bạn cần đưa ra đơn xác minh đặt bàn
								cho nhân viên trước khi gọi món.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Thời
								gian đặt bàn được tính như thế nào?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Thời gian đặt bàn được tính khi ngay thời điểm bạn đến nhà
								hàng và ưu đãi cũng được tính tại thời điểm đó.</p>
						</div>
					</div>
					<h3 style="color: #f48221">ĐẶT BÀN VÀ ƯU ĐÃI</h3>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Điều
								gì xảy ra khi tôi đến trễ so với giờ đặt bàn?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Nếu đến trễ, bạn có thể gọi đến hotline của nhà hàng mà
								bạn đã đặt bàn. Số điện thoại của nhà hàng sẽ dễ dàng tìm thấy
								trên trang thông tin chi tiết. Chúng tôi đảm bảo sẽ giữ đơn đặt
								bàn của bạn trong vòng 15 phút của khung giờ đặt bàn. Trong
								trường hợp đến trễ hơn thời gian quy định, bạn nên hủy đặt chỗ
								và đặt lại vào khung giờ khác.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Làm
								thế nào để hủy đặt chỗ?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Bạn có thể hủy đặt chỗ trước thời hạn ưu đãi 5 phút. Tất
								cả thông tin đặt chỗ của bạn sẽ được xóa khỏi lịch sử đặt chỗ
								của trang.</p>
						</div>
					</div>

					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Điều
								gì xảy ra nếu như tôi không xuất trình đơn xác minh đặt chỗ cho
								nhà hàng?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Tài khoản của bạn sẽ bị khóa nếu sự việc tái diễn nhiều
								lần. Vì vậy, đừng thường xuyên làm điều đó bạn nhé!</p>
						</div>
					</div>

					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Làm
								thế nào để chỉnh sửa thông tin chi tiết đặt chỗ của tôi?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Vì có rất nhiều mức độ ưu đãi vào những khung giờ đặt chỗ
								khác nhau nên chúng tôi khuyến khích bạn nên hủy đơn đặt chỗ đã
								có và tiến hành lại 1 đơn đặt chỗ mới.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Điều
								gì xảy ra nếu nhà hàng không giảm giá cho tôi?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Hãy gọi đến số điện thoại 08 730 994 68 hoặc 01218 10 10
								10. Chúng tôi sẽ giải quyết vấn đề giúp bạn.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Tôi
								có thể sử dụng ưu đãi giảm giá như thế nào?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Việc ưu đãi bao gồm thức uống có cồn hay không, có được
								đính kèm với các chương trình khuyến mãi khác hoặc có áp dụng
								vào các ngày lễ hay không còn tùy thuộc vào chủ nhà hàng. Vậy
								nên để biết ưu đãi bao gồm những gì, nhớ đọc kỹ phần điều kiện
								áp dụng trước khi đặt bàn bạn nhé.</p>
						</div>
					</div>
					<h3 style="color: #f48221">ĐẶT BÀN VÀ ƯU ĐÃI</h3>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Tôi
								cảm thấy AkiMeet.com rất thú vị. Tôi có thể tìm kiếm thêm thông
								tin của bạn ở đâu?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Truy cập trang www.AkiMeet.com và nhấp vào liên kết “Chủ
								nhà hàng” và gửi cho chúng tôi thông tin của bạn. Sau đó, nhân
								viên của chúng tôi sẽ liên lạc với bạn để hẹn gặp mặt và trao
								đổi về hợp đồng của đôi bên.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">AkiMeet
								có giống như những dịch vụ giảm giá khác không?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Hoàn toàn không. AkiMeet không hề giảm giá mà chỉ khuyến
								khích người dùng sử dụng thường xuyên dịch vụ của mình để được
								hưởng những mức giá ưu đãi hằng ngày. Chúng tôi cố gắng giúp
								những chủ nhà hàng tận dụng được những khung giờ thấp điểm và
								gia tăng lượng thực khách quay trở lại nhà hàng.</p>
						</div>
					</div>
					<div
						style="margin-bottom: 10px; overflow: hidden; border-color: #ccc; background-color: #fff; border: 1px solid transparent; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);">
						<div style="background: #565656; color: #fff; padding: 5px;">
							<h4
								style="font-size: 14px; font-weight: normal; padding-left: 35px; text-transform: capitalize;">Làm
								cách nào nhà hàng của tôi làm việc được với AkiMeet.com?</h4>
						</div>
						<div style="padding: 5px; margin-left: 35px">
							<p>Chỉ cần gửi thông tin nhà hàng của bạn qua địa chỉ
								akimeet.com@gmail.com, nhân viên của chúng tôi sẽ chủ động liên hệ với
								bạn trong thời gian sớm nhất có thể.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>