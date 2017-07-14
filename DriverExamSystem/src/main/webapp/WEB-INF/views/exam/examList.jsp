<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form action="">
			<table>
				<tr>
					<td>试题编号</td>
					<td>${exam.examID}</td>
				</tr>
				<tr>
					<td>试题标题</td>
					<td>${exam.examTilte}</td>
				</tr>
				<tr>
					<td>选项A</td>
					<td>${exam.examOptionA}</td>
				</tr>
				<tr>
					<td>选项B</td>
					<td>${exam.examOptionB}</td>
				</tr>
				<tr>
					<td>选项C</td>
					<td>${exam.examOptionC}</td>
				</tr>
				<tr>
					<td>选项D</td>
					<td>${exam.examOptionD}</td>
				</tr>
				<tr>
					<td>试题答案</td>
					<td>${exam.examAnswer}</td>
				</tr>
				<tr>
					<td>试题解析</td>
					<td>${exam.examParse}</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>