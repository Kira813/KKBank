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
<title>Insert title here</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./headMeta.jsp"%></head>
</head>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" style="font-family:Microsoft YaHei">
        <div class="header">Tips</div>
        	<div class="body bg-gray" style="text-align:center;font-size: 120%; margin-top: -5px">
				<p>Hello, ${customer.name }.</p> <!-- 从ActionContext中取出 -->
				<p>Your account is: ${account.ac_No}</p>
			</div>
            <div class="footer" style="text-align:center">
                <a class="btn btn-primary btn-block" href="index.action">Return to the Main Page</a>
            </div>
    </div>
</div>
<div class="modal fade" id="rDialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Warning</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" data-dismiss="modal" aria-label="Close">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./javascript.jsp"%>
</html>