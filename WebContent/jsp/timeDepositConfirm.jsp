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
	<title>KKBank | Time Deposit Confirmation</title>
	<base href="<%=basePath%>
	">
	<%@ taglib uri="/struts-tags" prefix="s"%>
	<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
	<%@include file="./userHeader.jsp"%>
	<div class="wrapper row-offcanvas row-offcanvas-left" style="font-family:Microsoft YaHei">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<ul class="nav nav-pills nav-stacked left-nav-custom">
					    <li role="presentation">
					        <a href="toAccountEnquiry">Account Enquiry</a>
					    </li>
					    <li role="presentation">
					        <a href="javascript:void(0)">Fund</a>
					    </li>
					    <li role="presentation" class="active">
					        <a href="toTimeDeposit">Time Deposit</a>
					    </li>
					    <li role="presentation">
					        <a href="toTransfer">Transfer</a>
					    </li>
					    <li role="presentation">
					        <a href="toForeignExchange">Foreign Exchange</a>
					    </li>
					</ul>
				</div>
				<div class="col-md-9">
					<aside class="right-content-custom" style="font-family:Microsoft YaHei">
						<section>
							<div class="box box-warning">
								<div class="box-header">
									<h3 class="box-title" style="font-family:Microsoft YaHei">Time Deposit</h3>
								</div>
								<div class="box-body no-padding" >
									<table class="table table-striped" >
										<tbody>
											<tr>
												<td style="width: 20%; padding-left:20px">Card Number</td>
												<td>${ac_No}</td>
											</tr>
											<tr>
												<td style="padding-left:20px">Deposit Term</td>
												<td>${period}</td>
											</tr>
											<tr>
												<td style="padding-left:20px">Deposit Amount</td>
												<td>
													<span format-balance>${amount}</span>
												</td>
											</tr>
											<tr>
												<td style="padding-left:20px">Deposit Type</td>
												<td>Lump Fixed Deposit</td>
											</tr>
											<tr>
												<td style="padding-left:20px">Interest Rate</td>
												<td>${intRate}%</td>
											</tr>
											<tr>
												<td style="padding-left:20px">Maturity Date</td>
												<td>${date}</td>
											</tr>
											<tr>
												<td style="padding-left:20px">Estimate Rate of Return</td>
												<td>${rateReturn}%</td>
											</tr>
										</tbody>
									</table>
								</div>
								<form role="form" action="account/timeDepositConfirm" method="post">
									<div class="input-group" style="margin-top:10px">
										<span class="input-group-addon">
											<span class="fa fa-key"></span>
										</span>
										<input type="password" name="pin" id="pin" class="form-control"
										placeholder="Please input card PIN" required="required">
									</div>
									<p></p>
									<input name = "amount" style="display:none">
									<input name = "term" style="display:none">
									<input name = "intRate" style="display:none">
									<input name = "ac_No" style="display:none">
									<input name = "confirm" value="true" style="display:none">
									<div class="box-footer">
										<a class="btn btn-warning" id="confirm_btn" href="javascript:void(0)">Confirm</a>
										<a class="btn btn-default" href="toTimeDeposit">Return</a>
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
				<div class="modal-body"></div>
				<div class="modal-footer">
					<a class="btn btn-primary" class="close" data-dismiss="modal"
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
		var form = document.querySelector('form');
		$('#confirm_btn').click(function() {
			var pin = $('input[name=pin]').val();
			var PIN = '${PIN}'; //String
			var amount = '${amount}';
			var term = '${term}';
			var intRate = '${intRate}';
			var ac_No = '${ac_No}';
			if(pin==PIN){
				$('input[name=amount]').val(amount);
				$('input[name=term]').val(term);
				$('input[name=intRate]').val(intRate);
				$('input[name=ac_No]').val(ac_No);
				$('form').submit();
			}else{
				$('input[name=pin]').val("");
				dialog.show('Wrong PIN.');
				//form.pin.focus();
			}
		});
	});
	var tips = '${tips}';
	if(tips) {
		dialog.show(tips);
	}
</script>
	</html>