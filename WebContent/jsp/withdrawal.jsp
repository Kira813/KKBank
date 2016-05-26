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
	<aside class="right-side">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Winthdrawal</h3>
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
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Confirm</button>
								<a class="btn btn-primary" href="index.action">Return</a>
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
				<h4 class="modal-title">Auth Code</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="authform" >
					<div class="box-body">
						<div class="form-group">
							<label>Please input Auth Code to continue</label>
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
				<h4 class="modal-title">Warn</h4>
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
	// 文本提示弹窗
	// 可以是 dialog.show('我要跟你说什么');
	// 也可以 dialog.hide() 隐藏
	// 页面上必须存在 simpleDialog 才行
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
	
	$(function() {
		var getAcnoAction = 'ajax/getAcnoAjax.action?ac_No=${ac_No}';
		$('#withdrawform').on('submit', function(e) {
			$.get(getAcnoAction, function(data) {
				// data => { "tips":"Wrong ac_no"}
				if(data.tips) {
					dialog.show(data.tips);
				}
			});
			var auth_code = $('input[name=auth_code]');
			var amount = $('input[name=amount]');
			// 校验 amount 是否大于 50000
			if(amount.val() > 50000 && !auth_code.val()) {//没有判断wrong ac   ajax
				$('#authCode_dialog').modal('show');
				$('#authCode_dialog input').val('').focus();
				e.preventDefault();
				return false;
			}		
		});
	});
	// 提交表单   原来有一个不是ajax的 withdrawform submit方法

	
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
					//  ?? why不显示
					//$('#authCode_dialog').modal('hide');
					//dialog.show('Balance reduced successfully.');
					// 提交表单
					$('#withdrawform').submit();

					
				},
				// Auth Code 是错误的
				function() {
					// 隐藏填写 Auth Code 的弹窗，BootStrap 的写法
					$('#authCode_dialog').modal('hide');
					// 弹出提示弹窗，说 auth_code 不正确
					//dialog.show('auth_code is not right');
					bootbox.alert('auth_code is not right');
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