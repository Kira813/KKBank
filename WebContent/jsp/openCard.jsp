<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Opening a debit card</title>
</head>
<body>
	<form action="account/addAccount.action" method="post">
		name:<input type="text" name="customer.name">
		ID:<input type="text" name="ID">
		PIN:<input type="text" name="password1">
		PIN Again:<input type="text" name="password2">
		<input type="submit" value="tijiao">
	</form>
</body>
</html>