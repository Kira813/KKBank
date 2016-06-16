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
<title>KKBank | Confirmation</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<%@include file="./userHeader.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
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
				    <li role="presentation">
				        <a href="toTimeDeposit">Time Deposit</a>
				    </li>
				    <li role="presentation">
				        <a href="toTransfer">Transfer</a>
				    </li>
				    <li role="presentation" class="active">
				        <a href="toForeignExchange">Foreign Exchange</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title">Confirmation</h3>
							</div>	
							<div class="box-body">		
								 <div class="input-group">
								 	<span class="input-group-addon">RMB</span>
									<span class="input-group-addon"><i class="fa fa-exchange"></i></span>	
									<select class="form-control" id="rate_list">
										<option value="" selected>Please select the target currency</option>
									</select>
								 </div>
								<p>
								<div class="input-group">
									<span class="input-group-addon" >
										<span class="fa fa-bar-chart-o" ></span> Exchange Rate
									</span>
									<div class="form-control">
										<span id="rate_count"></span>
									</div>
								</div>
								<p>
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-arrow-up"></i> Maximum Exchange Amount
									</span>
									<div class="form-control">
										<span id="rate_maxchange"></span>
									</div>
								</div>
								<p>
								<form role="form" action="" method="post">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-money"></i></span>
										<input type="text" name="amount" id="amount" class="form-control"
											placeholder="Exchange Amount" required="required"> 
									<span class="input-group-addon">.00</span>
								</div>
								</form>
								<p>
								</div>
								<div class="box-footer">
									<a class="btn btn-success" id="next_btn" href="javascript:void(0)">Next</a>	
									<a class="btn btn-default" href="toForeignExchange">Return</a>	
								</div>
							</div>
				    </section>
				</aside>
			</div>
		</div>
	</div>
	   【【- “Card Number”, “RMB Balance”, “Exchange Currency”, “Exchange Offer Rate” and “Required RMB amount” information can be seen.
- text box to input the Card PIN,
 “Return” and “Confirm” button can be seen, 
 when click the “Confirm” button, the exchange will be completed. 
 User RMB balance and foreign currency balance will be changed accordingly,
  When lick “Return” button, will turn to foreign exchange page.】】
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
</script>
</html>

