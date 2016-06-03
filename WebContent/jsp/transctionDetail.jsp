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
<%@include file="./adminJsp/headMeta.jsp"%></head>
<body class="skin-blue">
<%@include file="./adminJsp/header.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="right-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">The last 10 transfer</h3>
						</div>
                        <div class="box-body no-padding">
                            <table class="table table-striped">
                                <tr>
                                    <th>id</th>
                                    <th>date</th>
                                    <th>type</th>
                                    <th>amount</th>
                                </tr>
                                <s:iterator value="#list" status="st">
                                	<s:if test="#st.index<10">
	                                    <tr>
	                                    	<td>${st.index + 1 }</td>
											<td><s:date name="date" format="yyyy-MM-dd"/></td>
											<td>${type }</td>
											<td>${amount }</td>
	                                  	</tr>
                                  	</s:if>
                                </s:iterator>
                            </table>
                        </div>
					</div>
					<a class="btn btn-primary" href="toTransctionHistory.action?ac_No=${ac_No }">History Transction</a>
				</div>
			</div>
		</section>
	</aside>
</div>
<%@include file="./adminJsp/javascript.jsp"%>
</body>
</html>