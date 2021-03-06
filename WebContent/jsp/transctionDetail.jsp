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
<title>KKBank | Transaction Details</title>
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
								<h3 class="box-title" style="font-family:Microsoft YaHei">Transaction Details</h3>
							</div>
							<div class="box-body">
                            <table class="table table-striped" style="text-align:center">
                                <tr >
                                    <th style="text-align:center">ID</th>
                                    <th style="text-align:center">Transaction Date</th>
                                    <th style="text-align:center">Transaction Type</th>
                                    <th style="text-align:center">Transaction Amount</th>
                                </tr>
                                <s:iterator value="#list" status="st">
                                	<s:if test="#st.index<10">
	                                    <tr>
	                                    	<td>${st.index + 1 }</td>
											<td><s:date name="date" format="yyyy-MM-dd hh：mm：ss"/></td>
											<td>${type }</td>
											<td>
											<s:if test="type=='Deposit'||type=='Transfer in'||type=='Fund Sell'">
												<span style="color:red" format-balance>${amount}</span>
											</s:if>
											<s:else>
												<span style="color:green" format-balance>-${amount}</span>
											</s:else>
											</td>
	                                  	</tr>
                                  	</s:if>
                                </s:iterator>
                            </table>
                        </div>
                        <div class="box-footer">
                        	<a class="btn" style="color:white;background-color:grey"  href="toTransctionHistory.action?ac_No=${ac_No }">History Transaction Records</a>
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
