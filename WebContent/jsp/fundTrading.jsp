<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.opensymphony.xwork2.ActionContext" %>
<%@ page import= "com.opensymphony.xwork2.ActionSupport" %>
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
</head>
	<script>		
	/*var json={"error_code":0,
			  "reason":"success",
			  "total":606,
			  "result":[{"jjlx":"偏股型基金","nav_a":"0.003","nav_date":"2016-06-03","nav_rate":"0.2737","per_nav":"1.0990","sg_states":"开放","sname":"新华中证环保产业指数分级","symbol":"164304","total_nav":"1.1570","yesterday_nav":"1.096"},
			  			 {"jjlx":"偏股型基金","nav_a":"-0.001","nav_date":"2016-06-03","nav_rate":"-0.1104","per_nav":"0.9050","sg_states":"开放","sname":"前海开源中航军工指数分级","symbol":"164402","total_nav":"0.9330","yesterday_nav":"0.906"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.01","nav_date":"2016-06-03","nav_rate":"1.1521","per_nav":"0.8780","sg_states":"开放","sname":"前海开源农业分级","symbol":"164403","total_nav":"0.8980","yesterday_nav":"0.868"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.01","nav_date":"2016-06-03","nav_rate":"0.7353","per_nav":"1.3700","sg_states":"开放","sname":"中银沪深300等权重指数(LOF)","symbol":"163821","total_nav":"1.3700","yesterday_nav":"1.36"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.007","nav_date":"2016-06-03","nav_rate":"0.7617","per_nav":"0.9260","sg_states":"开放","sname":"中银中证100指数增强","symbol":"163808","total_nav":"0.9360","yesterday_nav":"0.919"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.0095","nav_date":"2016-06-03","nav_rate":"0.7672","per_nav":"1.2477","sg_states":"开放","sname":"兴全沪深300指数(LOF)","symbol":"163407","total_nav":"1.2477","yesterday_nav":"1.2382"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.006","nav_date":"2016-06-03","nav_rate":"0.4167","per_nav":"1.4460","sg_states":"开放","sname":"兴全绿色投资混合(LOF)","symbol":"163409","total_nav":"2.1260","yesterday_nav":"1.44"},
			  			 {"jjlx":"偏股型基金","nav_a":"-0.001","nav_date":"2016-06-03","nav_rate":"-0.1995","per_nav":"0.5002","sg_states":"开放","sname":"天治核心成长混合(LOF)","symbol":"163503","total_nav":"2.3919","yesterday_nav":"0.5012"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.006","nav_date":"2016-06-03","nav_rate":"0.8","per_nav":"0.7560","sg_states":"开放","sname":"国富中证100指数增强分级","symbol":"164508","total_nav":"0.7790","yesterday_nav":"0.75"},
			  			 {"jjlx":"偏股型基金","nav_a":"0.004","nav_date":"2016-06-03","nav_rate":"0.3123","per_nav":"1.2847","sg_states":"开放","sname":"工银中证500指数","symbol":"164809","total_nav":"1.3873","yesterday_nav":"1.2807"}]};*/

		
		/* var len = json.result.length;
		for(var i=0; i<len; i++){
			document.write(json.result[i].jjlx+" "+json.result[i].nav_a+" "+json.result[i].nav_date
				+" "+json.result[i].nav_rate+" "+json.result[i].per_nav+" "+json.result[i].sg_states
				+" "+json.result[i].sname+"<br />");
		} */

	</script>
<body>
	<%ActionContext.getContext().getSession().get("result"); %>
	<table width="60%" border="1">
		<tr>
			<td>Fund Name</td>
			<td>Fund Code</td>
			<td>Fund Type</td>
			<td>Annualized rate of return(%)</td>
		</tr>	
		<!--<c:forEach items="${res}" var="list">
			<tr>
				<td><a href="fund/toFundDetail?fName=${list.name}">${list.name}</a></td>
				<td>${list.code}</td>
				<td>${list.jjlx}</td>
				<td>${list.annualincome}</td>
				<td><a href="toFundTradingConfirm?fCode=${list.symbol}"><button>Purchase</button></a></td>
			</tr>
		</c:forEach>-->
		<c:forEach items="${fundli}" var="list">
			<tr>
				<td><a href="fund/toFundDetail?fCode=${list.fCode}">${list.fName}</a></td>
				<td>${list.fCode}</td>
				<td>${list.fType}</td>
				<td>${list.fAnnualized_rate}</td>
				<td><a href="fund/toFundTradingConfirm?fCode=${list.fCode}"><button>Purchase</button></a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="userIndex"><button>Return</button></a>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
</html>