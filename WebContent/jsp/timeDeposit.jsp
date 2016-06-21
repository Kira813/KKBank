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
	<base href="<%=basePath%>
	">
	<%@ taglib uri="/struts-tags" prefix="s"%>
	<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
	<%@include file="./userHeader.jsp"%>
</div>
<div class="wrapper row-offcanvas row-offcanvas-left" style="font-family:Microsoft YaHei">
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
				    <li role="presentation" class="active">
				        <a href="toTimeDeposit">Time Deposit</a>
				    </li>
				    <li role="presentation">
				        <a href="toTransfer">Transfer</a>
				    </li>
				    <li role="presentation">
				        <a href="toForeignExchange">Foreign Exchange</a>
				    </li>
				    <li role="presentation">
				        <a href="user/toPayment">Payment</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-warning">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">Time Deposit</h3>
							</div>
							<div class="box-body">
								<form role="form" action="toTimeDepositConfirm.action" method="post">
									<input name="ac_No" value="" style="display:none">
									<input name="term" value="" style="display:none">
									<div class="box-body">
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-credit-card"></i>
											</span>
											<select class="form-control" onchange="displayBalance();">
												<option name="ac_no" value="" selected>Please select a card account</option>
												<s:iterator value="#acList" status="st">
													<option name="ac_no" value="${ac_No}">${ac_No}</option>
												</s:iterator>
											</select>
											<span class="input-group-btn">
												<a class="btn btn-warning btn-flat" id="check_btn" href="javascript:void(0)">My Time-Deposit</a>
											</span>
										</div>
										<p></p>
										<div class="input-group">
											<span class="input-group-addon"> <i class="glyphicon glyphicon-check"></i>
												Balance
											</span>
											<div class="form-control">
												<span id="showbalance">${balance}</span>
											</div>
										</div>
										<p></p>
										<div class="input-group">
											<span class="input-group-addon">
												<span class=" glyphicon glyphicon-time"></span>
											</span>
											<select class="form-control">
												<option name="period" value="3">3 months</option>
												<option name="period" value="6">6 months</option>
												<option name="period" value="12">1 year</option>
												<option name="period" value="24">2 years</option>
												<option name="period" value="36">3 years</option>
												<option name="period" value="60">5 years</option>
											</select>
											<span class="input-group-addon">
												<a class="fa fa-bar-chart-o bg-warning" id="box_btn" href="javascript:void(0)" style="color:#f39c12"></a>
											</span>
										</div>
										<p></p>
										<div class="input-group">
											<span class="input-group-addon">￥</span>
											<input type="text" name="amount" id="amount" class="form-control" placeholder="Deposit Amount" required="required">
											<span class="input-group-addon">.00</span>
										</div>
										<p></p>
										<div class="bg-info info-custom" style="display:none">
											<a class="close" data-dismiss="alert">×</a>
											<span class="glyphicon glyphicon-exclamation-sign"></span> <strong>Tips!</strong>
											<span id="info1"></span>
										</div>
									</div>
								</form>
							
							<div class="box-footer">
								<a class="btn btn-warning" id="next_btn" href="javascript:void(0)">Next</a>
							</div>
							</div>
						</div>
					</section>
					Tips：The deposit amount should be more than 50 yuan.
				</aside>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="simpleDialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Tips</h4>
			</div>
			<div class="modal-body"></div>
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
var dialog = {
		el: $('#simpleDialog'),
		show: function(msg) {
			this.el.find('.modal-body').text(msg);
			this.el.modal('show');
		},
		hide: function() {
			this.el.modal('hide');
		}
	};
	//$(); 文档记载完成后执行，否则不会自动执行      
	function displayBalance() {
		var getBalanceAjax = 'ajax/getBalanceAjax.action';

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
	}
	$('select').on('change', function() { 
		$('.info-custom').hide(); 
	});
	
	$(function() {
		$('#box_btn').click(function() {
			/*var tips = <table><tr><th>+"Lump Fixed Deposit-Interest Rate"+</th></tr>+
				<tr>+"3 months-1.35%"+</tr>
				<tr>+"6 months-1.55%"+</tr>  
				<tr>+"1 year -1.75%"+</tr>   
				<tr>+"2 years-2.25%"+</tr>  
				<tr>+"3 years-2.75%"+</tr>  
				<tr>+"5 years-2.75%"+</tr></table>;*/
			//dialog.show(tips);
			dialog.show('3 months-1.35%,6 months-1.55%,1 year -1.75%,2 years-2.25%,3 years-2.75%,5 years-2.75%');
		});
	});
	//setInterval(.., 200); 200ms
	$(function() {
		var form = document.querySelector('form');
		var action = 'toTimeDepositConfirm.action';
		$('#next_btn').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			var period =  $('option[name=period]:checked').val();
			if (!ac_no) {
				$('#info1').text("Please select an account.");
				$('.info-custom').show();
				//dialog.show('Please select an account.');
			} else {
				var amount = $('input[name=amount]').val();
				var balance = $('#showbalance').attr('data-balance');
				
				balance = +balance;
				if(amount < 50){
					$('#info1').text("The deposit amount should be more than 50 yuan.");
					$('.info-custom').show();
				}
				else if(balance < amount){
					form.amount.value="";
					form.amount.focus();
					dialog.show('Balance is not enough.');
					
				} else {
					$('input[name="ac_No"]').val(ac_no);
					$('input[name="term"]').val(period);
					$('form').submit();
				}
			}
		});
	});
	$(function() {
		var form = document.querySelector('form');
		var action = 'toMyTimeDeposit.action';
		$('#check_btn').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			if (!ac_no) {
				$('#info1').text("Please select an account.");
				$('.info-custom').show();
				//dialog.show('Please select an account.');
			} else {
				window.location.href = action + '?ac_No=' + ac_no;
			}
		});
	});
	var tips = '${tips}';
	if(tips) {
		dialog.show(tips);
	}
</script></html>