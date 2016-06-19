<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>KK Bank</title>
</head>
<body>
<%-- <%String fCode = request.getParameter("fCode"); %> --%>
	<form action="fund/fundPurchase" method="post">
		Your are going to purchase ${fCode} ${fName}.<br/><br/>
		<input type="hidden" name="fCode" value="${fCode}"/>
		Please select your account:<br/>
		<select name="ac_No" id="ac_No_selection" onchange="showBalance()">
			<option value="null">--Please select--</option>
			<c:forEach items="${acList }" var="list">
				<option value="${list.ac_No }">${list.ac_No }</option>
			</c:forEach>
		</select><br/>
		<div id="showBal"></div><br/>
		Purchase amount:<br/>
		<input type="text" name="amount" required="required"
			oninvalid="setCustomValidity('Please input your a valid amount')" oninput="setCustomValidity('')"/><br/>
		Card PIN:<br/>
		<input type="password" name="PIN" required="required"
			oninvalid="setCustomValidity('Please input your card PIN')" oninput="setCustomValidity('')"/><br/>
		${msg }<br/>
		<input type="submit" value="Submit" />
		<!-- <a class="btn btn-lg btn-default" href="javascript:void(0)" id="submit_btn">Submit</a> -->
	</form>

</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">

	function showBalance(){
		var objS = document.getElementById("ac_No_selection");
		var seAC = objS.options[objS.selectedIndex].value;

		var getBalanceAjax= "ajax/getBalanceAjax";
		
		if(seAC == "null"){
			document.getElementById("showBal").innerHTML = "";
		}
		else{
			$.get(getBalanceAjax, {
				'ac_No': seAC
			}, function(data){
				document.getElementById("showBal").innerHTML = "The balance of this account is ￥"+ data.balance;		
			});
		}
	}
	
	/*$(function() {
		var action = 'fundPurchase.action';
		
		$('#submit_btn').click(function() {
			var ac_no = $('input[name=ac_no]:checked').val();
			var amount = $('input[name=amount]').val();
			var PIN = $('input[name=PIN]').val();
			
			if(!ac_no) {
				alert('Please select an account.');
			}else{
				window.location.href = action + '?fName=' + fName + 'ac_No=' + ac_no + '&amount=' + amount + '&PIN=' + PIN;
			}
		});	
	});*/
</script>
</html>