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
<title>KKBank | Account Selection</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
<%@include file="./userHeader.jsp"%>
</div>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked left-nav-custom">
				    <li role="presentation" class="active">
				        <a href="toAccountEnquiry">Account Enquiry</a>
				    </li>
				    <li role="presentation">
				        <a href="javascript:void(0)">Fund</a>
				    </li>
				    <li role="presentation">
				        <a href="toTimeDeposit">Time Deposit</a>
				    </li>
				    <li role="presentation">
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
								<h3 class="box-title" style="font-family:Microsoft YaHei">Account Selection</h3>
							</div>
							<div class="box-body" style="margin-left:10px">
							    <div class="form-group">
						        <div class="radio" style="font-family:Microsoft YaHei">
						       		<s:iterator value="#acList" status="st">
										<p><input type="radio" name="ac_no" value="${ac_No}"> ${ac_No}</p>
									</s:iterator>
								</div>
							    </div>
							</div>
							<div class="box-footer">
								<a class="btn  btn-primary" href="javascript:void(0)" id="next_btn">Next</a>
							</div>
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
			<div class="modal-body"></div>
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
	$(function() {
		var action = 'toBalanceStatus.action';
		
		$('#next_btn').click(function() {
			var ac_no = $('input[name=ac_no]:checked').val();
			
			if(!ac_no) {
				dialog.show('Please select an account.');
			}else{
				window.location.href = action + '?ac_No=' + ac_no;
			}
		});
		
	});
</script>
</html>
