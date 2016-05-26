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
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./headMeta.jsp" %></head>
<title>KK Bank</title>
</head>
<body>
	<table>
		<tr>
			<td>Card Number:</td>
			<td>${ac_No}</td>
		</tr>
		<tr>
			<td>Customer Name:</td>
			<td>${name}</td>
		</tr>
		<tr>
			<td>Balance:</td>
			<td>${balance}</td>
		</tr>
		<tr>
			<td>Account Status:</td>
			<td>${sta_msg}</td>
		</tr>
	</table>
	<a class="btn btn-primary" id="close_account">Close Account</a>
	<a href="admin/inquiry.action">Return</a>

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
				<form role="form">
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
				<a class="btn btn-primary" href="toStatus.action">Return</a>
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

		
		$(function() {
			var getBalanceAction = 'ajax/getBalanceAjax.action?ac_No=${ac_No}';
			var delAccountAction = 'account/delAccount.action?ID=${ID}';
			// 点击删除按钮，开始查询余额
			$('#close_account').on('click', function() {
				$.get(getBalanceAction, function(data) {
					// data => {"balance":10.0, "status":true, "tips":"balance not zero"}
					if(data.status) {
						if(data.balance === 0) {
							// 显示 auth code 确认弹窗
							$('#authCode_dialog').modal('show');
							$('#authCode_dialog input').val('').focus();
						} else {
							//dialog.show(data.tips);
							bootbox.alert(data.tips);
						}
					} else {
						//dialog.show(data.tips);
						bootbox.alert(data.tips);
					}
				});
			});
			
			// 点击 Auth Code 的提交按钮
			$('#authCode_dialog .dialog-confirm').on('click', function() {
				var auth_code_tmp = $('#authCode_dialog input[name=tmp_auth_code]').val();
				if(auth_code_tmp) {
					// 通过请求校验 Auth Code 是否正确
					validAuthCode(auth_code_tmp, 
						// Auth Code 是正确的
						function() {
							$.get(delAccountAction, function() {
								$('#authCode_dialog').modal('hide');
								dialog.show('delete success');
								
							});
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
			
		});
		var sTips = '${sTips}';
		if(sTips) {
		//	dialog.show(sTips);
		}

	
</script>
</html>