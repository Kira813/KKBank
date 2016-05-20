<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KK Bank</title>

<script language="javascript">
	function inform(){
		alert("The deposit action is successful and the amount has already added to the balance!");
	}
	
	function authInform(){
		var auth_code = prompt("Your amount  is >= CNY 50,000, please input authentication code.","");
		if(auth_code) 
		{
			location href="AdminDepositAction.java";
		}
		return auth_code;
	}
	    

</script>
</head>
<body>
	<form action="deposit" method="post">
		Account Number:<input type="text" name="ac_No"/><br/>
		Amount:<input type="text" name="amount"/><br/>
		${msg}<br/>
		<input type="submit" value="Confirm"/>
	</form>
</body>
</html>