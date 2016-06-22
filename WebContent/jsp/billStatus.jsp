<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>KKBank | Payment</title>
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
				<ul class="nav nav-pills nav-stacked left-nav-custom nav-custom6">
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
				    <li role="presentation">
				        <a href="toForeignExchange">Foreign Exchange</a>
				    </li>
				    <li role="presentation" class="active">
				        <a href="user/toPayment">Payment</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-teal">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">Bill Status</h3>
							</div>
							<div class="box-body">
								<table width="80%" class="table table-striped4" style="text-align:center">
									<tr>
										<th style="text-align:center">Bill number</th>
										<th style="text-align:center">Bill item</th>
										<th style="text-align:center">Period</th>
										<th style="text-align:center">Amount</th>
										<th style="text-align:center">Pay</th>
									</tr>
									<c:forEach items="${paylist}" var="billList">
										<tr align="center">
											<td>${billList.bNo}</td>
											<td>${billList.bItem}</td>
											<td>${billList.start_date} - ${billList.end_date}</td>
											<td><span format-balance>${billList.amount}</span></td>
											<td><a class="btn btn-primary btn-xs" href="user/toPay?bNo=${billList.bNo}" style="border-color:#39CCCC;background-color:#39CCCC;color:white">Pay</a></td>
										</tr>
									</c:forEach>
								</table>				
							</div>
						</div> 
				    </section>
				</aside>
			</div>
		</div>
	</div>
</div>
	<div class="modal fade" id="simpleDialog2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Tips</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="user/showPersonalBill">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
var dialog2 = {
		el: $('#simpleDialog2'),
		show: function(msg) {
			this.el.find('.modal-body').text(msg);
			this.el.modal('show');
		},
		hide: function() {
			this.el.modal('hide');
		}
	};
var msg4 = '${msg4}';
if(msg4) {
	dialog2.show(msg4);
}

</script>
</html>