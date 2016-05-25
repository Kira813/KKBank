<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
 <form action="user/addUser.action" method="post">
	user name:<input type ="text" name="username">
	ID:<input type="text" name="ID">
	Email:<input type="email" name="email">
	password:<input type="password" name="pwd1">
	password again:<input type="password" name="pwd2">
	<input type="submit" value="Submit">
	<a href="userIndex.action">Return</a>
</form>
</body>
</html>