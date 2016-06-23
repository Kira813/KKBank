<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import= "com.opensymphony.xwork2.ActionContext" %>
<%@ page import= "com.opensymphony.xwork2.ActionSupport" %>
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
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
<title>KKBank | Transfer</title>
</head>
<body>
<div class="container">
<%@include file="./userHeader.jsp"%>
</div>
<div class="wrapper row-offcanvas row-offcanvas-left">
<div class="container">
			<div class="row">
				<div class="col-md-3">
					<ul class="nav nav-pills nav-stacked left-nav-custom nav-custom4">
					    <li role="presentation">
					        <a href="toAccountEnquiry">Account Enquiry</a>
					    </li>
					    <li role="presentation">
					        <a href="fund/listFund">Fund</a>
					    </li>
					    <li role="presentation">
					        <a href="toTimeDeposit">Time Deposit</a>
					    </li>
					    <li role="presentation" class="active">
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
							<div class="box box-primary">
								<div class="box-header">
									<h3 class="box-title" style="font-family:Microsoft YaHei">Transfer</h3>
								</div>
								<form role="form" action="user/transfer" method="post">
								<div class="box-body">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-credit-card"></i>
										</span>
										<select name="ac_No1" class="form-control" onchange="displayBalance();">
											<option name="ac_No" value="" selected>Please select a card account</option>
											<s:iterator value="#acList" status="st">
												<option name="ac_No" value="${ac_No}">${ac_No}</option>
											</s:iterator>
										</select>
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
										<span class="input-group-addon">￥</span>
						                <input type="text" class="form-control" name="amount" placeholder="Transferring Amount" required="required"
											oninvalid="setCustomValidity('Please input valid amount')" oninput="setCustomValidity('')">
						                <span class="input-group-addon">.00</span>
						            </div>
						            <p>
						            <div class="input-group">
										<span class="input-group-addon"><span class=" glyphicon glyphicon-edit"></span></span>
						                <input type="text" class="form-control" name="toAc_No" placeholder="Receiver's Account" required="required"
											oninvalid="setCustomValidity('Please input valid account')" oninput="setCustomValidity('')">
						            </div>
						            <p>
						            <div class="input-group">
										<span class="input-group-addon"><span class=" glyphicon glyphicon-edit"></span></span>
						                <input type="text" class="form-control" name="toName" placeholder="Receiver's Name" required="required"
											oninvalid="setCustomValidity('Please input receiver\'s name')" oninput="setCustomValidity('')">   
						            </div>
						            <p>
						            <div class="input-group">
										<span class="input-group-addon"><span class=" glyphicon glyphicon-lock"></span></span>
						                <input type="password" class="form-control" name="PIN" placeholder="PIN" required="required"
											oninvalid="setCustomValidity('Please input your card PIN')" oninput="setCustomValidity('')">   
						            </div>   
						        <p></p>
						        <div class="alert-custom" style="display:none">
									<a class="close" data-dismiss="alert">×</a>
									<span class="glyphicon glyphicon-exclamation-sign"></span> <strong>Error!</strong>
									<span id="info1"></span>
								</div>
							</div>
							<div class="box-footer">
								<input class="btn btn-primary" type="submit" value="Submit"  />	
							</div>
							</form>
							</div>
						</section>
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
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="toTransfer.action">Return</a>
			</div>
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
	function displayBalance() {
		var getBalanceAjax = 'ajax/getBalanceAjax.action';

		$.get(getBalanceAjax, {
			'ac_No' : $('option[name=ac_No]:checked').val()
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
	$(function(){
		$('form').on('submit', function(e) {
			//debugger;
			var ac_No = $('select[name=ac_No1]').val();
			if(!ac_No){
				dialog.show('Please select an account.');
				e.preventDefault();
				return false;
			}
		});

	});
	/*	var lock = true;
		
		$(function() {
			// 拦截提交表单事件
			$('form').on('submit', function(e) {
				if(!lock) {
					return true;
				}
				
				// 先判断账号是否正确
				isValidTargetAccount();
				e.preventDefault();
				return false;
			});
		});*/

		/**
		 * 判断账号是否正确
		 */
		/*function isValidTargetAccount() {
			debugger;
			var getAccountAction = 'ajax/getAccountAjax.action';
			var ac_No2 =  $('option[name=ac_No]:checked').val();
			
			$.get(getAccountAction, {
				'ac_No': $('input[name=toAc_No]').val(),
				'ac_No2': ac_No2,
				'name':  $('input[name=toName]').val(),
				'PIN':   $('input[name=PIN]').val()
			}, function(data) {
				if(!ac_No2){
					bootbox.alert('Please select an account.');
				}else if(!data.acStatus) {
					bootbox.alert('Wrong target account number or name.');
				}else if (!data.PINStatus) {
					bootbox.alert('Wrong PIN.');
				}else{
					isEnoughBalance();
					}
			});
		}
		function isEnoughBalance() {
			var form = document.querySelector('form');
			var getBalanceAjax = 'ajax/getBalanceAjax.action';
			var ac_No =  $('option[name=ac_No]:checked').val();
			var ac_No2 =  $('input[name=toAc_No]').val();
			$.get(getBalanceAjax, {
				'ac_No':ac_No 
			}, function(data){
				if(data.status){
					// 这里之前漏了 .val()
					var amount = $('input[name=amount]').val();
					if(data.balance < amount){
						bootbox.alert('Balance is not enough.');
						form.amount.value="";
						form.PIN.value="";
						form.amount.focus();
					}else{
						$('input[name="ac_No"]').val(ac_No);
						$('input[name="ac_No2"]').val(ac_No2);
						// 余额足够，准备提交表单
						submit();
					}
				} else {
					bootbox.alert('Bad ac_No');
				}
			});
		}
		
		function submit() {
			lock = false;
			$('form').submit();
		}*/
	

		var msg = '${msg}';
		if(msg) {
			dialog.show(msg);
		}
		var msg2 = '${msg2}';
		if(msg2) {
			var form = document.querySelector('form');
			form.PIN.value="";
			dialog2.show(msg2);
		}
</script>
</html>	
