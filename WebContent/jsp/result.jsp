<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp" %></head>
<title>Insert title here</title>
</head>
<body>
<div class="bs-example bs-example-bg-classes" data-example-id="contextual-backgrounds-helpers">
    <p class="bg-primary">Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
    <p class="bg-success">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>
    <p class="bg-info">Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
    <p class="bg-warning">Etiam porta sem malesuada magna mollis euismod.</p>
    <p class="bg-danger">Donec ullamcorper nulla non metus auctor fringilla.</p>
  </div>
    <div class="alert alert-error bg-warning">
  <a class="close" data-dismiss="alert">×</a>
  <strong>Error!</strong>This is a fatal error.
  </div>
</body>
<%@include file="./adminJsp/javascript.jsp" %>
</html>