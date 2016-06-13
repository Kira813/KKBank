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
<title>KKBank | Balance Status</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<%@include file="./userHeader.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<aside class="right-side" style="font-family:Microsoft YaHei">
		<section class="content">
	        <div style="font-family:Microsoft YaHei">
	       		<p> Account: ${ac_No }</p>
				<p>Balance: <span format-balance>${balance }</span></p>
			</div>
		<div class="box-footer">
			<a class="btn  btn-default" href="toTransctionDetail.action?ac_No=${ac_No }">The last 10 transaction records</a>
		</div>
		</section>
	</aside>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>
