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
<body>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" id="login-box" style="font-family:Microsoft YaHei">
        <div class="header">Forget Password</div>
          <form action="user/verify" method="get" id="loginForm">
        	<p style="background:#eaeaec;text-align:center;margin:0;padding-top:10px;color:#333;line-height:14px;margin-bottom:-20px;"></p>
        	<div class="body bg-gray">
				<div class="form-group">
					<input type="text" name="name" placeholder="Name" class="form-control" required="required" id="name"
		            	oninvalid="setCustomValidity('Please input user name')" oninput="setCustomValidity('')" />
			    </div>	
			    <div class="form-group">	
			    	<input type="text" name="ID" placeholder="ID" class="form-control"required="required" id="ID"
		            	oninvalid="setCustomValidity('Please input ID')" oninput="setCustomValidity('')"/>
			     </div>
			     <div class="form-group">	
			    	<input type="email" name="email" placeholder="Security E-mail" class="form-control" required="required" id="email"/>
			     </div>
		   </div>
		         <div class="footer" style="text-align:center">
		            <input type="submit" value="Submit" class="btn btn-primary btn-block"/>
				    <input type="reset" value="Reset" class="btn btn-default btn-block"/>
		         </div>
		</form>
    </div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>