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
<title>KKBank | Foreign Exchange</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<%@include file="./userHeader.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<aside class="center-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">Foreign Exchange</h3>
				</div>
		        <a href="toExchange">Exchange Settlement</a>
		        <p>
		        <a href="toExchangeForeign">Foreign Settlement</a>
		    </div>
	    </section>
	</aside>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>

