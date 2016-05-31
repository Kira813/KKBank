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
<body >
<div style="font-family:Microsoft YaHei">
	
       	<p>Hello, ${name}.</p> <!-- 从ActionContext中取出 -->
		<table>
		<s:iterator value="#listaccount" status="st">
	            <tr>
	              <td>Card Number: ${ac_No}</td>
	              <td>Balance: ${balance}</td>
	              <td>Account Status: 
	              	<s:if test="status == 1">Normal</s:if>  
					<s:elseif test="status == 2">Locked</s:elseif>  
					<s:elseif test="status == 3">Not activated  </s:elseif>  
					<s:else>Not Available</s:else>  
				  </td>
	              <td><a class="btn btn-primary close_account" data-acno="${ac_No }" data-id="${ID }">Close Account</a></td>
	            </tr>
          </s:iterator>
          </table>
<a class="btn btn-default " href="admin/inquiry.action">Return</a>
<a class="btn btn-default " onclick="location.reload();">Refresh</a>

    
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
							<label>Please input Auth Code to continue</label>
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
							bootbox.alert(data.tips);
						}
					} else {
						bootbox.alert('Bad ac_No');
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
								dialog.show('Delete success');	
								//location.reload();
							});
							
						},
						// Auth Code 是错误的
						function() {
							// 隐藏填写 Auth Code 的弹窗，BootStrap 的写法
							$('#authCode_dialog').modal('hide');
							// 弹出提示弹窗，说 auth_code 不正确
							bootbox.alert('Auth_code is not right');
							
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