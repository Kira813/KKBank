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
<title>KKBank | Account Enquiry</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<%@include file="./userHeader.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<aside class="left-side sidebar-offcanvas">
	    <!-- sidebar: style can be found in sidebar.less -->
	    <section class="sidebar" style="font-family:Microsoft YaHei">
	        <ul class="sidebar-menu">
	            <li data-tag="user">
	                <a href="toAccountSelection.action">
	                    <i class="fa fa-user"></i><span>Balance Enquiry</span>
	                </a>
	            </li>
	        </ul>
	    </section>
	    <!-- /.sidebar -->
	</aside>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>