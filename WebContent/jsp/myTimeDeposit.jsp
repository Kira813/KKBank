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
	<title>KKBank | Time Deposit</title>
	<base href="<%=basePath%>
	">
	<%@ taglib uri="/struts-tags" prefix="s"%>
	<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
	<%@include file="./userHeader.jsp"%>
</div>
<div class="wrapper row-offcanvas row-offcanvas-left" style="font-family:Microsoft YaHei">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked left-nav-custom nav-custom3">
				    <li role="presentation">
				        <a href="toAccountEnquiry">Account Enquiry</a>
				    </li>
				    <li role="presentation">
				        <a href="fund/listFund">Fund</a>
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
				    <li role="presentation">
				        <a href="user/toPayment">Payment</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-warning">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">My Time-Deposit</h3>	<h5 style="font-family:Microsoft YaHei;margin-right:20px;margin-top:15px;text-align:right">Account: ${ac_No}</h5>
							</div>
							<div class="box-body">
							
                            <table class="table table-striped2" style="text-align:center">
                           		<thead>
                                <tr>
                                    <th style="text-align:center">ID</th>
                                    <th style="text-align:center">Deposit Term</th>
                                    <th style="text-align:center">Deposit Amount</th>
                                    <th style="text-align:center">Deposit Type</th>
                                    <th style="text-align:center">Interest Rate</th>
                                    <th style="text-align:center">Maturity Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="tlist" status="st">
                                	<s:if test="index==0">
	                                    <tr class="warning">
	                            	</s:if>
	                             	<s:else>
	                             		<tr>
	                             	</s:else>
	                                    	<td>${st.index + 1 }</td>
	                                    	<td>
	                                    	<s:if test="term==3">3 months</s:if>
	                                    	<s:if test="term==6">6 months</s:if>
	                                    	<s:if test="term==12">1 year</s:if>
	                                    	<s:if test="term==24">2 years</s:if>
	                                    	<s:if test="term==36">3 years</s:if>
	                                    	<s:if test="term==60">5 years</s:if>	
	                                    	</td>
	                                    	<td><span format-balance>${amount}</span></td>
	                                    	<td>${type }</td>
	                                    	<td>${interestRate }</td>
											<td><s:date name="maturityDate" format="yyyy-MM-dd"/></td>
	                                  	</tr>
                                </s:iterator>
                                </tbody>
                            </table>
                            </div>
							<div class="box-footer">
								<a class="btn btn-warning" href="toTimeDeposit">Return</a>
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
<script type="text/javascript">

</script></html>