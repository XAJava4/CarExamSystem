<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>欢迎来到首页</h1>
		<a href="<%=request.getContextPath()%>/getAllexam">获取所有试题</a>
		<a href="<%=request.getContextPath()%>/addexam">增加试题</a>
	</center>
	
	<hr />
	<center>
		<form action="">
			<table border="1">
				<tr>
					<td>试题序号</td>
					<td>试题内容</td>
					<td>选项A</td>
					<td>选项B</td>
					<td>选项C</td>
					<td>选项D</td>
					<td>操作</td>
				</tr>
				<tr>
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.examID}</td>
							<td>${list.examTitle}</td>
							<td>${list.examOptionA}</td>
							<td>${list.examOptionB}</td>
							<td>${list.examOptionC}</td>
							<td>${list.examOptionD}</td>
							<td><a href="<%=request.getContextPath()%>/deleteExam/${list.examID}" >删除</a></td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>