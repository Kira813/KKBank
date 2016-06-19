<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kkbank.domain.MyFund"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% List<MyFund> myfundList = (List<MyFund>)request.getAttribute("myfundli"); %>
	<table width="80%">
		<tr>
			<!-- <th>Odd No.</th> -->
			<th>Fund name</th>
			<th>Fund code</th>
			<th>Fund type</th>
			<th>Annualized rate of return</th>
			<th>Accumulated income</th>
		</tr>
		
		<%-- <s:iterator value="#myfundli" status="st">
		${ac_No }
		${amount }
		${fCode }
		</s:iterator> --%>
		<% for (MyFund temp : myfundList) { %>
		<tr align="center">
			<%if(temp == null){ %>
				<td colspan = "5" align="center">You have not bought any fund.</td>	 
			<%}
				else{ %>
					<td><%= temp.getFund().getfName() %></td>
					<td><%= temp.getFund().getfCode() %></td>
					<td><%= temp.getFund().getfType() %></td>
					<td><%= temp.getFund().getfAnnualized_rate() %>%</td>
					<td><% double share = temp.getAmount()*(1-temp.getFund().getfPur_rate())/temp.getNav(); %>
						<% double income = (temp.getFund().getNav() - temp.getNav()) * share; %>
						<%if(temp.getNav() == 0){ %>
							0.0
						<%}
						else{%>
							<%= income %>
						<%} %>
					</td>
					<td>
						<%if(temp.getStatus() == 1){ %>
							<a href="fund/toFundRedeemConfirm?fund_id=<%= temp.getFund_id() %>"><button>Redeem</button></a>
						<%}
						else{%>
							Not Confirmed
						<%} %></td>
				<%} %>
			</tr>
		<% } %>	
		<%-- <c:set var="list" scope="request" value="${myfundli}"/>	
		<c:if test="${empty list}">
			<tr>
				<td colspan = "5" align="center">You have not bought any fund.</td>
			</tr>
		</c:if>			
		<c:forEach items="${myfundli}" var="list">		
			<tr align="center">				
				<td>${list.fund.fName}</td>
				<td>${list.fund.fCode}</td>
				<td>${list.fund.fType}</td>				
				<td>${list.fund.fAnnualized_rate }</td>
				<td>(${list.fund.nav} - ${list.nav})*((${list.amount} - ${list.amount} * ${list.fund.fPur_rate})/${list.nav})</td>
				<td>
					<c:set var="status" scope="request" value="${list.status}"/>
					<c:if test="${status == 1}"><a href="fund/toFundRedeemConfirm?fund_id=${list.fund_id}"><button>Redeem</button></a></c:if>  						
					<c:if test="${status == 0}">Not Confirmed</c:if> 				
				</td>												
			</tr>
		</c:forEach> --%>	
	</table>
</body>
</html>