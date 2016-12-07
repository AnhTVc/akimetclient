<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String contextPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 not found</title>
</head>
<link href="<%=contextPath%>/css/component.css" rel="stylesheet">

<link href="<%=contextPath%>/css/bootstrap-modal.css" rel="stylesheet">
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
	
<link href="<%=contextPath%>/css/customer.css" rel="stylesheet">
<body>
<!-- 404 not fond -->
<jsp:include page="header.jsp"></jsp:include>
<h2>Ồ rất tiếc. Thao tác của bạn không hợp lệ. Vui lòng liên hệ AkiFood để được hỗ trợ</h2>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>