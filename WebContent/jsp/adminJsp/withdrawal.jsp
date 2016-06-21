<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./headMeta.jsp"%></head>
<body class="skin-blue">
<%@include file="./header.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<%@include file="./sidebar.jsp"%>
	<aside class="right-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title" style="font-family:Microsoft YaHei">Winthdrawal</h3>
						</div>
						<form role="form" id="withdrawform" action="account/withdraw.action" method="post">
							<div class="box-body">
								<div class="form-group">
									<label for="inputUsername">Account Number</label> <input
										type="text" name="ac_No" class="form-control"  required="required">
								</div>
								<div class="form-group">
									<label for="inputUsername">Withdrawal Amount</label> <input
										type="text" name="amount" class="form-control"  required="required">
								</div>
								<div class="form-group" style="display: none">
									<label for="inputUsername">Auth Code</label> <input type="password"
										name="auth_code" class="form-control">
								</div>
						   	    <div class="alert-custom" style="display:none">
								    <a class="close" data-dismiss="alert">×</a>
								    <span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong><span id="showtip">${tips}</span>
								</div>
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Confirm</button>
								<a class="btn btn-default" href="index.action">Return</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</aside>
</div>
<div class="modal fade" id="authCode_dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Authorization Code</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="authform" >
					<div class="box-body">
						<div class="form-group">
							<label>Please input Authorization Code to continue</label>
							<input type="password" name="tmp_auth_code" class="form-control">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default dialog-close" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary dialog-confirm">Submit</button>
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
				<h4 class="modal-title"style="font-family:Microsoft YaHei">Tips</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="account/withdraw.action">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./javascript.jsp"%>
<script type="text/javascript" src="js/authCode.js"></script>
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

	var lock = true;
		
	$(function() {
		// 拦截提交表单事件
		$('#withdrawform').on('submit', function(e) {
			if(!lock) {
				return true;
			}
			// 先判断账号是否正确
			isValidAccount();
			e.preventDefault();
			return false;
		});
	});
	
	/**
	 * 判断账号是否正确
	 */
	function isValidAccount() {
		var getAcnoAction = 'ajax/getAcnoAjax.action';
		
		$.get(getAcnoAction, {
			ac_No: $('input[name=ac_No]').val()
		}, function(data) {
			if(data.status) {
				// 账号正确，判断余额是否足够
				isEnoughBalance();
			} else {
				var tips = "Wrong account.";
				// 账号错误的情况
				//dialog.show(data.tips);
				$('#showtip').text(tips);
				$('.alert-custom').show();
			}
		});
	}
	
	/**
	 * 判断余额是够足够
	 */
	function isEnoughBalance() {
		var getBalanceAjax = 'ajax/getBalanceAjax.action';
		
		$.get(getBalanceAjax, {
			ac_No: $('input[name=ac_No]').val()
		}, function(data){
			if(data.status){
				// 这里之前漏了 .val()
				var amount = $('input[name=amount]').val();
				if(data.balance < amount){
					bootbox.alert('Balance is not enough.');
				} else {
					// 余额足够，准备提交表单
					beforeSubmit();
				}
			} else {
				var tips="Wrong ac_No.";
				$('#showtip').text(tips);
				$('.alert-custom').show();
				//dialog.shpw('Wrong ac_No.');
			}
		});
	}
	
	/**
	 * 账号和余额都正确，准备提交表单，验证 amount 是否大于 50000
	 */
	function beforeSubmit() {
		var auth_code = $('input[name=auth_code]');
		var amount = $('input[name=amount]');
		// 校验 amount 是否大于 50000
		if(amount.val() > 50000 && !auth_code.val()) {
			$('#authCode_dialog').modal('show');
			$('#authCode_dialog input').val('').focus();
		} else {
			submit();
		}
	}
	
	/**
	 * 提交表单
	 */
	function submit() {
		lock = false;
		$('#withdrawform').submit();
	}
	
	// 点击 Auth Code 的提交按钮
	$('#authCode_dialog .dialog-confirm').on('click', function() {
		var auth_code_tmp = $('#authCode_dialog input[name=tmp_auth_code]').val();
		if(auth_code_tmp) {
			// 通过请求校验 Auth Code 是否正确
			validAuthCode(auth_code_tmp, 
				// Auth Code 是正确的
				function() {
					// 把这个填写到取款的 form 里面
					$('input[name=auth_code]').val(auth_code_tmp);
					
					// 提交表单
					submit();
					
				},
				// Auth Code 是错误的
				function() {
					// 隐藏填写 Auth Code 的弹窗，BootStrap 的写法
					$('#authCode_dialog').modal('hide');
					// 弹出提示弹窗，说 auth_code 不正确
					bootbox.alert('Authentication code is incorrect');
				}
			);
		}
	});
	
	// 从后台拿到 tips, 并通过弹窗显示
	var tips = '${tips}';
	if(tips) {
		dialog.show(tips);
	}
</script>
</html>