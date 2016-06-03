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
<body class="skin-blue">
<%@include file="./adminJsp/header.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<aside class="left-side sidebar-offcanvas">
	    <!-- sidebar: style can be found in sidebar.less -->
	    <section class="sidebar" style="font-family:Microsoft YaHei">
	        <ul class="sidebar-menu">
	            <li data-tag="index">
	                <a href="userIndex.action">
	                    <i class="fa fa-dashboard"></i><span>Index</span>
	                </a>
	            </li>
	        </ul>
	    </section>
	    <!-- /.sidebar -->
	</aside>
	<aside class="right-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="box-body">
		        <div style="font-family:Microsoft YaHei">
		       			<s:iterator value="#acList" status="st">
							<input type="radio" name="ac_no" value="${ac_No}"> ${ac_No}<br>
						</s:iterator>
				</div>
				<p>
			</div>

			<div class="box-footer">
				<a class="btn btn-lg btn-default" href="javascript:void(0)" id="next_btn">Next</a>
			</div>
		</section>
	</aside>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	$(function() {
		var action = 'toBalanceStatus.action';
		
		$('#next_btn').click(function() {
			var ac_no = $('input[name=ac_no]:checked').val();
			
			if(!ac_no) {
				alert('Please select an account.');
			}else{
			window.location.href = action + '?ac_No=' + ac_no;
			}
		});
		
	});
</script>
</html>
