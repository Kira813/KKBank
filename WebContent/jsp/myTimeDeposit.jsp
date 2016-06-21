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
								<h3 class="box-title" style="font-family:Microsoft YaHei">My Time-Deposit</h3>	<h5 style="font-family:Microsoft YaHei;margin-right:20px;margin-top:15px;text-align:right">Account: ${ac_No}</h5>
							</div>
							<div class="box-body">
							
                            <table class="table table-striped" style="text-align:center">
                           		<thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Deposit term</th>
                                    <th>deposit amount</th>
                                    <th>deposit type</th>
                                    <th>interest rate</th>
                                    <th>maturity date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="tlist" status="st">
	                                    <tr>
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
											<td>${mDate}</td>
											<td><s:date name="maturityDate" format="yyyy-MM-dd hh：mm：ss"/></td>
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