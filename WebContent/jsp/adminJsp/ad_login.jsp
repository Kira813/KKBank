<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>KK Bank | Log in</title>
  <base href="<%=basePath%>">
	<%@ taglib uri="/struts-tags" prefix="s"%>
	<%@include file="./headMeta.jsp"%></head>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" id="login-box" style="font-family:Microsoft YaHei">
        <div class="header">Admin Login</div>
          <form action="admin/login.action" method="post">
        	<p style="background:#eaeaec;text-align:center;margin:0;padding-top:10px;color:#333;line-height:14px;margin-bottom:-20px;"></p>
        	<div class="body bg-gray">
	        	  <div class="form-group has-feedback">
			        <input type="text" name="ad_id" class="form-control" required="required"
				        placeholder="Admin ID">
			        <span class="glyphicon glyphicon-user form-control-feedback"></span>
			      </div>
        	      <div class="form-group has-feedback">
        			<input type="password" name="psd" class="form-control" required="required"
        				placeholder="Password">
        			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
      			  </div>
			     <s:if test="msg!=null">
			     	    <div class=" alert-custom ">
						  <a class="close" data-dismiss="alert">×</a>
						  <span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong>${msg}
						 </div>
			     </s:if>      
		   </div>
		         <div class="footer" style="text-align:center">
		            <input type="submit" value="Login" class="btn btn-primary btn-block"/>
		         </div>
		</form>
    </div>
</div>
</body>
<%@include file="./javascript.jsp"%>
</html>