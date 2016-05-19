<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/KKBank/css/dialog.css">

</head>
<body>
	<p>添加失败的话这里会输出错误信息：${tips2}</p>
	<form action="withdraw.action" method="post">
		Account Number:<input type="text" name="ac_No">
		Withdrawal amount:<input type="text" name="amount">
		<input name="auth_code" type="text" style="display: none">
		<input type="submit" value="Confirm">
	</form>
	<div id="dialog">
		<div class="dialog-content">
			<input name="tmp_auth_code" type="text">
		</div>
		<div class="dialog-control">
			<div class="dialog-confirm">confirm</div>
			<div class="dialog-close">close</div>
		</div>
	</div>
	<script type="text/javascript" src="/KKBank/js/dialog.js"></script>
	<script type="text/javascript">
	(function() {
        var form = document.querySelector('form');
		var dialog = {
			box: document.getElementById('dialog'),
			show: function(msg) {
		        this.box.style.display = 'block';
			},
			hide: function() {
		        this.box.style.display = 'none';
			},
			init: function() {
				var confirm = this.box.querySelector('.dialog-confirm');
				var close = this.box.querySelector('.dialog-close');
				var self = this;

				confirm.addEventListener('click', function() {
					// get auth_code and send it to server
					var tmp_auth_code = self.box.querySelector('input[name=tmp_auth_code]');
					var auth_code = form.querySelector('input[name=auth_code]');

					// set auth_code(form hidden input) value as tmp_auth_code
					auth_code.value = tmp_auth_code.value;

					// submit the form
					form.submit();
				});
				close.addEventListener('click', function() {
					self.hide();
				});
			}
		};

		dialog.init();

        form.addEventListener('submit', function(e) {
        	var amount = form.querySelector('input[name=amount]');
		
        	if(amount.value > 50000) {
        		dialog.show('some code');
        		e.preventDefault();
        		return false;
        	}
        })
	})();
	</script>
</body>
</html>