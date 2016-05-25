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
<body class="skin-blue">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="right-side">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Register</h3>
						</div>
						<form role="form" action="user/addUser.action" method="post">
							<div class="box-body">
								<div class="form-group">
									<label>User name</label>
									<input type="text" name="name" class="form-control" required="required">
								</div>
								<div class="form-group">
									<label>ID</label>
									<input type="text" name="ID" class="form-control" required="required">
								</div>
								<div class="form-group">
									<label>Email</label>
									<input type="email" name="email" class="form-control" id="email" required="required">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="pwd1" class="form-control" id="pwd1" required="required">
								</div>
								<div class="form-group">
									<label>Password Again</label>
									<input type="password" name="pwd2" class="form-control" id="pwd2" required="required">
								</div>
								<p>${rTips}</p>
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a class="btn btn-primary" href="userIndex.action">Return</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</aside>
</div>
<div class="modal fade" id="rDialog">
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
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" data-dismiss="modal" aria-label="Close">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./javascript.jsp"%>
<script type="text/javascript">
var dialog = {
		el: $('#rDialog'),
		show: function(msg) {
			this.el.find('.modal-body').text(msg);
			this.el.modal('show');
		},
		hide: function() {
			this.el.modal('hide');
		}
	};
	
	// 校验 PIN 是否一致
	(function() {
		//拿到页面上的form标签
		var form = document.querySelector('form'); //定义变量，  querySelector() 方法仅仅返回匹配指定选择器的第一个元素
		var pwd = document.querySelectorAll('input[type=password]');
		
		// 提交表单前触发事件
		form.addEventListener('submit', function(e) {
			var val = pwd[0].value;
			// 通过正则表达式判断是否同时包含数字，大小写字母，同时判断长度大于6
			var type = (/\d/).test(val) && (/[a-z]/).test(val) && (/[A-Z]/).test(val) && type.length >= 6;
			
			if(!type) {
				dialog.show('password not safe');
				// 阻止提交表单
				e.preventDefault();
				return false;
			}
			if(pwd[0].value && pwd[0].value !== pwd[1].value) {
				dialog.show('The two password do not match!');
				// 阻止提交表单
				e.preventDefault();
				form.pwd1.value="";
				form.pwd2.value="";
				form.pwd1.focus();
				return false;
			}
		});
	})();
	
	var rTtips = '${rTips}';
	if(rTips) {
		dialog.show(rTips);
	}
</script>
</html>