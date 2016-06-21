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
<title>KK Bank | Payment</title>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
	<%@include file="./userHeader.jsp"%>
</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked left-nav-custom">
				    <li role="presentation">
				        <a href="toAccountEnquiry">Account Enquiry</a>
				    </li>
				    <li role="presentation">
				        <a href="fund/listFund">Fund</a>
				    </li>
				    <li role="presentation">
				        <a href="toTimeDeposit">Time Deposit</a>
				    </li>
				    <li role="presentation">
				        <a href="toTransfer">Transfer</a>
				    </li>
				    <li role="presentation">
				        <a href="toForeignExchange">Foreign Exchange</a>
				    </li>
				    <li role="presentation" class="active">
				        <a href="user/toPayment">Payment</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-teal">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">Pay Confirmation</h3>
							</div>
							<div class="box-body">
							<p>Bill Number:${bNo}</p><br/>
							<p>Bill Owner:${name}</p><br/>
							<p>Bill Item:${item}</p><br/>
							<p>Details:${bDetail}</p><br/>
							<p>Period: ${start_date} - ${end_date}</p><br/>
							<p>Amount: <span format-balance>${bAmount}</span></p><br/>
							<form action="user/payOthers" method="post">
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
									<a href="user/toOtherBill"><input class="btn btn-default" type="button" value="Return"/></a>
							</form>
							</div>
						</div>
					</section>
				</aside>
			</div>
		</div>
	</div>
	<div class="modal fade" id="simpleDialog2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Tips</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="javascript:void(0)" class="close" data-dismiss="modal"
					aria-label="Close">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
var dialog2 = {
		el: $('#simpleDialog2'),
		show: function(msg) {
			this.el.find('.modal-body').text(msg);
			this.el.modal('show');
		},
		hide: function() {
			this.el.modal('hide');
		}
	};

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
	var msg = '${msg}';
	if(msg) {
		dialog2.show(msg);
	}
	var msg2 = '${msg2}';
	if(msg2) {
		dialog2.show(msg2);
	}
	
</script>
</html>