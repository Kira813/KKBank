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
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box">
        <div class="header" style="font-family:Microsoft YaHei">User Index</div>
        	<div class="body bg-gray" style="padding:20px;text-align:center;font-size: 120%; margin-top: -5px;font-family:Microsoft YaHei">
				<a class="btn btn-lg btn-default btn-block" href="user/userLogin">Log in</a>
				<a class="btn btn-lg btn-primary btn-block" href="user/register.action">Register</a>
			</div>
            <div class="footer"> </div>
    </div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>