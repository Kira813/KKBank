<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
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
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Opening a Debit Card</h3>
						</div>
						<form role="form" action="account/addAccount.action" method="post">
							<div class="box-body">
								<div class="form-group">
									<label>Name</label>
									<input type="text" name="name" class="form-control" required="required">
								</div>
								<div class="form-group">
									<label>ID</label>
									<input type="text" name="ID" class="form-control" required="required">
								</div>
								<div class="form-group">
									<label>PIN</label>
									<input type="password" name="password1" class="form-control" id="password1" required="required">
								</div>
								<div class="form-group">
									<label>PIN Again</label>
									<input type="password" name="password2" class="form-control" id="password2" required="required">
								</div>
								<p>${tips }</p>
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
</body>
<%@include file="./javascript.jsp"%>
<script type="text/javascript">
	// 校验 PIN 是否一致
	(function() {
		//拿到页面上的form标签
		var form = document.querySelector('form'); //定义变量，  querySelector() 方法仅仅返回匹配指定选择器的第一个元素
		var pwd = document.querySelectorAll('input[type=password]');
		// 提交表单前触发事件
		form.addEventListener('submit', function(e) {

			var name = $('input[name=name]'); 
			var ID = $('input[name=ID]');
			var email = $('input[name=email]');
			
			if(pwd[0].value && pwd[0].value !== pwd[1].value) {
				alert('Differenct Card PIN');
				// 阻止提交表单
				e.preventDefault();
				form.password1.value="";
				form.password2.value="";
				form.password1.focus();
				return false;
			}
		});
	})();
	/*  
	 *  匿名函数自调用，也就是说，定义一个匿名函数，然后立即调用他
	 *  (function(){}) 是一个匿名变量
	 *  (function() {})(); 后面加多一个括号执行
	 *  js 的闭包
	 */
</script>
</html>