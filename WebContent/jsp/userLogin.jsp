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
<title>KK Bank</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" id="login-box" style="font-family:Microsoft YaHei">
        <div class="header">User Login</div>
          <form action="user/userLogin.action" method="post" id="loginForm">
        	<p style="background:#eaeaec;text-align:center;margin:0;padding-top:10px;color:#333;line-height:14px;margin-bottom:-20px;"></p>
        	<div class="body bg-gray">
				<div class="form-group">
			       <input type="text" name="ID" class="form-control" required="required" id="name"
			            	oninvalid="setCustomValidity('Please input your ID')" oninput="setCustomValidity('')" placeholder="User ID"/>
			    </div>	
			    <div class="form-group">	
			        <input type="password" name="pwd" class="form-control"required="required" id="pwd"
			            	oninvalid="setCustomValidity('Please input password')" oninput="setCustomValidity('')" placeholder="Password"/>
			     </div>
			         <div class="alert-custom bg-warning">
						  <a class="close" data-dismiss="alert">×</a>
						  <strong>Error!</strong>${msg}
					  </div>
			      <div id="showText">${msg}</div>       
			        
		   </div>
		         <div class="footer" style="text-align:center">
		            <input type="submit" value="Submit" class="btn btn-primary btn-block"/>
		            <a class="btn btn-default btn-block" href="userIndex.action">Return</a>
		            <a href="jsp/ForgetPwd.jsp">Forget your password?</a>
		         </div>
		</form>
    </div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>