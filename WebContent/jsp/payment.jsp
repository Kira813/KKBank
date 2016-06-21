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
								<h3 class="box-title" style="font-family:Microsoft YaHei">Payment</h3>
							</div>
							<div class="box-body">
							<div class="small-box bg-teal" style="width:400px">
					            <div class="inner">
					              <h3 style="font-family:Microsoft YaHei">Pay for myself<sup style="font-size: 20px"></sup></h3>
					              <p></p>
					            </div>
					            <div class="icon">
					              <i class="ion ion-stats-bars"></i>
					            </div>
					            <a href="user/toPersonalBill" class="small-box-footer">My personal bill <i class="fa fa-arrow-circle-right"></i></a>
					         </div>
					         <div class="small-box bg-maroon" style="width:400px">
					            <div class="inner">
					              <h3 style="font-family:Microsoft YaHei">Pay for others<sup style="font-size: 20px"></sup></h3>
					              <p></p>
					            </div>
					            <div class="icon">
					              <i class="ion ion-stats-bars"></i>
					            </div>
					            <a href="user/toOtherBill" class="small-box-footer">Pay for others <i class="fa fa-arrow-circle-right"></i></a>
					         </div>
							</div>
						</div> 
				    </section>
				</aside>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>