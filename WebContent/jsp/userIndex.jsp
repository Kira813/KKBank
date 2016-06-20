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
<title>KKBank</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%>
<style>
body {
	background: #e7e7e7;
}
</style>
</head>
<body>
<s:if test="#session.loginID==null">
	<%@include file="./userHeaderBefore.jsp"%>
</s:if>
<s:else>
	<%@include file="./userHeader.jsp"%>
</s:else>
<div class="custom-bg">
	<div>
		<h1>KKBank</h1>
		<h3>Hello,${name}</h3>
	</div>
</div>
<div class="container">
	<div class="intro-wrap">
		<ul class="row">
			<li class="col-sm-4">
				<img src="/KKBank/images/uIndex1.jpg">
				<div>
					<p>Banking</p>
				</div>
			</li>
			<li class="col-sm-4">
				<img src="/KKBank/images/uIndex2.jpg">
				<div>
					<p>Borrowing</p>
				</div>
			</li>
			<li class="col-sm-4">
				<img src="/KKBank/images/uIndex3.jpg">
				<div>
					<p>Investing</p>
				</div>
			</li>
		</ul>
	</div>
</div>
<!-- downside intro -->
<div class="container intro-container">
	<div class="row">
		<div class="col-sm-8">
			<div class="row">
				<div class="col-sm-12 custom-tag custom-tag1">11</div>
			</div>
			<div class="row">
				<div class="col-sm-8 custom-tag custom-tag2">22</div>
				<div class="col-sm-4 custom-tag custom-tag3">33</div>
			</div>
		</div>
		<div class="col-sm-4 custom-tag custom-tag4">44</div>
	</div>
</div>
<div class="modal fade" id="simpleDialog" style="font-family:Microsoft YaHei">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Warning</h4>
			</div>
			<div class="modal-body">
			Do you really want to log out?
			</div>
			<div class="modal-footer">
				<a class="btn btn-default" href="userIndex.action">Return</a>
				<a class="btn btn-primary" href="user/logout.action">Confirm</a>
			</div>
		</div>
	</div>
 </div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	var dialog = {
			el: $('#simpleDialog'),
			show: function(msg) {
				this.el.find('.modal-body').text(msg);
				this.el.modal('show');
			},
			hide: function() {
				this.el.modal('hide');
			}
		};
	$('#logout').on('click', function() {
		$('#simpleDialog').modal('show');
	});
</script>
</html>