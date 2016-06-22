<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kkbank.domain.MyFund"%>
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
								<h3 class="box-title" style="font-family:Microsoft YaHei">My Fund</h3>
							</div>
							<div class="box-body">
								<% List<MyFund> myfundList = (List<MyFund>)request.getAttribute("myfundli"); %>
								<table class="table table-striped3" style="text-align:center"width="80%">
								<thead>
									<tr>
										<!-- <th>Odd No.</th> -->
										<th style="text-align:center">Fund name</th>
										<th style="text-align:center">Fund code</th>
										<th style="text-align:center">Fund type</th>
										<th style="text-align:center">Rate of return</th>
										<th style="text-align:center">Accumulated income</th>
										<th style="text-align:center">Shares</th>
										<th style="text-align:center">Redeem</th>
									</tr>
								</thead>

									
									
								<% for (MyFund temp : myfundList) { %>
										<tr align="center">
											<%if(temp == null){ %>
												<td colspan = "6" align="center">You have not purchased any fund.</td>	 
											<%}
											else{ %>
												<td><%= temp.getFund().getfName() %></td>
												<td><%= temp.getFund().getfCode() %></td>
												<td><%= temp.getFund().getfType() %></td>
												<td><%= temp.getFund().getfAnnualized_rate() %>%</td>
												<% double share = temp.getShare(); %>
												<%if(temp.getStatus() == 0){ %>
													<td> -- </td>
													<td> -- </td>
													<td>Unconfirmed</td>
												<%} else{ %>
													<td><%= share %></td>
													<td><% double income = (temp.getFund().getNav() - temp.getNav()) * share; %>
														<%if(temp.getNav() == 0){ %>
																0.0
														<%}
														else{%>
															<%= income %>
														<%} %>
													</td>						
													<td><a class="btn btn-xs btn-danger" href="fund/toFundRedeemConfirm?fund_id=<%= temp.getFund_id() %>">Redeem</a></td>
												<%} %>
											<%} %>  
										</tr>
										<% } %>	

								</table>
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