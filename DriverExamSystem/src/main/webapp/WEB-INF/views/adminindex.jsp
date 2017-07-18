<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SSJ-HomePage</title>
</head>
<body>
	<span style="margin-left: 1250px;" > 欢迎您：<c:forEach items="${list}" var="admin">${admin.username}</c:forEach></span>
	<a href="<%=request.getContextPath()%>/user/redirect">注销 </a><br/>
	<!-- 	<a href="user/findbyusername/zhangsan">获取用用户名</a>
	<a href="user/findbypassword/123654">获取用密码</a> -->

	<a href="<%=request.getContextPath()%>/findAll">学员管理</a>
	<a href="<%=request.getContextPath()%>/getAllexam">试题管理</a>
</body>
</html>