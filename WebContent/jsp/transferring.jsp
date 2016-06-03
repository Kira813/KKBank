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
<%@include file="./adminJsp/headMeta.jsp"%></head>
<title>KK Bank</title>
</head>
<body>
	<form role="form" action="user/transfer" method="post">
		Please select your card account number:
		<select name="ac_No" id="ac_No_select">
			<c:forEach items="${acList}" var="list">
				<option value="${list.ac_No}">${list.ac_No}</option>
			</c:forEach>			
		</select><br/>
		Transfer Amount: <input type="text" name="amount" required="required"/><br/>
		Receiver's Account No.: <input type="text" name="toAc_No" required="required"/><br/>
		Receiver's name: <input type="text" name="toName" required="required"/><br/>
		Card PIN: <input type="password" name="PIN" required="required"/><br/>
		<input type="submit" value="Submit"  />		
	</form>
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
				<a class="btn btn-primary" href="toTransfer.action">Return</a>
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
	
		var lock = true;
		
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
		});
		/**
		 * 判断账号是否正确
		 */
		function isValidTargetAccount() {
			var getAccountAction = 'ajax/getAccountAjax.action';
			var ac_No2 = $('select[name=ac_No]').val();
			
			$.get(getAccountAction, {
				'ac_No': $('input[name=toAc_No]').val(),
				'ac_No2': ac_No2,
				'name':  $('input[name=toName]').val(),
				'PIN':   $('input[name=PIN]').val()
			}, function(data) {
				if(!data.status){
					bootbox.alert('Wrong account.');
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
			var getBalanceAjax = 'ajax/getBalanceAjax.action';
			var ac_No =  $('select[name=ac_No]').val();

			$.get(getBalanceAjax, {
				'ac_No':ac_No 
			}, function(data){
				if(data.status){
					// 这里之前漏了 .val()
					var amount = $('input[name=amount]').val();
					if(data.balance < amount){
						bootbox.alert('Balance is not enough.');
					} else {
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
		}
	
			
		var tips = '${tips}';
		if(tips) {
			//dialog.show(tips);
		}
</script>
</html>