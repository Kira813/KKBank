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
account: ${ac_No }
balance: ${balance }
<a class="btn btn-lg btn-default" href="toTransctionDetail.action?ac_No=${ac_No }">the last 10 transactions button</a>

</body>
</html>