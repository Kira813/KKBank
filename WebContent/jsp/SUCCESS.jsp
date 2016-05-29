<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" id="login-box" >
        <div class="header"></div>
        	<p style="background:#eaeaec;text-align:center;margin:0;padding-top:10px;color:#333;line-height:14px;margin-bottom:-20px;"></p>
        	<div class="body bg-gray" style="text-align:center">
				<div class="form-group" >
				<h1 style="color:white;font-family:Microsoft YaHei">User Main Page</h1>
			    </div>
		   </div>
		         <div class="footer">
		         </div>
    </div>
</div>
<%@include file="./adminJsp/javascript.jsp"%>
</body>
</html>