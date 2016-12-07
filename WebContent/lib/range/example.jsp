<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<title>Insert title here</title>

<!-- Range -->
<link href="<%=contextPath%>/lib/range/css/normalize.min.css">
<link href="<%=contextPath%>/lib/range/css/main.css">

<link rel="stylesheet" href="<%=contextPath%>/lib/range/themes/fontawesome-stars.css">
<link rel="stylesheet" href="<%=contextPath%>/lib/range/themes/bootstrap-stars.css">

    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
<script src="<%=contextPath%>/lib/range/jquery.barrating.js"></script>
<script src="<%=contextPath%>/lib/range/examples.js"></script>
<div class="stars stars-example-fontawesome">
	<select id="example-fontawesome" name="rating" autocomplete="off">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select>
</div>
