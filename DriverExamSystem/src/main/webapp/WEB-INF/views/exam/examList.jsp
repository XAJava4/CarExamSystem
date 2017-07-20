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
	<h1 style="color: orange;">试题详情</h1>
	<hr color="orange" />
		<form action="<%=request.getContextPath()%>/getAllexam" method="get">
			<table style="height: 600px;width: 800px" border="1">
				<tr >
					<td style="width: 80px" align="right">试题编号:</td>
					<td>${exam.examID}</td>
				</tr>
				<tr>
					<td align="right">试题标题:</td>
					<td>${exam.examTitle}</td>
				</tr>
				<tr>
					<td align="right">选项A:</td>
					<td>${exam.examOptionA}</td>
				</tr>
				<tr>
					<td align="right">选项B:</td>
					<td>${exam.examOptionB}</td>
				</tr>
				<tr>
					<td align="right">选项C:</td>
					<td>${exam.examOptionC}</td>
				</tr>
				<tr>
					<td align="right">选项D:</td>
					<td>${exam.examOptionD}</td>
				</tr>
				<tr>
					<td align="right">试题答案:</td>
					<td>${exam.examAnswer}</td>
				</tr>
				<tr>
					<td align="right">试题解析:</td>
					<td>${exam.examParse}</td>
				</tr>
				<tr>
				<td colspan="2"><div align="center"><input type="submit" value="返回"></div></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>