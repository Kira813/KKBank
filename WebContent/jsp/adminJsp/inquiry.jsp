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
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./headMeta.jsp"%></head>
<body class="skin-blue">
<%@include file="./header.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<%@include file="./sidebar.jsp"%>
	<aside class="right-side" style="font-family:Microsoft YaHei">
		<section class="content" >
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Inquiry the card status</h3>
						</div>
						<form role="form" action="admin/inquiry" method="post">
							<div class="box-body">
								<div class="form-group">
									<label>ID</label>
									<input type="text" name="ID" class="form-control" required="required">
								</div>
								<s:if test="msg!=null">
						     	   <div class=" alert-custom ">
									<a class="close" data-dismiss="alert">×</a>
									<span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong>${msg}
									</div>
			     				</s:if>
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a class="btn btn-default" href="index.action">Return</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</aside>
</div>
<%@include file="./javascript.jsp"%>
</body>
</html>