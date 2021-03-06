<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KKBank | Balance Status</title>
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
						<div class="box box-grey">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">Balance Status</h3>
							</div>
							<div class="box-body">
							<table cellpadding="7" class="table table-striped" >
				        		<tr>
				        			<th  width="20%">Account No.:</th>
				        			<td>${ac_No } </td>
				        		</tr>
				       			<tr>
				       				<th>Balance:</th>
				       				<td>${balance }</td>	   
				       			</tr>
								<tr>
									<th>USD:</th>
									<td>
								<%double USD = Double.parseDouble(ActionContext.getContext().get("USD").toString()); %>
								<%if(USD <= 0){ %>
										--
								<%} 
								else{%>
										${USDStr }
								<%} %>
									</td>
								</tr>
								<tr>
									<th>JPY:</th>
									<td>
								<%double JPY = Double.parseDouble(ActionContext.getContext().get("JPY").toString()); %>
								<%if(JPY <= 0){ %>
										--
								<%} 
								else{%>
										${JPYStr }
								<%} %>
									</td>
								</tr>
								<tr>
									<th>HKD:</th>
									<td>
								<%double HKD = Double.parseDouble(ActionContext.getContext().get("HKD").toString()); %>
							<%if(HKD <= 0){ %>
										--
								<%} 
								else{%>
										${HKDStr }
								<%} %>
									</td>
								</tr>
								<tr>
									<th>GBP:</th>
									<td>
								<%double GBP = Double.parseDouble(ActionContext.getContext().get("GBP").toString()); %>
								<%if(GBP <= 0){ %>
										--
								<%} 
								else{%>
										${GBPStr }
								<%} %>
									</td>
								</tr>
								<tr>
									<th>AUD:</th>
									<td>
								<%double AUD = Double.parseDouble(ActionContext.getContext().get("AUD").toString()); %>
								<%if(JPY <= 0){ %>
										--
								<%} 
								else{%>
										${AUDStr }
								<%} %>
									</td>
								</tr>
							</table>
						</div>
							<div class="box-footer">
								<a class="btn" style="color:white;background-color:grey" href="toTransctionDetail.action?ac_No=${ac_No }">The last 10 transaction records</a>
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