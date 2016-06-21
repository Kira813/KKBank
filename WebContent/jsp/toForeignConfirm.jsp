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
<title>KKBank | Confirmation</title>
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
				    <li role="presentation">
				        <a href="toAccountEnquiry">Account Enquiry</a>
				    </li>
				    <li role="presentation">
				        <a href="fund/listFund">Fund</a>
				    </li>
				    <li role="presentation">
				        <a href="toTimeDeposit">Time Deposit</a>
				    </li>
				    <li role="presentation">
				        <a href="toTransfer">Transfer</a>
				    </li>
				    <li role="presentation" class="active" style="border-left-color:green">
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
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">Confirmation</h3>
							</div>	
							<div class="box-body">	
							<table class="table table-striped" >
					                <tbody>
					                <tr>
					                  <td style="width: 30%; padding-left:20px">Card Number</td>
					                  <td>${ac_No}</td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">RMB Balance</td>
					                  <td><span format-balance>${balance}</span></td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">Exchange Currency</td>
					                  <td>${currency}</td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">Exchange Offer Rate</td>
					                  <td>${rate}</td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">Required RMB amount</td>
					                  <td><span format-balance>${r}</span></td>
					                </tr>    
					             	 </tbody>
					              </table>	
					        </div>			
								<form role="form" action="confirm1" method="post">
									<input name="ac_No" style="display:none">
									<input name="amt" style="display:none">
									<input name="rmb" style="display:none">
									<input name="currency" style="display:none">
								<div class="input-group" style="margin-top:10px">
									<span class="input-group-addon"><span class="fa fa-key"></span></span> 
									<input type="password" name="pin" id="pin" class="form-control"
										placeholder="Please input card PIN" required="required">
								</div>					
								<p>
								<div class="box-footer">
									<a class="btn btn-success" id="confirm_btn" href="javascript:void(0)">Confirm</a>	
									<a class="btn btn-default" href="toForeignExchange">Return</a>	
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
				aria-label="Close" href="javascript:void(0)">Return</a>
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
		var amount = '${amt}';
		var ac_No = '${ac_No}';
		var currency = '${currency}';
		var rmb = '${r}';
		if(pin==PIN){
			$('input[name=amt]').val(amount);
			$('input[name=ac_No]').val(ac_No);
			$('input[name=currency]').val(currency);
			$('input[name=rmb]').val(rmb);
			$('form').submit();
		}else if(!pin){
			dialog.show('Please input the card PIN.');
		}else{
			$('input[name=pin]').val("");
			dialog.show('Wrong PIN.');
		}
	});
});
</script>
</html>

