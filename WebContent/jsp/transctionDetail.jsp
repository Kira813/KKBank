<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
the last 10 transactions
<a class="btn btn-lg btn-default" href="#">history transactions button</a>
1.点一下 出现一个two date selection boxes
input start date and end date and also a “Confirm”button
2.if valid -》the transaction records displayed by page, each page shows maximum 10 records,
 there are “Next” and “Previous” button to navigate.
 “Return” button can be seen, when click it will turn to enquiry page


</body>
</html>