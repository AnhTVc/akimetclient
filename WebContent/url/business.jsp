<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<%
	String contextPath = request.getContextPath();
	String mes = (String)session.getAttribute("message");
%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Akimeet | Dành cho nhà hàng</title>

<meta name="description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta name="author" content="Akimeet">
<meta keywork="akimeet, akimeet.com, www.akimeet" content="">
<meta property="og:title" content="Akimeet - Tìm kiểm ưu đãi từ tất cả các nhà hàng, tất cả các dịch vụ" >
<meta  property="og:description" content="Tìm kiếm thật nhiều ưu đãi từ các dịch vụ ẩm thực, giải trí, sức khỏe - làm đẹp, du lịch trên toàn quốc">
<meta property="og:type" content="website">
<meta name="robots" content="index, follow">
<meta property="og:url" content="https://www.akimeet.com/">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/lib/bootstrap/css/bootstrap.min.css">

<!-- Custom Fonts -->
<link
	href="<%=contextPath%>/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="<%=contextPath%>/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="<%=contextPath%>/css/creative.min.css" rel="stylesheet">

<style type="text/css">
.form_input {
	margin-left: 30px;
	margin-right: 30px;
	margin-top: 20px;
	padding: 20px;
	width: 100%;
	height: 40px;;
	border: 2px solid #fff;
	background: none;
	border-radius: 6px;
	box-shadow: none;
	font-size: 14px;
	color:;
	padding: 20px;
}
/*Loader*/
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
	background: url(images/default/load.gif) center no-repeat #fff;
}

:-moz-placeholder { color: red; opacity:1;}
::-moz-placeholder { color: red; opacity:1;}
</style>

</head>
<script src='<%=contextPath%>/lib/jquery/jquery.min.js'></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script type="text/javascript">
$(window).load(function() {
	// Animate loader off screen
	$(".se-pre-con").fadeOut("slow");;
});
</script>
<body id="page-top">
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
					<p style="text-align: center;"><%=mes%></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="/">AkiMeet</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" href="#about">Giới thiệu</a></li>
					<li><a class="page-scroll" href="#services">Hoạt động</a></li>
					<li><a class="page-scroll" href="#login">Đăng nhập</a></li>
					<li><a class="page-scroll" href="#contact">Liên hệ</a></li>
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<header>
		<div class="header-content">
			<div class="col-lg-6">
				<div class="header-content-inner" >
					<h1 id="homeHeading">AkiMeet.com là gì?</h1>
					<hr>
					<p style="margin-left:25px ; text-align: left;">AkiMeet là một trang mạng giúp bạn tiết kiệm chi phí và thời gian khi đặt chỗ tại một địa điểm nào đó.</p>
					<p style="margin-left:25px; text-align: left;">Tất cả những cửa hàng ăn uống đều gặp phải tình huống không đủ bàn cho khách vào những giờ cao điểm và vắng khách trong những giờ thấp điểm. Bằng cách đưa ra những ưu đãi giảm giá vào nhiều khung giờ khác nhau, Akimeet.com sẽ giúp các chủ nhà hàng tổ chức lại thời gian nhằm thu hút thêm khách hàng vào những giờ thấp điểm.!</p>
					<a href="#about" class="btn btn-primary btn-xl page-scroll">Đăng
						nhập</a>

				</div>
			</div>
			<div class="col-lg-6">
				<form action="business" method="post">
					<div class="col-sm-12">
						<h2>Nhà hàng đăng ký</h2>
						<div class="required">
							<input required="required" type="text" class="form_input"
								name="name_boss" id="name_boss" placeholder="Họ tên">
						</div>
					</div>
					<div class="col-sm-12">
						<div class="required">
							<input required="required" type="text" class="form_input"
								name="email_register" placeholder="Email">
						</div>
					</div>

					<div class="col-sm-12">
						<div class="required">
							<input required="required" type="text" class="form_input"
								name="phonenumber" placeholder="Số điện thoại">
						</div>
					</div>
					<div class="col-sm-12">
						<div class="required">
							<input required="required" type="password" class="form_input"
								name="password_register" placeholder="Password">
						</div>
					</div>
					<button class="btn btn-primary btn-xl page-scroll" type="submit"
						style="margin-top: 30px;">Đăng ký</button>
				</form>
			</div>

		</div>
	</header>
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">Vấn đề chung</h2>
					<hr class="primary">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12 text-center">
					<div class="service-box" style=" max-width: none">
						<i class="fa fa-4x fa-registered text-primary sr-icons"></i>
						<h2>VÌ SAO NÊN CHỌN AKIMEET.COM?</h2>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px"><strong style="color: #ed1c24">Chi phí</strong></p>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px">Chi phí hợp lý, AkiMeet đảm bảo sẽ không thu thêm bất kỳ một chi phí phát sinh nào!</p>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px"><strong style="color: #ed1c24">Thấu hiểu khách hàng</strong></p>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px">Chúng tôi sẽ cung cấp những thông tin xác thực nhất để bạn thuận lợi trong việc thiết kế chiến dịch marketing cho nhóm đối tượng mục tiêu.</p>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px"><strong style="color: #ed1c24">Đơn giản và dễ dàng</strong></p>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px">Là người quản lý nội dung quảng cáo cho nhà hàng bạn, chúng tôi sẽ chịu trách nhiệm giải quyết những rắc rối nếu có.</p>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px"><strong style="color: #ed1c24">Hoạt động 24/7</strong></p>
						<p class="text-muted" style="margin-bottom: 15px;text-align: left; margin-left: 25px">Akimeet sẽ hoạt động xuyên suốt ngay cả trong thời điểm nhà hàng đóng cửa.</p>
						
					</div>
				</div>
				<div class="col-lg-4 col-md-12 text-center">
					<div class="service-box" style="padding-top: 100px; padding-left: 100px">
					<img src="http://offpeak.vn/assets/images/img-r-003.png" class="img-responsive">
						<!-- <i class="fa fa-4x fa-calendar text-primary sr-icons"></i>
						<h3>Khách hàng</h3>
						<p class="text-muted" style="margin-bottom: 15px">Ăn món gì ngon nhất?</p>
						<p class="text-muted" style="margin-bottom: 15px">Ăn ở đâu rẻ nhất?</p>
						<p class="text-muted" style="margin-bottom: 15px">Ăn ở đâu để có được ưu đãi?</p>
						<p class="text-muted" style="margin-bottom: 15px">Ăn khung giờ nào hợp lý?</p> -->
						
						
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h4 class="section-heading">Hãy để chúng tôi giúp bạn</h4>
					<hr class="primary">
				</div>
			</div>
		</div>
	</section>
	<section class="bg-primary" id="login">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="text-center" style="max-width: none">
						<h2 class="section-heading">Chúng tôi có những gì bạn cần!</h2>
						<hr class="light">
						<p class="text-faded" style="color: #fff; text-align: left; margin-left: 25px"><strong>Gia tăng số lượng khách hàng</strong></p>
						<p class="text-faded" style="text-align: left; margin-left: 25px">AkiMeet mong muốn sẽ mang đến cho bạn nhiều và nhiều hơn nữa số khách hàng mà bạn đang có.!</p>
						<p class="text-faded" style="color: #fff; text-align: left; margin-left: 25px"><strong>Lắp đầy những chiếc bàn trống</strong></p>
						<p class="text-faded" style="text-align: left; margin-left: 25px">Bằng các chiến lược marketing và tối ưu hóa tổ chức giờ giấc giúp nhà hàng nhằm gia tăng số thực khách đến nhà hàng vào những giờ thấp điểm.</p>
						<p class="text-faded" style="color: #fff; text-align: left; margin-left: 25px"><strong>Quảng bá thương hiệu</strong></p>
						<p class="text-faded" style="text-align: left; margin-left: 25px">Tiếp thị trực tiếp và truyền thông, mạng xã hội với khách hàng về ưu đãi của nhà hàng bạn!</p>
						<p class="text-faded" style="color: #fff; text-align: left; margin-left: 25px"><strong>Xây dựng thương hiệu online</strong></p>
						<p class="text-faded" style="text-align: left; margin-left: 25px">Hãy đưa cho chúng tôi thương hiệu của bạn và chúng tôi sẽ giúp nó có mặt trên các phương tiện truyền thông đại chúng online.</p>
						<a href="#services"
							class="page-scroll btn btn-default btn-xl sr-button">Hoạt động!</a>
					</div>
				</div>
				<div class="col-lg-4">

					<form action="business" method="post" >
						<div class="col-sm-12">
						<h2 style="text-align: center;">Nhà hàng nhập</h2>
							<div class="required">
								<input required="required" type="text" class="form_input"
									name="email_login" placeholder="Email">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="required">
								<input required="required" type="password" class="form_input"
									name="password_login" placeholder="Password">
							</div>
						</div>
						<button class="btn btn-primary btn-xl page-scroll" type="submit" 
							style="margin-top: 30px; background: #44c7f4; margin-left: 40%">Đăng nhập</button>
					</form>
					<img style="margin-left: 25px" src="http://offpeak.vn/assets/images/img_r_letushelpu.png" class="img-responsive">
				</div>
				
			</div>
		</div>
	</section>
	
	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">AkiMeet hoạt động như thế nào</h2>
					<hr class="primary">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-registered text-primary sr-icons"></i>
						<h3>Nhà hàng</h3>
						<p class="text-muted">Đăng ký sử dụng dịch vụ AkiMeet</p>
						<p class="text-muted">Chờ để AkiMeet kiểm tra thông tin</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-calendar text-primary sr-icons"></i>
						<h3>Nhà hàng</h3>
						<p class="text-muted">Cung cấp hình ảnh, thực đơn, địa chỉ của nhà hàng</p>
						<p class="text-muted">Lập lịch ưu đãi!</p>
						<p class="text-muted">Xác nhận thông tin đặt chỗ của khách hàng!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-newspaper-o text-primary sr-icons"></i>
						<h3>AkiMeet</h3>
						<p class="text-muted">Meetink quảng cáo, tiếp thị</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-money text-primary sr-icons"></i>
						<h3>Khách hàng</h3>
						<p class="text-muted">Tham khảo thông</p>
						<p class="text-muted">Thực hiện đặt chỗ qua AkiMeet, nhận ưu đãi mà không phải đặt trước chi phí nào!</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12  text-center">
					<h2 class="section-heading">Hãy tham gia cùng chúng tôi nào!</h2>
					<hr class="primary">
					<p>Nếu bạn chưa hiểu về AkiMeet hay có thắc mắc! Đừng ngần ngại, hãy liện hệ với chúng tôi</p>
				</div>
				<div class="col-lg-4 col-lg-offset-2 text-center">
					<i class="fa fa-phone fa-3x sr-contact"></i>
					<p>01677-826-011</p>
				</div>
				<div class="col-lg-4 text-center">
					<i class="fa fa-envelope-o fa-3x sr-contact"></i>
					<p>
						<a href="mailto:akimeet.com@gmail.com">akimeet.com@gmail.com</a>
					</p>
				</div>
			</div>
		</div>
	</section>
</body>
<div class="se-pre-con"></div>

	<!-- jQuery -->
	<script src="<%=contextPath%>/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=contextPath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="<%=contextPath%>/vendor/scrollreveal/scrollreveal.min.js"></script>
	<script
		src="<%=contextPath%>/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Theme JavaScript -->
	<script src="<%=contextPath%>/js/creative.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var message = '<%=mes%>';
		
		if(message != null && message != "null"){
			$("#dialog_message").modal()
			<%session.removeAttribute("message");%>
		}
		
    });
	</script>
</html>