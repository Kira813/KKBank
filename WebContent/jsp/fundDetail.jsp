<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>KKBank | Fund</title>
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
				<ul class="nav nav-pills nav-stacked left-nav-custom nav-custom2">
				    <li role="presentation">
				        <a href="toAccountEnquiry">Account Enquiry</a>
				    </li>
				    <li role="presentation" class="active">
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
				    <li role="presentation">
				        <a href="user/toPayment">Payment</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-danger">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">Fund</h3>
							</div>
							<div class="box-body" style="padding-left:20px">
								<c:forEach items="${fundli}" var="list">
									<p>Fund Name: ${list.fName}</p>
									<p>Fund Background: </p>
									<P>${list.fBackground}</p>
									<p>Fund Manager: ${list.fManage}</p>
									<p>Investment portfolio:</p>
									<p>${list.fInvest_portfolio}</p>
									<p>Purchase rate: <span format-toPercent>${list.fPur_rate}</span></p>
								</c:forEach>
							</div>
							<div class="box-footer">
								<a class="btn btn-default" href="fund/listFund">Return</a>
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