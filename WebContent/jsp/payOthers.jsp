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
				<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<form action="user/toPayOthers" method="get">
							Bill Number: <input type="text" name="bNo" required="required"
			oninvalid="setCustomValidity('Please input valid bill No.')" oninput="setCustomValidity('')"/><br/><br/>
							Bill owner: <input type="text" name="name" required="required"
			oninvalid="setCustomValidity('Please input valid name')" oninput="setCustomValidity('')"/><br/>
							${msg }<br/>
							<input type="submit" value="Next"/>
						</form>
					</div>
				</div>
			</div>
		</section>
	</aside>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>