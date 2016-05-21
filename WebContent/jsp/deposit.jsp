<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="/jsp/headMeta.jsp"%></head>
<body class="skin-blue">
	<%@include file="/jsp/header.jsp"%>
</head>

<title>KK Bank</title>

<script language="javascript">
	function inform(){
		alert("The deposit action is successful and the amount has already added to the balance!");
	}
	
	function authInform(){
		var auth_code = prompt("Your amount  is >= CNY 50,000, please input authentication code.","");
		if(auth_code) 
		{
			location href="AdminDepositAction.java";
		}
		return auth_code;
	}
	    

</script>
</head>
<body>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<%@include file="/jsp/sidebar.jsp"%>
	<aside class="right-side">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Deposit</h3>
						</div>
						<form role="form" action="deposit" method="post">
							<div class="box-body">
								<div class="form-group">
									<label for="inputUsername">Account Number</label> <input
										type="text" name="ac_No" class="form-control">
								</div>
								<div class="form-group">
									<label for="inputUsername">Deposit Amount</label> <input
										type="text" name="amount" class="form-control">
								</div>
								<p>${msg}</p>
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Confirm</button>
								<a class="btn btn-primary" href="index.action">Return</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</aside>
</div>
</body>
</html>