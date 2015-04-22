<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
<body>
	<h2>Login</h2>
	<form action="/security/login" method="post">
	<table width="500">
	  <tr>
		<td width="80">用户名：</td>
		<td><input type="text" name="userName" id="userName" style="width:150px;"></td>
	  </tr>
	  <tr>
		<td>密码：</td>
		<td><input type="password" name="password" id="password" style="width:150px;"></td>
	  </tr>
	  <tr>
		<td></td>
		<td><input type="submit" id="submit" value="提交"></td>
	  </tr>
	</table>
	</form>
</body>
</html>
