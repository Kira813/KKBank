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
<title>KKBank</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%>
<style>
body {
	background:  #fff;;
}
</style>
</head>
<body>
<s:if test="#session.loginID==null">
	<%@include file="./userHeaderBefore.jsp"%>
</s:if>
<s:else>
	<%@include file="./userHeader.jsp"%>
</s:else>
<div class="custom-bg">
	<div>
		<h1>KK Bank</h1>
		<h3>${name ? "Hello, " + name : ""}</h3>
	</div>
</div>
<div class="container intro-container" >
	<div class="intro-wrap">
		<ul class="row">
			<li class="col-sm-4">
				<img src="/KKBank/images/uIndex1.jpg">
				<div>
					<p><a href="toAccountEnquiry" onclick="loading.show()" style="color:white">Banking</a></p>
				</div>
			</li>
			<li class="col-sm-4">
				<img src="/KKBank/images/uIndex2.jpg">
				<div>
					<p><a href="jsp/loadingTest.jsp"style="color:white"onclick="loading.show()">Borrowing</a></p>
				</div>
			</li>
			<li class="col-sm-4">
				<img src="/KKBank/images/uIndex3.jpg">
				<div>
					<p><a href="fund/listFund"style="color:white" onclick="loading.show()">Investing</a></p>
				</div>
			</li>
		</ul>
	</div>
</div>
<!-- downside intro -->
<div class="container desc-container">
	<div class="row">
		<div class="col-sm-9" >
			<div class="row">
				<div class="col-sm-12 custom-tag custom-tag1">
					<div class="row">
						<div class="col-sm-6" style="overflow:hidden">
							<img src="/KKBank/images/p5.jpg" width="290px" height="180px">
						</div>
						<div class="col-sm-6" >
						<div>
							<div style="color:grey;font-size:5px;padding-top:25px"><b>DETAILS OF FUNDS</b></div>
							<div style="color:grey;font-size:18px"><p><b>FUNDS</b></p></div>
							<p>You can purchase whatever you like, which will help you gain benefits. </p>
							<p><a href="fund/listFund" style="color:#dd4b39">More ></a></p>
						</div>
						</div>
						
					</div>
					
					
				</div>
			</div>
			<div class="row">
				<div class="col-sm-7 custom-tag custom-tag2">
					<div class="row" style="padding:15px">
						<center>
						<table>
						<tr><td>
							
						</td></tr>
						<tr><td>
						<div style="color:grey;font-size:5px;margin-top:5px"><b>LUMP-SUM DEPOSIT AND WITHDRAW</b></div>
						</td></tr>
						<tr><td>
						<div style="color:grey;font-size:18px"><b>TIME DEPOSIT</b></div>
						<p>You can deposit money here for a specified time and gain interest for benefit.</p>
						<p><a href="toTimeDeposit" style="color:#dd4b39">Deposit ></a></p>
						</td></tr>
						</table>
						</center>
						<p><p>
					</div>

				</div>
				<div class="col-sm-5 custom-tag custom-tag3" style="padding-left:20px">
					<div style="padding-top:13px;">
					
					</div>
					<div style="color:grey;font-size:5px;margin-top:5px"><b>FOREIGN EXCHANGE</b></div>
					<div style="color:grey;font-size:18px"><b>CURRENCY</b></div>
					<p>You can exchange currency here.
					<p><a href="toForeignExchange" style="color:#dd4b39">Exchange ></a></p>
				</div>
			</div>
		</div>
		<div class="col-sm-3 custom-tag custom-tag4" >
			<div class="row" style="padding-left:20px">
			<div class="sidebar-custom b1">
				<a href="toAccountEnquiry" style="color:black">Account Enquiry</a>
            </div>
            <div class="sidebar-custom b2">
				<a href="fund/listFund"style="color:black">Funds</a>
            </div>
            <div class="sidebar-custom b3">
				<a href="toTimeDeposit"style="color:black">Time Deposit</a>
            </div>
            <div class="sidebar-custom b4">
				<a href="toTransfer"style="color:black">Transfer</a>
            </div>
            <div class="sidebar-custom b5">
				<a href="toForeignExchange"style="color:black">Foreign Exchange</a>
            </div>
            <div class="sidebar-custom b6">
				<a href="user/toPayment"style="color:black">Payment</a>
            </div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="simpleDialog" style="font-family:Microsoft YaHei">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Warning</h4>
			</div>
			<div class="modal-body">
			Do you really want to log out?
			</div>
			<div class="modal-footer">
				<a class="btn btn-default" href="userIndex.action">Return</a>
				<a class="btn btn-primary" href="user/logout.action">Confirm</a>
			</div>
		</div>
	</div>
 </div>
 <%@include file="./userFooter.jsp"%>
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
	$('#logout').on('click', function() {
		$('#simpleDialog').modal('show');
	});
</script>
</html>