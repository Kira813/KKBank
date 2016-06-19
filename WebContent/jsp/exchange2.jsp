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
<title>KKBank | Exchange</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
<%@include file="./userHeader.jsp"%>
</div>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked left-nav-custom">
				    <li role="presentation">
				        <a href="toAccountEnquiry">Account Enquiry</a>
				    </li>
				    <li role="presentation">
				        <a href="javascript:void(0)">Fund</a>
				    </li>
				    <li role="presentation">
				        <a href="toTimeDeposit">Time Deposit</a>
				    </li>
				    <li role="presentation">
				        <a href="toTransfer">Transfer</a>
				    </li>
				    <li role="presentation" class="active">
				        <a href="toForeignExchange" style="font-family:Microsoft YaHei">Foreign Exchange</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-success">
							<div class="box-header" >
								<h3 class="box-title" style="font-family:Microsoft YaHei">Exchange Settlement</h3>
							</div>
							<div class="box-body">
							 		<div class="input-group">
							 		<span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
										<select class="form-control" onchange="displayBalance();">
											<option name="ac_no" value="" selected>Please select a card account</option>
											<s:iterator value="#acList" status="st">
												<option name="ac_no" value="${ac_No}">${ac_No}</option>
											</s:iterator>
										</select>
									</div>
									<p>
									<form role="form" action="toRmb" method="post">
									<input name="ac_No" style="display:none">
									<input name="currency" style="display:none">
									<h4 style="font-family:Microsoft YaHei">Balance details:</h4>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-yen " style="color:"></i> RMB
										</span>
										<div class="form-control">
											<span id="showbalance">${balance}</span>
										</div>
									</div>
									</form>
									<p></p>
									<div class="input-group" style="display:">
										<span class="input-group-addon">
											<i class="fa fa-dollar"></i> USD
										</span>
										<div class="form-control">
											<span id="showusd"></span>
										</div>
										<span class="input-group-btn">
											<a class="btn btn-success btn-flat" id="exchange_btn1" href="javascript:void(0)">Exchange to RMB</a>
										</span>										
									</div>
									<p></p>
									<div class="input-group" style="display:">
										<span class="input-group-addon">
											<i class="fa fa-jpy"></i> JPY
										</span>
										<div class="form-control">
											<span id="showjpy"></span>
										</div>
										<span class="input-group-btn">
											<a class="btn btn-success btn-flat" id="exchange_btn2" href="javascript:void(0)">Exchange to RMB</a>
										</span>										
									</div>
									<p></p>
									<div class="input-group" style="display:">
										<span class="input-group-addon">
											<i class="fa fa-dollar"></i> HKD
										</span>
										<div class="form-control">
											<span id="showhkd"></span>
										</div>
										<span class="input-group-btn">
											<a class="btn btn-success btn-flat" id="exchange_btn3" href="javascript:void(0)">Exchange to RMB</a>
										</span>										
									</div>
									<p></p>
									<div class="input-group" style="display:">
										<span class="input-group-addon">
											<i class="fa fa-gbp"></i> GBP
										</span>
										<div class="form-control">
											<span id="showgbp"></span>
										</div>
										<span class="input-group-btn">
											<a class="btn btn-success btn-flat" id="exchange_btn4" href="javascript:void(0)">Exchange to RMB</a>
										</span>										
									</div>
									<p></p>
									<div class="input-group" style="display:">
										<span class="input-group-addon">
											<i class="fa fa-dollar"></i> AUD
										</span>
										<div class="form-control">
											<span id="showaud"></span>
										</div>
										<span class="input-group-btn">
											<a class="btn btn-success btn-flat" id="exchange_btn5" href="javascript:void(0)">Exchange to RMB</a>
										</span>										
									</div>
							</div>
					    </div>
				    </section>
				</aside>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	function displayBalance() {
		var getBalanceAjax = 'ajax/getBalanceAjax.action';
		var getCurrencyAjax = 'ajax/getCurrencyAjax.action';

		$.get(getBalanceAjax, {
			'ac_No' : $('option[name=ac_no]:checked').val()
		}, function(data) {
			if (data.status) {
				var bal = data.txt;
				$('#showbalance').text(bal);
				$('#showbalance').attr("data-balance", data.balance);
			} else {
				$('#showbalance').text(" ");
			}
		});
		$.get(getCurrencyAjax, {
			'ac_No' : $('option[name=ac_no]:checked').val()
		}, function(data) {
			if (data.status) {
				var usd = data.usd;
				var jpy = data.jpy;
				var hkd = data.hkd;
				var gbp = data.gbp;
				var aud = data.aud;
				$('#showusd').text(usd);
				$('#showjpy').text(jpy);
				$('#showhkd').text(hkd);
				$('#showgbp').text(gbp);
				$('#showaud').text(aud);
			}
		});
	}
	$(function(){
		var form = document.querySelector('form');
		$('#exchange_btn1').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			if (!ac_no) {
				alert('Please select an account.');
			} else {
					$('input[name="ac_No"]').val(ac_no);
					$('input[name="currency"]').val('USD');
					$('form').submit();
				}
			});
		$('#exchange_btn2').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			if (!ac_no) {
				alert('Please select an account.');
			} else {
					$('input[name="ac_No"]').val(ac_no);
					$('input[name="currency"]').val('JPY');
					$('form').submit();
				}
			});
		$('#exchange_btn3').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			if (!ac_no) {
				alert('Please select an account.');
			} else {
					$('input[name="ac_No"]').val(ac_no);
					$('input[name="currency"]').val('HKD');
					$('form').submit();
				}
			});
		$('#exchange_btn4').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			if (!ac_no) {
				alert('Please select an account.');
			} else {
					$('input[name="ac_No"]').val(ac_no);
					$('input[name="currency"]').val('GBP');
					$('form').submit();
				}
			});
		$('#exchange_btn5').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			if (!ac_no) {
				alert('Please select an account.');
			} else {
					$('input[name="ac_No"]').val(ac_no);
				$('input[name="currency"]').val('AUD');
					$('form').submit();
				}
			});
	});
</script>
</html>