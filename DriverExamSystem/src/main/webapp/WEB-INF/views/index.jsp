<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SSJ-HomePage</title>
</head>
<body>
	<h1>Hello World!</h1>
	<a href="user/findbyusername/zhangsan">获取用用户名</a>
	<a href="user/findbypassword/123654">获取用密码</a>
	<a href=" <%=request.getContextPath()%>/stuloginindex">学员登录</a>
	<a href="<%=request.getContextPath()%>/addstudent">增加学员</a>
	<a href="<%=request.getContextPath()%>/findAll">查看所有学员</a>
	<%-- <a href="<%=request.getContextPath()%>/addexam">增加试题</a> --%>
	<a href="<%=request.getContextPath()%>/getAllexam">试题管理</a>
</body>
</html>