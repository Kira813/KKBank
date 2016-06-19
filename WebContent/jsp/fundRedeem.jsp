<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KK Bank</title>
</head>
<body>
	<p>You will redeem ${fName}</p>
	<p>Fund Code: ${fCode}</p>
	<p>Owner: ${name}</p>
	<p>ID: ${ID}</p>
	<p>Account: ${ac_No}</p>
	<p>Deal Date: ${dealDate}</p>
	<p>Capital: ${amount}</p>
	<p>Share:${share}</p>
	<p>Income: ${income}</p>
	<form action="fund/fundRedeem" method="post">
		<input type="hidden" name="fund_id" value="${fund_id}" />
		<input type="hidden" name="ac_No" value="${ac_No}" />
		<input type="hidden" name="amount" value="${amount}" />
		<input type="hidden" name="income" value="${income}" />
		<input type="password" name="PIN" required="required"
			oninvalid="setCustomValidity('Please input your card PIN')" oninput="setCustomValidity('')"/><br/>
		${msg}<br/>
		<input type="submit" value = "Submit" />
		<a href="fund/listMyFund"><input type="button" value = "Return"></a>
	</form>

</body>
</html>