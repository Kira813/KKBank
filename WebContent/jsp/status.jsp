<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<%@include file="./headMeta.jsp" %></head>
<title>KK Bank</title>
</head>
<body>
	<table>
		<tr>
			<td>Card Number:</td>
			<td>${ac_No}</td>
		</tr>
		<tr>
			<td>Customer Name:</td>
			<td>${name}</td>
		</tr>
		<tr>
			<td>Balance:</td>
			<td>${balance}</td>
		</tr>
		<tr>
			<td>Account Status:</td>
			<td>${sta_msg}</td>
		</tr>
	</table>
	<a class="btn btn-primary" href="account/delAccount.action">Close Account</a>
</body>
<%@include file="./javascript.jsp"%>
</html>