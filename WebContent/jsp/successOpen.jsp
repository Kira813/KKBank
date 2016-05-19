<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<p>Hello, ${customer.name }.</p> <!-- 从ActionContext中取出 -->
	<p>Your account is: ${account.ac_No}</p>
	<a href="returnMain.action">return main page</a> <!-- action调用jsp -->
</body>
</html>