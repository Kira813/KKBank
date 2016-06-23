<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.opensymphony.xwork2.ActionContext" %>
<%@ page import= "com.opensymphony.xwork2.ActionSupport" %>
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
	<script>		
	/*var json={"error_code":0,
			  "reason":"success",
			  "total":606,
			  "result":[{"jjlx":"偏股型基金","nav_a":"0.003","nav_date":"2016-06-03","nav_rate":"0.2737","per_nav":"1.0990","sg_states":"开放","sname":"新华中证环保产业指数分级","symbol":"164304","total_nav":"1.1570","yesterday_nav":"1.096"},
			  			 {"jjlx":"偏股型基金","nav_a":"-0.001","nav_date":"2016-06-03","nav_rate":"-0.1104","per_nav":"0.9050","sg_states":"开放","sname":"前海开源中航军工指数分级","symbol":"164402","total_nav":"0.9330","yesterday_nav":"0.906"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.01","nav_date":"2016-06-03","nav_rate":"1.1521","per_nav":"0.8780","sg_states":"开放","sname":"前海开源农业分级","symbol":"164403","total_nav":"0.8980","yesterday_nav":"0.868"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.01","nav_date":"2016-06-03","nav_rate":"0.7353","per_nav":"1.3700","sg_states":"开放","sname":"中银沪深300等权重指数(LOF)","symbol":"163821","total_nav":"1.3700","yesterday_nav":"1.36"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.007","nav_date":"2016-06-03","nav_rate":"0.7617","per_nav":"0.9260","sg_states":"开放","sname":"中银中证100指数增强","symbol":"163808","total_nav":"0.9360","yesterday_nav":"0.919"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.0095","nav_date":"2016-06-03","nav_rate":"0.7672","per_nav":"1.2477","sg_states":"开放","sname":"兴全沪深300指数(LOF)","symbol":"163407","total_nav":"1.2477","yesterday_nav":"1.2382"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.006","nav_date":"2016-06-03","nav_rate":"0.4167","per_nav":"1.4460","sg_states":"开放","sname":"兴全绿色投资混合(LOF)","symbol":"163409","total_nav":"2.1260","yesterday_nav":"1.44"},
			  			 {"jjlx":"偏股型基金","nav_a":"-0.001","nav_date":"2016-06-03","nav_rate":"-0.1995","per_nav":"0.5002","sg_states":"开放","sname":"天治核心成长混合(LOF)","symbol":"163503","total_nav":"2.3919","yesterday_nav":"0.5012"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.006","nav_date":"2016-06-03","nav_rate":"0.8","per_nav":"0.7560","sg_states":"开放","sname":"国富中证100指数增强分级","symbol":"164508","total_nav":"0.7790","yesterday_nav":"0.75"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.004","nav_date":"2016-06-03","nav_rate":"0.3123","per_nav":"1.2847","sg_states":"开放","sname":"工银中证500指数","symbol":"164809","total_nav":"1.3873","yesterday_nav":"1.2807"}]};*/

		
		/* var len = json.result.length;
		for(var i=0; i<len; i++){
			document.write(json.result[i].jjlx+" "+json.result[i].nav_a+" "+json.result[i].nav_date
				+" "+json.result[i].nav_rate+" "+json.result[i].per_nav+" "+json.result[i].sg_states
				+" "+json.result[i].sname+"<br />");
		} */

	</script>
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
								<a class="btn btn-primary" style="margin-top:7px;float:right;margin-right:20px;border-color:orange;background-color: orange;color:white" href="fund/listMyFund">
								<span class="glyphicon glyphicon-user"></span> My Fund
								</a>
							</div>
							<div class="box-body">
								<%ActionContext.getContext().getSession().get("result"); %>
									<table class="table table-striped3" width="60%" style="text-align:center">
										<tr>
											<th style="text-align:center">Fund Name</th>
											<th style="text-align:center">Fund Code</th>
											<th style="text-align:center">Fund Type</th>
											<th style="text-align:center">Annualized rate of return(%)</th>											
											<th style="text-align:center">Purchase</th>
										</tr>	
										<!--<c:forEach items="${res}" var="list">
											<tr>
												<td><a href="fund/toFundDetail?fName=${list.name}">${list.name}</a></td>
												<td>${list.code}</td>
												<td>${list.jjlx}</td>
												<td>${list.annualincome}</td>
												<td><a href="toFundTradingConfirm?fCode=${list.symbol}"><button>Purchase</button></a></td>
											</tr>
										</c:forEach>-->
										<c:forEach items="${fundli}" var="list">
											<tr>
												<td><div class="underline-custom"><a  style="color:#dd4b39" href="fund/toFundDetail?fCode=${list.fCode}">${list.fName}</a></div></td>
												<td>${list.fCode}</td>
												<td>${list.fType}</td>
												<td>${list.fAnnualized_rate}</td>
												<td><a class="btn btn-xs btn-danger" href="fund/toFundTradingConfirm?fCode=${list.fCode}">Purchase</a></td>
											</tr>
										</c:forEach>
									</table>
									<p></p>
									
							</div>
							<div class="box-footer">
								
								<a class="btn btn-default" href="userIndex">Return</a>
							</div>
						</div> 
				    </section>
				</aside>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="simpleDialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Tips</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="javascript:void(0)" class="close" data-dismiss="modal"
aria-label="Close">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>