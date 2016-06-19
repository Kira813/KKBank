<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
	<%@include file="./userHeader.jsp"%>
</div>
<div class="container">
	<div class="wrapper row-offcanvas row-offcanvas-left">
						<aside class="right-content-custom" style="font-family:Microsoft YaHei">
						<section>
							<div class="box box-success">
								<div class="box-header">
									<h3 class="box-title" style="font-family:Microsoft YaHei">Payment</h3>
								</div>
									<div class="box-body">
										<table width="80%" class="table table-striped">
											<tr>
												<th>Bill number</th>
												<th>Bill item</th>
												<th>Period</th>
												<th>Amount</th>
												<th> </th>
											</tr>
											<c:forEach items="${paylist}" var="billList">
											<tr align="center">
												<td>${billList.bNo}</td>
												<td>${billList.bItem}</td>
												<td>${billList.start_date} - ${billList.end_date}</td>
												<td><span format-balance>${billList.amount}</span></td>
												<td><a href="user/toPay?bNo=${billList.bNo}"><button class="btn btn-default">Pay</button></a></td>
											</tr>
											</c:forEach>
										</table>
									</div>
						     </div>
						 </section>
						 </aside>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>