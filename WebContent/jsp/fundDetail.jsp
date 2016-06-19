<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>KK Bank</title>
<base href="<%=basePath%>">
</head>
<body>
	<c:forEach items="${fundli}" var="list">
		<p>Fund Name: ${list.fName}</p>
		<p>Fund Background: </p>
		<P>${list.fBackground}</p>
		<p>Fund Manager: ${list.fManage}</p>
		<p>Investment portfolio:</p>
		<p>${list.fInvest_portfolio}</p>
		<p>Purchase rate: <span format-toPercent>${list.fPur_rate}</span></p>
	</c:forEach>
	<a href="fund/listFund"><button>Return</button></a>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>