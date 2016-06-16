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
<%@include file="./userHeader.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<aside class="center-side" style="font-family:Microsoft YaHei">
		<section class="content">
				<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Transfer</h3>
						</div>
						<form role="form" action="user/transfer" method="post">
							<div class="box-body">
								    <div class="form-group">
					                  <label>Please select a card account:</label>
					                  <select name="ac_No" id="ac_No_select" class="form-control">
										<c:forEach items="${acList}" var="list">
										<option value="${list.ac_No}">${list.ac_No}</option>
										</c:forEach>			
									  </select>
									  <p>  
					                </div>
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
											oninvalid="setCustomValidity('Please input receiver's name')" oninput="setCustomValidity('')">   
						            </div>
						            <p>
						            <div class="input-group">
										<span class="input-group-addon"><span class=" glyphicon glyphicon-lock"></span></span>
						                <input type="password" class="form-control" name="PIN" placeholder="PIN" required="required"
											oninvalid="setCustomValidity('Please input your card PIN')" oninput="setCustomValidity('')">   
						            </div>   
						        <p>
						        <s:if test="msg!=null">						     	 
								   <div class=" alert-custom ">																								
									  <a class="close" data-dismiss="alert">×</a>																								
									  <span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong>${msg}																								
									</div>
			     			   </s:if>  
							</div>
							<div class="box-footer">
								<input class="btn btn-default" type="submit" value="Submit"  />	
							</div>
						</form>
						</div>
					</div>
				</div>
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
				<a class="btn btn-primary" href="toTransfer.action">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">

	/*var dialog = {
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
		});*/
		/**
		 * 判断账号是否正确
		 */
		/*function isValidTargetAccount() {
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
		}*/
</script>
</html>	
