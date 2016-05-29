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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KK Bank</title>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" style="font-family:Microsoft YaHei">
        <div class="header">Tips</div>
        	<div class="body bg-gray" style="text-align:center;font-size: 120%; margin-top: -5px">
				<p>Hello</p>
				<p>Your online banking account is activated now.</p>
				<p>Click "Return" button to return main page.</p>
			</div>
            <div class="footer" style="text-align:center">
                <a class="btn btn-primary btn-block" href="userIndex.action">Return</a>
            </div>
    </div>
</div>
<%@include file="./adminJsp/javascript.jsp"%>
</html>