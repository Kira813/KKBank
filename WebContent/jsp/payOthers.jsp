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
								<h3 class="box-title" style="font-family:Microsoft YaHei">Pay for others</h3>
							</div>
							<div class="box-body" style="margin-left:15px">
								<form action="user/toPayOthers" method="get">
								<table>
								 <tr height="50px">
								 	<td width="35%">
								   		<label>Bill Number</label>
								    </td>
								 	<td>
								    <input type="text" name="bNo" class="form-control" required="required"
													oninvalid="setCustomValidity('Please input valid bill No.')" oninput="setCustomValidity('')"/>
								    </td>
								 </tr>
								 
								 <tr height="50px">
								 	<td><label>Bill owner</label></td>
								 	<td><input type="text" name="name" required="required" class="form-control"
													oninvalid="setCustomValidity('Please input valid name')" oninput="setCustomValidity('')"/></td>
								 </tr>
								 
								 </table>
								  
													
							<p></p>
							<s:if test="msg!=null">
			     	    		<div class=" alert-custom ">
						  		<a class="close" data-dismiss="alert">×</a>
						  		<span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong>${msg}
						 		</div>
			     			</s:if> 
			     			<br/>
			     			<div class="box-footer">
								<input class="btn btn-primary" style="border-color:#39CCCC;background-color:#39CCCC;color:white" type="submit" value="Next"/>
							</div>
								</form>
							</div>			      
						</div> 
				    </section>
				</aside>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="simpleDialog3">
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
				<a class="btn btn-primary" href="user/toOtherBill">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
var dialog3 = {
		el: $('#simpleDialog3'),
		show: function(msg) {
			this.el.find('.modal-body').text(msg);
			this.el.modal('show');
		},
		hide: function() {
			this.el.modal('hide');
		}
	};
var msg3 = '${msg3}';
if(msg3) {
	dialog3.show(msg3);
}

</script>
</html>
