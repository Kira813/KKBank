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
			var form = document.querySelector('form');
			var pwd = document.querySelectorAll('input[type=password]');
			
			// 提交表单前触发事件
			form.addEventListener('submit', function() {
				if(pwd[0].value && pwd[0].value !== pwd[1].value) {
					alert('difference and remind user to re-input Card PIN');
					// 阻止提交表单
					return false;
				}
			});
		})();
	</script>
</body>
</html>