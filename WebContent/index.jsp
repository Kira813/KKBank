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
    <%@include file="./jsp/headMeta.jsp" %></head>
<body class="skin-blue">
hello
</body>
<%@include file="./jsp/javascript.jsp" %>
</html>