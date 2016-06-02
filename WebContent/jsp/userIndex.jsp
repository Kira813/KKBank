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
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<body>
<div class="wrapper row-offcanvas row-offcanvas-left">

        <div style="font-family:Microsoft YaHei">User Index</div>

		<s:if test="#session.loginID==null"><a class="btn btn-lg btn-default" href="user/userLogin">Log in</a></s:if>
		<s:else><a class="btn btn-lg btn-default" id="logout">Log out</a></s:else>
		<a class="btn btn-lg btn-primary" href="user/register.action">Register</a>
		<a class="btn btn-lg btn-default" href="toAccountEnquiry.action">Account Enquiry</a>
		<a class="btn btn-lg btn-default" href="toTransfer.action">Transfer</a>
		
<div class="modal fade" id="simpleDialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Warn</h4>
			</div>
			<div class="modal-body">
			Do you really want to log out?
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="userIndex.action">Return</a>
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