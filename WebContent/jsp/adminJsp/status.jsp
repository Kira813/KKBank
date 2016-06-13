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
<body class="skin-blue" >
<%@include file="./header.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left" style="font-family:Microsoft YaHei">
	<%@include file="./sidebar.jsp"%>
	<aside class="right-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">User: ${name}</h3>
						</div>
							<div class="box-body">
								<table class="table table-striped">		
						            <tr>
						              <th>Card Number</th>
						              <th>Balance </th>
						              <th>Account Status</th>
						              <th colspan="2">Operation</th>
						            </tr>
						            <s:iterator value="#listaccount" status="st">
						            	<tr>
							            	<td>${ac_No}</td>
							            	<td><span format-balance>${balance }</span></td>
							            	<td>
												<s:if test="status == 1">Normal</s:if>  
												<s:elseif test="status == 2">Locked</s:elseif>  
												<s:elseif test="status == 3">Not activated  </s:elseif>  
												<s:else>Not Available</s:else>
											</td>
											<td><a class="btn btn-primary unlock_account" data-acno="${ac_No }" data-id="${ID }">Unlock Account</a></td>
							            	<td><a class="btn btn-primary close_account" data-acno="${ac_No }" data-id="${ID }">Close Account</a></td>
						            	</tr>
					          			</s:iterator>
					          </table>
							</div>
							<div class="box-footer">
								<a class="btn btn-default " href="admin/inquiry.action">Return</a>
								<a class="btn btn-default " onclick="location.reload();">Refresh</a>
							</div>
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
				<form role="form">
					<div class="box-body">
						<div class="form-group">
							<label>Please input authentication code to continue</label>
							<input type="password" name="tmp_auth_code" class="form-control">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer" style="font-family:Microsoft YaHei">
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
				<h4 class="modal-title">Tips</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer" style="font-family:Microsoft YaHei">
				<a class="btn btn-primary" onclick="location.reload();">OK</a>
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
			var getBalanceAction = 'ajax/getBalanceAjax.action';
			var delAccountAction = 'account/delAccount.action';
			var storage = {};
			
			
			// 点击删除按钮，开始查询余额
			$('.close_account').on('click', function() {
				var ac_No = $(this).attr('data-acno');
				
				storage.ac_No = ac_No;
				storage.ID = $(this).attr('data-id');
				
				$.get(getBalanceAction, {
					'ac_No': ac_No
				}, function(data) {
					if(data.status) {
						if(data.balance == 0) {
							// 显示 auth code 确认弹窗
							$('#authCode_dialog').modal('show');
							$('#authCode_dialog input').val('').focus();
						} else {
							var reg = /(\d)(?=(\d\d\d)+(?!\d))/g; 
				    		var tips = data.tips.replace(/(\d+\.\d*)/, function($1) {
				    			return (+$1).toFixed(2);
				    		}).replace(reg, '$1,');
							dialog.show(tips);
						}
					} else {
						bootbox.alert('Wrong ac_No');
					}
				});
			});
			
			// 点击 Auth Code 的提交按钮
			$('#authCode_dialog .dialog-confirm').on('click', function() {
				var auth_code_tmp = $('#authCode_dialog input[name=tmp_auth_code]').val();
				var ID = storage.ID;
				var ac_No = storage.ac_No;
				
				if(auth_code_tmp) {
					// 通过请求校验 Auth Code 是否正确
					validAuthCode(auth_code_tmp, 
						// Auth Code 是正确的
						function() {
							$.get(delAccountAction, {
								ID: ID,
								'ac_No': ac_No
							}, function() {
								$('#authCode_dialog').modal('hide');
								dialog.show('Delete successfully');	
								//location.reload();
							});
							
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
			
		});
		
		$(function() {
			var unlockAction = 'ajax/unlockAjax.action';
			var unlock = 'admin/unlock.action';
			var storage = {};
			
			// Unlock Account.
			$('.unlock_account').on('click', function() {
				var ac_No = $(this).attr('data-acno');
				
				storage.ac_No = ac_No;
				storage.ID = $(this).attr('data-id');
				
				$.get(unlockAction, {
					'ac_No': ac_No
				}, function(data) {
					if(data.result) {
						// 显示 auth code 确认弹窗
						$('#authCode_dialog').modal('show');
						$('#authCode_dialog input').val('').focus();
					} else {
						bootbox.alert('This account is not locked.');					
					}
					
				});
			});
			
			
			// 点击 Auth Code 的提交按钮
			$('#authCode_dialog .dialog-confirm').on('click', function() {
				var auth_code_tmp = $('#authCode_dialog input[name=tmp_auth_code]').val();
				var ID = storage.ID;
				var ac_No = storage.ac_No;
				
				if(auth_code_tmp) {
					// 通过请求校验 Auth Code 是否正确
					validAuthCode(auth_code_tmp, 
						// Auth Code 是正确的
						function() {
							$.get(unlock, {
								ID: ID,
								'ac_No': ac_No
							}, function() {
								$('#authCode_dialog').modal('hide');
								dialog.show('Successfully unlock');	
								//location.reload();
							});
							
						}/*,
											
						// Auth Code 是错误的
						function() {
							// 隐藏填写 Auth Code 的弹窗，BootStrap 的写法
							$('#authCode_dialog').modal('hide');
							// 弹出提示弹窗，说 auth_code 不正确
							bootbox.alert('Authentication code is wrong');						
						}*/
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