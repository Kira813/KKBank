<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <%@ taglib uri="/struts-tags" prefix="s"%>
    <%@include file="./headMeta.jsp" %>
</head>
<body class="skin-blue">
	<%@include file="./header.jsp" %></head>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <%@include file="./sidebar.jsp" %>
        <aside class="right-side">
            <section class="content">
                <div class="row">
                	<div class="col-md-12">
                		<h1 style="text-align:center;font-family:Microsoft YaHei" >Welcome to KKBank,Administrator ${ad_id} </h1>
                	</div>
                </div>
            </section>
        </aside>
    </div>
</body>
<%@include file="./javascript.jsp" %>
</html>