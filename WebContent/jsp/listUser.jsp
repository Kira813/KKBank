<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib uri="/struts-tags" prefix="s"%>
<title>Insert title here</title>
</head>
<body>
<form action="user/addUser.action" method="post">
	user :<input type="text" name="username">
	password:<input type="text" name="pwd">
	power:<input type="text" name="power">
	<input type="submit" value="tijiao">
	
	
	<div>
	
		${listuser }
		<table>
		<s:iterator value="#listuser" status="st">
                                  <tr>
                                    <td>${id}</td>
                                    <td>${username }</td>
                                    <td>${pwd}</td>
                                    <td>${power }</td>
                                    <strong>${id}</strong>
                                    <td><a href="user/manageUser.action?id=${id}" class="btn btn-primary btn-xs">编辑</a></td>
                                    <td><a href="user/delUser.action?id=${id }" class="btn btn-primary btn-xs">删除</a></td>
                                  </tr>
          </s:iterator>
          </table>
	</div>
</form>
</body>
</html>