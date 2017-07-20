<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tr td {
	border: 1px solid #000;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题详情</title>
</head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #D2E9FF;
	
}

#manageSubject table  td {
	font-size: 12px;
}
-->
</style>
<body >
	<center>
	<h1 style="color: orange;">试题详情</h1>
	<hr color="orange" />
		<form action="<%=request.getContextPath()%>/getAllexam" method="get">
			<table style="height: 600px;width: 800px; border-collapse: collapse" align="center">
				<tr >
					<td style="width: 120px" align="left"><h3>试题编号:</h3></td>
					<td>${exam.examID}</td>
				</tr>
				<tr>
					<td align="left"><h3>试题标题:</h3></td>
					<td>${exam.examTitle}</td>
				</tr>
				<tr>
					<td align="left"><h3>选项A:</h3></td>
					<td>${exam.examOptionA}</td>
				</tr>
				<tr>
					<td align="left"><h3>选项B:</h3></td>
					<td>${exam.examOptionB}</td>
				</tr>
				<tr>
					<td align="left"><h3>选项C:</h3></td>
					<td>${exam.examOptionC}</td>
				</tr>
				<tr>
					<td align="left"><h3>选项D:</h3></td>
					<td>${exam.examOptionD}</td>
				</tr>
				<tr>
					<td align="left"><h3>试题答案:</h3></td>
					<td style="color: red;">${exam.examAnswer}</td>
				</tr>
				<tr>
				
					<td align="left"><h3>试题解析:</h3></td>
					<td>${exam.examParse}</td>
				
				</tr>
				
				<tr>
				<td colspan="2" align="center"><input type="submit" value="返回" style="color: orange;"></div></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>