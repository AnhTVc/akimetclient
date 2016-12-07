<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String contextPath = request.getContextPath();
%>
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
					<p style="text-align: center;" id="message_box"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<header class="main-header"
		style="    background-color: #3c8dbc; color: #fff;"> <!-- Logo -->
	<a href="/" class="logo" style="color: #fff;"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>A</b>KI</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>AKI</b>Meet</span>
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top"
		style="    background-color: #3c8dbc;"> <!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
		style="float: left; background-color: transparent;; background-image: none; padding: 15px 15px; font-family: fontAwesome;"
		role="button"> <span class="sr-only">Toggle navigation</span>
	</a>

	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- Messages: style can be found in dropdown.less-->
			<li class="dropdown messages-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" style="color: #fff;">
					<i class="fa fa-envelope-o"></i> <span class="label label-success">0</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 0 messages</li>
					<%-- <li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li>
								<!-- start message --> <a href="#">
									<div class="pull-left">
										<img src="<%=contextPath%>/guest/img/user2-160x160.jpg"
											class="img-circle" alt="User Image">
									</div>
									<h4>
										Support Team <small><i class="fa fa-clock-o"></i> 5
											mins</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a>
							</li>
							<!-- end message -->
							<li><a href="#">
									<div class="pull-left">
										<img src="<%=contextPath%>/guest/img/user3-128x128.jpg"
											class="img-circle" alt="User Image">
									</div>
									<h4>
										AdminLTE Design Team <small><i class="fa fa-clock-o"></i>
											2 hours</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="<%=contextPath%>/guest/img/user4-128x128.jpg"
											class="img-circle" alt="User Image">
									</div>
									<h4>
										Developers <small><i class="fa fa-clock-o"></i> Today</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="<%=contextPath%>/guest/img/user3-128x128.jpg"
											class="img-circle" alt="User Image">
									</div>
									<h4>
										Sales Department <small><i class="fa fa-clock-o"></i>
											Yesterday</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="<%=contextPath%>/guest/img/user4-128x128.jpg"
											class="img-circle" alt="User Image">
									</div>
									<h4>
										Reviewers <small><i class="fa fa-clock-o"></i> 2 days</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
						</ul>
					</li>
					<li class="footer"><a href="#">See All Messages</a></li> --%>
				</ul></li>
			<!-- Notifications: style can be found in dropdown.less -->
			<li class="dropdown notifications-menu " ><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" style="color: #fff;">
					<i class="fa fa-bell-o"></i> <span class="label label-warning">0</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 0 notifications</li>
					<!-- <li>
						inner menu: contains the actual data
						<ul class="menu">
							<li><a href="#"> <i class="fa fa-users text-aqua"></i> 5
									new members joined today
							</a></li>
							<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
									Very long description here that may not fit into the page and
									may cause design problems
							</a></li>
							<li><a href="#"> <i class="fa fa-users text-red"></i> 5
									new members joined
							</a></li>
							<li><a href="#"> <i
									class="fa fa-shopping-cart text-green"></i> 25 sales made
							</a></li>
							<li><a href="#"> <i class="fa fa-user text-red"></i> You
									changed your username
							</a></li>
						</ul>
					</li>
					<li class="footer"><a href="#">View all</a></li> -->
				</ul></li>
			<!-- Tasks: style can be found in dropdown.less -->
			
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" style="color: #fff;"><%=session.getAttribute("name_customer")%>
			</a></li>

		</ul>
	</div>
	</nav> </header>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar"> <!-- Sidebar user panel --> <!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu"
			style="color: #fff; text-overflow: ellipsis; white-space: nowrap; color: #c3cad4;">
			<li class="header" style="font-size: 15px;">TÀI KHOẢN</li>
			<li><a href="GeneralInfo" style="color: #8996a9;"><i
					class="fa fa-user" aria-hidden="true"></i><span>Thông tin cơ
						bản</span></a></li>
			<li><a href="AccountSecurity" style="color: #8996a9;"><i
					class="fa fa-key" aria-hidden="true"></i><span>Bảo mật - Mật
						khẩu</span></a></li>
			<li><a href="OrderHistory" style="color: #8996a9;"><i
					class="fa fa-calendar" aria-hidden="true"></i><span>Lịch sử
						đặt chỗ</span></a></li>
	
		</ul>
	</section> <!-- /.sidebar --> </aside>
</body>
</html>