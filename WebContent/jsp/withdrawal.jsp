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
	<aside class="right-side">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Winthdrawal</h3>
						</div>
						<form role="form" action="account/withdraw.action" method="post">
							<div class="box-body">
								<div class="form-group">
									<label for="inputUsername">Account Number</label> <input
										type="text" name="ac_No" class="form-control">
								</div>
								<div class="form-group">
									<label for="inputUsername">Withdrawal Amount</label> <input
										type="text" name="amount" class="form-control">
								</div>
								<div class="form-group" style="display: none">
									<label for="inputUsername">Auth Code</label> <input type="text"
										name="auth_code" class="form-control">
								</div>
								<p>${tips2 }</p>
								<p>${tip3 }</p>
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Confirm</button>
								<a class="btn btn-primary" href="index.action">Return</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</aside>
</div>
<div class="modal" id="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Auth Code</h4>
			</div>
			<div class="modal-body">
				<form role="form">
					<div class="box-body">
						<div class="form-group">
							<input type="text" name="tmp_auth_code" class="form-control">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default dialog-close" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary dialog-confirm">Submit</button>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./javascript.jsp"%>
<script type="text/javascript">
	(function() {
		var form = document.querySelector('form');
		var dialog = {
			box : document.getElementById('dialog'),
			show : function(msg) {
				this.box.style.display = 'block';
			},
			hide : function() {
				this.box.style.display = 'none';
			},
			init : function() {
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
						alert('balance reduce success');
						//return "index";
					});
				close.addEventListener('click', function() {
					self.hide();
				});
			}
		};

		dialog.init();

		form.addEventListener('submit', function(e) {
			var amount = form.querySelector('input[name=amount]');

			if (amount.value > 50000) {
				dialog.show('some code');
				e.preventDefault();
				return false;
			}
		})
	})();
</script>
</html>