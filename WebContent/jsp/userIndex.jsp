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
<title>Insert title here</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<body>
<div class="wrapper row-offcanvas row-offcanvas-left">

        <div style="font-family:Microsoft YaHei">User Index</div>

		<a class="btn btn-lg btn-default" href="user/userLogin">Log in</a>
		<a class="btn btn-lg btn-default" href="user/logout">Log out</a>
		<a class="btn btn-lg btn-primary" href="user/register.action">Register</a>
		<a class="btn btn-lg btn-default" href="toAccountEnquiry.action">Account Enquiry</a>
		<a class="btn btn-lg btn-default" href="user/toTransfer.action">Transfer</a>


    </div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>