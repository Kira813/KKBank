<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<title>KK Bank</title>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
	<%@include file="./userHeader.jsp"%>
</div>
<div class="container">
	<div class="wrapper row-offcanvas row-offcanvas-left">
						<aside class="right-content-custom" style="font-family:Microsoft YaHei">
						<section>
							<div class="box box-success">
								<div class="box-header">
									<h3 class="box-title" style="font-family:Microsoft YaHei">Payment</h3>
								</div>
									<div class="box-body">
											<p>Bill Number:${bNo}</p><br/>
	<p>Bill Owner:${name}</p><br/>
	<p>Bill Item:${item}</p><br/>
	<p>Details:${bDetail}</p><br/>
	<p>Period: ${start_date} - ${end_date}</p><br/>
	<p>Amount: <span format-balance>${bAmount}</span></p><br/>
	<form action="user/pay" method="post">
	<input type="hidden" name="bNo" value="${bNo}">
	Please select an account:<br/>
		<select name="ac_No" id="ac_No_select" onchange="showBalance()">
			<c:forEach items="${acList}" var="list">
				<option value="${list.ac_No}">${list.ac_No}</option>
			</c:forEach>
		</select><br/>
		<div id="showBal"></div><br/>
	Card PIN:
		<input type="password" name="PIN" placeholder="PIN" required="required"
			oninvalid="setCustomValidity('Please input your card PIN')" oninput="setCustomValidity('')"/><br/>
		${msg}<br/>
		<input class="btn btn-primary" type="submit" value="Confirm"/>
		<a href="user/showPersonalBill"><input class="btn btn-default" type="button" value="Return"/></a>
	</form>
									</div>
							</div>
						</section>
						</aside>
									

</div>
</div>
	
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	function showBalance(){
		var objS = document.getElementById("ac_No_select");
		var seAC = objS.options[objS.selectedIndex].value;
		
		var getBalanceAjax= "ajax/getBalanceAjax";
		
		$.get(getBalanceAjax, {
			'ac_No': seAC
		}, function(data){
			/* var bal = (data.balance).toFixed(2) + " ";
			var str = bal.split("").reverse().join("").replace(/(\d{3})/g, "$1,").split("").reverse().join(""); */
			document.getElementById("showBal").innerHTML = "The balance of this account is ￥"+ data.balance;		
		});
	}
	
</script>
</html>