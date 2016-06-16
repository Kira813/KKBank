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
							<table class="table table-striped" >
					                <tbody>
					                <tr>
					                  <td style="width: 30%; padding-left:20px">Card Number</td>
					                  <td>${ac_No}</td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">RMB Balance</td>
					                  <td><span format-balance>${balance}</span></td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">Exchange Currency</td>
					                  <td>${currency}</td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">Exchange Offer Rate</td>
					                  <td>${rate}</td>
					                </tr>
					                <tr>
					                  <td style="padding-left:20px">Required RMB amount</td>
					                  <td><span format-balance>${amt}</span></td>
					                </tr>    
					             	 </tbody>
					              </table>	
					        </div>			
								<form role="form" action="" method="post">
								<div class="input-group" style="margin-top:10px">
									<span class="input-group-addon"><span class="fa fa-key"></span></span> 
									<input type="password" name="pin" id="pin" class="form-control"
										placeholder="Please input card PIN" required="required">
								</div>					
								<p>
								<div class="box-footer">
									<a class="btn btn-success" id="next_btn" href="javascript:void(0)">Next</a>	
									<a class="btn btn-default" href="toForeignExchange">Return</a>	
								</div>
								</form>
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

