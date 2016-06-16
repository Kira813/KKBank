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
<title>KKBank | Exchange</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<%@include file="./userHeader.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<aside class="center-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="box box-success">
				<div class="box-header" >
					<h3 class="box-title" style="font-family:Microsoft YaHei">Exchange Settlement</h3>
				</div>
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
						<form role="form" action="toForeign" method="post">
						<input name="ac_No" style="display:none">
						<h4 style="font-family:Microsoft YaHei">Balance details:</h4>
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-yen " style="color:"></i> RMB
							</span>
							<div class="form-control">
								<span id="showbalance">${balance}</span>
							</div>
							<span class="input-group-btn">
								<a class="btn btn-success btn-flat" id="exchange_btn" href="javascript:void(0)">Exchange to foreign currency</a>
							</span>
						</div>
						</form>
						<p>
						<div class="input-group" style="display:">
							<span class="input-group-addon">
								<i class="fa fa-dollar"></i> USD
							</span>
							<div class="form-control">
								<span id=""></span>
							</div>
						</div>
				</div>
		    </div>
	    </section>
	</aside>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
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
	$(function(){
		var form = document.querySelector('form');
		$('#exchange_btn').click(function() {
			var ac_no = $('option[name=ac_no]:checked').val();
			if (!ac_no) {
				alert('Please select an account.');
			} else {
					$('input[name="ac_No"]').val(ac_no);
					$('form').submit();
				}
			});
	});
</script>
</html>