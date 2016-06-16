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
				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title">Time Deposit</h3>
					</div>
					<form role="form" action="toTimeDepositConfirm.action" method="post">
					  <input name="ac_No" value="" style="display:none">
					  <input name="term" value="" style="display:none">
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
								<option name="period" value="3">3 months</option>
								<option name="period" value="6">6 months</option>
								<option name="period" value="12">1 year</option>
								<option name="period" value="24">2 years</option>
								<option name="period" value="36">3 years</option>
								<option name="period" value="60">5 years</option>
							</select>
						</div>
						<p>
						<div class="input-group">
							<span class="input-group-addon">￥</span> <input type="text"
								name="amount" id="amount" class="form-control"
								placeholder="Deposit Amount" required="required"> <span
								class="input-group-addon">.00</span>
						</div>
						<p>
						<div class="bg-info info-custom" style="display:none">
								  <a class="close" data-dismiss="alert">×</a>
								  <span class="glyphicon glyphicon-exclamation-sign"></span><strong> Tip! </strong>The deposit amount should be more than 50 yuan.
								</div>
						</div>
						<div class="box-footer">
							<a class="btn btn-warning" id="next_btn" href="javascript:void(0)">Next</a>	
						</div>
					</form>
				</div>
				Tips：The deposit amount should be more than 50 yuan.
		</section> 
	    </aside>
	</div>
<div class="modal fade" id="simpleDialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Tips</h4>
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
	//setInterval(.., 200); 200ms
	$(function() {
		var form = document.querySelector('form');
		var action = 'toTimeDepositConfirm.action';
		$('#next_btn').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			var period =  $('option[name=period]:checked').val();
			if (!ac_no) {
				alert('Please select an account.');
			} else {
				var amount = $('input[name=amount]').val();
				var balance = $('#showbalance').attr('data-balance');
				
				balance = +balance;
				if(amount < 50){
					$('.info-custom').show();
				}
				else if(balance < amount){
					form.amount.value="";
					form.amount.focus();
					alert('Balance is not enough.');
					
				} else {
					$('input[name="ac_No"]').val(ac_no);
					$('input[name="term"]').val(period);
					$('form').submit();
				}
			}
		});
	});
	var tips = '${tips}';
	if(tips) {
		dialog.show(tips);
	}
</script>
</html>