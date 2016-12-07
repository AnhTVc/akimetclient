<%@page import="com.project.util.constant.Define"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	HttpSession httpSession = request.getSession();
%>
<style type="text/css">
.mydropdown {
	width: 100%;
	background-color: #fff !important;
	border: 1px solid #cbcbcb;
	position: absolute;
}

.mydropdown a:HOVER {
	color: #f44336;
}
</style>
<div>
	<header id="sp-header" class="">
	<div class="container">
		<div class="row" style="position: relative;">
			<div id="sp-logo" class="col-xs-8 col-sm-4 col-md-1">
				<div class="sp-column ">
					<h1>
						<a class="logo" href="/" style="font-weight: 600"> AkiMeet </a>
					</h1>
				</div>
			</div>
			<div id="sp-menu" class="col-xs-4 col-sm-8 col-md-11"
				style="position: static;">
				<div class="sp-column ">
					<ul class="menu-account" id="user_menu">
						<li class="account-register"><a
							class="btn btn-primary btn-md btn-registration hidden-sm hidden-xs"
							href="business">Dành cho nhà hàng</a></li>
						<li class="account-register"><a
							class="btn btn-success btn-md btn-login hidden-sm hidden-xs"
							href="login">Đăng nhập</a></li>

					</ul>
					<div class="sp-megamenu-wrapper">
						<a id="offcanvas-toggler" class="visible-xs" href="#"><i
							class="fa fa-bars"></i></a>
						<ul class="sp-megamenu-parent menu-fade hidden-xs">
							<li class="sp-menu-item current-item active"><a href="/"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;Home</a></li>
							
							<li class="sp-menu-item"><a href="tim-kiem?type=<%=Define.RESTAURANT_TYPE_CULINARY%>"> <i class="fa fa-cutlery" aria-hidden="true"></i>&nbsp; Ẩm thực</a>
								<!-- <div
									class="sp-dropdown sp-dropdown-main sp-dropdown-mega sp-menu-right"
									style="width: 280px;">
									<div class="sp-dropdown-inner">
										<div class="row">
											<div class="col-sm-6">
												<ul class="sp-mega-group">
													<li class="sp-menu-item sp-has-child"><a
														class="sp-group-title" href="/items/html-templates"><i
															class="fa fa-html5"></i> </a>
														<ul class="sp-mega-group-child sp-dropdown-items">
															<li class="sp-menu-item"><a
																href="Collection?type=specialSale">Ưu đãi đặc biệt</a></li>
															<li class="sp-menu-item"><a
																href="Collection?type=lastSale">Ưu đãi mới nhất</a></li>
															<li class="sp-menu-item"><a
																href="Collection?type=careSale">Quan tâm nhất</a></li>
														</ul></li>
												</ul>
											</div>
											<div class="col-sm-6"></div>
										</div>
									</div>
								</div> -->
							</li>
							<!-- sp-has-child -->
							<li class="sp-menu-item "><a href="tim-kiem?type=<%=Define.RESTAURANT_TYPE_DRINK%>"><i class="fa fa-glass" aria-hidden="true"></i> &nbsp; Đồ uống</a>
								<!-- <div class="sp-dropdown sp-dropdown-main sp-menu-right"
									style="width: 240px;">
									<div class="sp-dropdown-inner">
										<ul class="sp-dropdown-items">
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=30001">Ăn vặt</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=30002">Góc phố</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=30003">Lãng mạn</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=30004">Gia đình sum
													họp</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=30005">Nhiều hơn thế
													nữa</a></li>
										</ul>
									</div>
								</div> -->
							</li>

							<li class="sp-menu-item"><a href="tim-kiem?type=<%=Define.RESTAURANT_TYPE_ENTERTAINMENT%>"><i
									class="fa fa-support"></i><i class="fa fa-cutlery" aria-hidden="true"></i> &nbsp; Giải trí</a>
								<!-- <div class="sp-dropdown sp-dropdown-main sp-menu-right"
									style="width: 240px;">
									<div class="sp-dropdown-inner">
										<ul class="sp-dropdown-items">
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40001">Buffer </a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40002">Món Á</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40003">Món Âu</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40004">Món thái</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40005">Món hoa</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40006">Món dân tộc</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40007">Ăn chơi</a></li>
											<li class="sp-menu-item"><a
												href="tim-kiem-theo-chu-de?keyword=40008">Nhiều hơn thế
													nữa</a></li>

										</ul>
									</div>
								</div> -->
							</li>
							<li class="sp-menu-item "><a href="tim-kiem?type=<%=Define.RESTAURANT_TYPE_HEALTH%>"><i class="fa fa-medkit" aria-hidden="true"></i> &nbsp; Sức khỏe - làm đẹp</a></li>
							<li class="sp-menu-item sp-has-child" id="user_setting"
								style="display: none"><a href="#"><i
									class="fa fa-support"></i> &nbsp;&nbsp;<%=session.getAttribute("name_customer") %></a>
								<div class="sp-dropdown sp-dropdown-main sp-menu-right"
									style="width: 240px;">
									<div class="sp-dropdown-inner">
										<ul class="sp-dropdown-items">
											<li class="sp-menu-item"><a
												href="Credit/OrderHistory">Lịch sử đặt
													chỗ </a></li>
											<li class="sp-menu-item"><a
												href="Logout">Thoát</a></li>

										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</header>
</div>

<script type="text/javascript">
	$(document).ready ( function(){
		var name_customer = "<%=session.getAttribute("name_customer")%>";
		
		if (name_customer != 'null') {
			document.getElementById("user_menu").style.display = "none";
			document.getElementById("user_setting").style.display = "inline-block";

			/*$('#user_menu').style.display = "none";  
			$('#user_setting').style.display = "block";   */
		} else {
			/*$('#user_setting').style.display = "none";  
			$('#user_menu').style.display = "block";   */
			document.getElementById("user_setting").style.display = "none";
			document.getElementById("user_menu").style.display = "inline-block";
		}
	});
</script>