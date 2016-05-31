<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import= "com.opensymphony.xwork2.ActionContext" %>
<%@ page import= "com.opensymphony.xwork2.ActionSupport" %>
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
<base href="<%=basePath%>">
<%@include file="./adminJsp/headMeta.jsp"%></head>
<title>KK Bank</title>
</head>
<body>
	<form action="user/transfer" method="post">
		Please select your card account number:
		<select name="ac_No">
			<c:forEach items="${acList}" var="list">
				<option value="${list.ac_No}">${list.ac_No}</option>
			</c:forEach>			
		</select><br/>
		Transfer Amount: <input type="text" name="amount"/><br/>
		Receiver's Account No.: <input type="text" name="toAc_No"/><br/>
		Receiver's name: <input type="text" name="toName"/><br/>
		Card PIN: <input type="password" name="PIN" /><br/>
		${msg}<br/>
		<input type="submit" value="Submit"/>		
	</form>
<div class="modal fade" id="simpleDialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Tips</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="user/toTransfer.action">Return</a>
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
	
	var tips = '${tips}';
	if(tips) {
		dialog.show(tips);
	}
</script>
</html>