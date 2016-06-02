<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
radio box
	
	<s:iterator value="#acList" status="st">
	<input type="radio" name="ac_no" value="${ac_No}"> ${ac_No}<br>
	</s:iterator>

	${acList.get(0).getID()} 
	<a class="btn btn-lg btn-default" href="javascript:void(0)" id="next_btn">Next</a>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	$(function() {
		var action = 'toBalanceStatus.action';
		
		$('#next_btn').click(function() {
			var ac_no = $('input[name=ac_no]:checked').val();
			
			if(!ac_no) {
				alert('please select a ac_no');
			}
			window.location.href = action + '?ac_No=' + ac_no;
		});
		
	});
</script>
</html>