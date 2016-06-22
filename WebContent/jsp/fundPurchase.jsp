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
<title>KKBank | Fund Purchase</title>
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
								<h3 class="box-title" style="font-family:Microsoft YaHei">Fund Purchase</h3>
							</div>
							<div class="box-body">
								<%-- <%String fCode = request.getParameter("fCode"); %> --%>
									<form action="fund/fundPurchase" method="post">
										Your are going to purchase ${fCode} ${fName}.<br/><br/>
										<input type="hidden" name="fCode" value="${fCode}"/>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-credit-card"></i>
											</span>										
										<select class="form-control" name="ac_No" id="ac_No_selection" onchange="showBalance()">
								
											<c:forEach items="${acList }" var="list">
												<option value="${list.ac_No }">${list.ac_No }</option>
											</c:forEach>
										</select>
										</div><p></p>
										<div id="showBal"></div><p></p>
										<div class="input-group">
											<span class="input-group-addon">￥</span>
											<input class="form-control" type="text" name="amount" required="required" placeholder="Purchase amount"oninvalid="setCustomValidity('Please input valid amount')" oninput="setCustomValidity('')">
											<span class="input-group-addon">.00</span>
										</div><p></p>
										<div class="input-group" style="margin-top:10px">
											<span class="input-group-addon">
												<span class="fa fa-key"></span>
											</span>
											<input class="form-control" type="password" name="PIN" required="required"placeholder="Please input card PIN"oninvalid="setCustomValidity('Please input your card PIN')" oninput="setCustomValidity('')">
										</div><br/>
										<s:if test="msg!=null">
									     	    <div class=" alert-custom ">
												  <a class="close" data-dismiss="alert">×</a>
												  <span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong>${msg}
												 </div>
									     </s:if> 
										<p></p>
										<!-- <a class="btn btn-lg btn-default" href="javascript:void(0)" id="submit_btn">Submit</a> -->		
									<div class="box-footer">
										<input class="btn btn-danger" style="background-color: #dd4b39;border-color:#dd4b39" type="submit" value="Submit" />
										<a class="btn btn-default" href="fund/listFund">Return</a>
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
	$('select').on('change', function() { 
		$('.alert-custom').hide(); 
	});
	function showBalance(){
		var objS = document.getElementById("ac_No_selection");
		var seAC = objS.options[objS.selectedIndex].value;

		var getBalanceAjax= "ajax/getBalanceAjax";
		
		if(seAC == "null"){
			document.getElementById("showBal").innerHTML = "";
		}
		else{
			$.get(getBalanceAjax, {
				'ac_No': seAC
			}, function(data){
				document.getElementById("showBal").innerHTML = "The balance of this account is ￥"+ data.txt;		
			});
		}
	}
	
	/*$(function() {
		var action = 'fundPurchase.action';
		
		$('#submit_btn').click(function() {
			var ac_no = $('input[name=ac_no]:checked').val();
			var amount = $('input[name=amount]').val();
			var PIN = $('input[name=PIN]').val();
			
			if(!ac_no) {
				alert('Please select an account.');
			}else{
				window.location.href = action + '?fName=' + fName + 'ac_No=' + ac_no + '&amount=' + amount + '&PIN=' + PIN;
			}
		});	
	});*/
</script>
</html>