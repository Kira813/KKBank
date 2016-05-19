<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Opening a debit card</title>
</head>
<body>
	<p>添加失败的话这里会输出错误信息：${tips }</p>
	<form action="addAccount.action" method="post">
		name:<input type="text" name="name">
		ID:<input type="text" name="ID">
		PIN:<input type="password" name="password1">
		PIN Again:<input type="password" name="password2">
		<input type="submit" value="Submit">
	</form>
	<script type="text/javascript">
		// 校验 PIN 是否一致
		(function() {
			//拿到页面上的form标签
			var form = document.querySelector('form'); //定义变量，  querySelector() 方法仅仅返回匹配指定选择器的第一个元素
			var pwd = document.querySelectorAll('input[type=password]');
			
			// 提交表单前触发事件
			form.addEventListener('submit', function(e) {
				if(pwd[0].value && pwd[0].value !== pwd[1].value) {
					alert('difference and remind user to re-input Card PIN');
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
</body>
</html>