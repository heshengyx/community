<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html>
<body>
<h2>Hello World! User:<shiro:principal property="userName" /></h2>
<shiro:hasPermission name="admin:user">
<a href="/user/list">User List</a><br>
</shiro:hasPermission>
<shiro:hasPermission name="admin:book">
<a href="/book/list">Book List</a><br>
</shiro:hasPermission>
<br>--------------------------<br>
<shiro:hasRole name="admin">
<a href="/user/list">User List</a><br>
</shiro:hasRole>
<shiro:hasRole name="admin">
<a href="/book/list">Book List</a><br>
</shiro:hasRole>
</body>
</html>
