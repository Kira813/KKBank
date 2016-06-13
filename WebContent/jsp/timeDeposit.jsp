<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>KKBank | Time Deposit</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
	<%@include file="./userHeader.jsp"%>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<aside class="center-side" style="font-family:Microsoft YaHei">
		<section class="content">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Time Deposit</h3>
					</div>
					<form role="form" action="" method="post">
					  <div class="box-body">
						<label>Please select a card account:</label> 
						<select class="form-control">
							<s:iterator value="#acList" status="st">
								<option name="ac_no" value="${ac_No}">${ac_No}</option>
							</s:iterator>
						</select>
						<p>
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-check"></i> Balance
							</span>
							<div class="form-control">
								<span id="showbalance">${balance}</span>
							</div>
						</div>
						<p>
						<div class="input-group">
							<span class="input-group-addon"><span
								class=" glyphicon glyphicon-time"></span></span> 
							<select class="form-control">
								<option name="period" value="3m">3 months</option>
								<option name="period" value="6m">6 months</option>
								<option name="period" value="y">1 year</option>
								<option name="period" value="2y">2 years</option>
								<option name="period" value="3y">3 years</option>
								<option name="period" value="5y">5 years</option>
							</select>
						</div>
						<p>
						<div class="input-group">
							<span class="input-group-addon">￥</span> <input type="text"
								name="amount" class="form-control" name="amount"
								placeholder="Deposit Amount" required="required"> <span
								class="input-group-addon">.00</span>
						</div>
						</div>
						<div class="box-footer">
							<a class="btn  btn-default" href="javascript:void(0)"
								id="next_btn" type="submit">Next</a>
						</div>
					</form>
				</div>
		</section> 
	    </aside>
	</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	//$(); 文档记载完成后执行，否则不会自动执行      200ms
	setInterval(function displayBalance() {
		var getBalanceAjax = 'ajax/getBalanceAjax.action';

		$.get(getBalanceAjax, {
			'ac_No' : $('option[name=ac_no]:checked').val()
		}, function(data) {
			if (data.status) {
				/*
				var reg = /(\d)(?=(\d\d\d)+(?!\d))/g; 
				var tips = data.tips.replace(/(\d+\.\d*)/, function($1) {
					return (+$1).toFixed(2);
				}).replace(reg, '$1,');*/
				var balance = data.balance;
				$('#showbalance').text(balance);
			} else {
				alert('Invalid account.');
			}
		});
	}, 200);
	$(function() {
		var action = 'toTimeDepositConfirm.action';

		$('#next_btn').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();

			if (!ac_no) {
				alert('Please select an account.');
			} else {
				window.location.href = action + '?ac_No=' + ac_no;
			}
		});
	});
</script>
</html>