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
<title>KK Bank</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body style="background:#666">
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="form-box" id="login-box" style="font-family:Microsoft YaHei">
        <div class="header">User Login</div>
          <form action="user/userLogin.action" method="post" id="loginForm">
        	<p style="background:#eaeaec;text-align:center;margin:0;padding-top:10px;color:#333;line-height:14px;margin-bottom:-20px;"></p>
        	<div class="body bg-gray">
				<div class="form-group">
			       <input type="text" name="ID" class="form-control" required="required" id="name"
			            	oninvalid="setCustomValidity('Please input your ID')" oninput="setCustomValidity('')" placeholder="User ID"/>
			    </div>	
			    <div class="form-group">	
			        <input type="password" name="pwd" class="form-control"required="required" id="pwd"
			            	oninvalid="setCustomValidity('Please input password')" oninput="setCustomValidity('')" placeholder="Password"/>
			     </div>
			     <s:if test="msg!=null">
			     	    <div class=" alert-custom ">
						  <a class="close" data-dismiss="alert">×</a>
						  <span class="glyphicon glyphicon-exclamation-sign"></span><strong> Error! </strong>${msg}
						 </div>
			     </s:if>     
		   </div>
		         <div class="footer" style="text-align:center">
		            <input type="submit" value="Submit" class="btn btn-primary btn-block"/>
		            <a class="btn btn-default btn-block" href="userIndex.action">Return</a>
		            <a href="jsp/ForgetPwd.jsp">Forget your password?</a>
		         </div>
		</form>
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
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="javascript:void(0)" class="close" data-dismiss="modal"
				aria-label="Close">Return</a>
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
	$('input').on('change', function() { 
		$('.alert-custom').hide(); 
	});
	var rTips = '${rTips}';
	if(rTips){
		dialog.show(rTips);
	}
</script>
</html>