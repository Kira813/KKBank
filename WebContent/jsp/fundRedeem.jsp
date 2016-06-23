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
						
								<p>You will redeem ${fName}</p>
								<table>
									<tr>
										<td width="40%">Fund Code:</td>
										<td height="30px">${fCode}</td>
									</tr>
									<tr height="30px">
										<td>Owner:</td>
										<td>${name}</td>
									</tr>
									<tr>
										<td>ID:</td>
										<td>${ID}</td>
									</tr>
									<tr height="30px">
										<td>Account:</td>
										<td>${ac_No}</td>
									</tr>
									<tr height="30px">
										<td>Deal Date:</td>
										<td>${dealDate}</td>
									</tr>
									<tr height="30px">
										<td>Capital:</td>
										<td><span format-balance>${amount}</span></td>
									</tr>
									<tr height="30px">
										<td>Share:</td>
										<td><span format-balance>${share}</span></td>
									</tr>
									<tr height="30px">
										<td>Income:</td>
										<td><span format-balance>${income}</span></td>
									</tr>
								</table>
								<br/>
								<form action="fund/fundRedeem" method="post">
									<input type="hidden" name="fund_id" value="${fund_id}" />
									<input type="hidden" name="ac_No" value="${ac_No}" />
									<input type="hidden" name="amount" value="${amount}" />
									<input type="hidden" name="income" value="${income}" />
									<label>Please input shares amount you want to redeem:</label><br/>
									<input class="form-control" type="text" name="share" required="required" placeholder="Shares amount"
										oninvalid="setCustomValidity('Please input valid shares')" oninput="setCustomValidity('')"/><br/>
									<label>Please input Card PIN:</label><br/>
									<input class="form-control" type="password" name="PIN" required="required" placeholder="Card PIN"
										oninvalid="setCustomValidity('Please input your card PIN')" oninput="setCustomValidity('')"/>
									<p></p>
									 <s:if test="msg!=null">
			     	    				<div class=" alert-custom ">
						  					<a class="close" data-dismiss="alert">×</a>
						 					<span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong>${msg}
						 				</div>
			     					</s:if>    					
								<p></p>
							<div class="box-footer">
								<input class="btn btn-danger"style="background-color: #dd4b39;border-color:#dd4b39" type="submit" value = "Submit" />
								<a class="btn btn-default" href="fund/listMyFund">Return</a>
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
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	$('input').on('change', function() { 
		$('.alert-custom').hide(); 
	});
</script>
</html>