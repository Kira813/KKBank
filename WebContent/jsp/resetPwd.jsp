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
<title>KK Bank</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%>
</head>
	<%String ID = request.getParameter("ID");%>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" id="login-box" style="font-family:Microsoft YaHei">
        <div class="header">Reset Password</div>
          <form action="user/changePwd" method="post" id="loginForm">
        	<p style="background:#eaeaec;text-align:center;margin:0;padding-top:10px;color:#333;line-height:14px;margin-bottom:-20px;"></p>
        	<div class="body bg-gray">
        		<input type="hidden" name="ID" value="<%=ID %>" />
				<div class="form-group">
					<input type="password" name="pwd" class="form-control" placeholder="Password" required="required"
			oninvalid="setCustomValidity('Please input your new password')" oninput="setCustomValidity('')"/>
			    </div>	
			    <div class="form-group">	
			    	<input type="password" name="conPwd" class="form-control" placeholder="Confirm Password" required="required"
			oninvalid="setCustomValidity('Please input your password again')" oninput="setCustomValidity('')"/>     	
			     </div>
		   </div>
		         <div class="footer" style="text-align:center">
		            <input type="submit" value="Submit" class="btn btn-primary btn-block"/>
					<a class="btn btn-default btn-block" href="userIndex">Return</a>
		         </div>
		</form>
    </div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>