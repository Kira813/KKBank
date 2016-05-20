<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>KK Bank</title>
</head>
<body>
	<table>
		<tr>
			<td>Card Number:</td>
			<td>${ac_No}</td>
		</tr>
		<tr>
			<td>Customer Name:</td>
			<td>${name}</td>
		</tr>
		<tr>
			<td>Balance:</td>
			<td>${balance}</td>
		</tr>
		<tr>
			<td>Account Status:</td>
			<td>${sta_msg}</td>
		</tr>
	</table>

</body>
</html>