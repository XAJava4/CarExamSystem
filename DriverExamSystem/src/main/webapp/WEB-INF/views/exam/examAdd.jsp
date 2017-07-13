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
		<form action="<%=request.getContextPath()%>/addexam" method="post">
			<table border="1">
				<tr>
					<td>题目序号：</td>
					<td><input type="text" name="examID" id="examID" /></td>
				</tr>
				<tr>
					<td>题目内容：</td>
					<td><input type="text" name="examTitle" id="examTitle" /></td>
				</tr>
				<tr>
					<td>选项A：</td>
					<td><input type="text" name="examOptionA" id="examOptionA" /></td>
				</tr>
				<tr>
					<td>选项B</td>
					<td><input type="text" name="examOptionB" id="examOptionB" /></td>
				</tr>
				<tr>
					<td>选项C</td>
					<td><input type="text" name="examOptionC" id="examOptionC" /></td>
				</tr>
				<tr>
					<td>选项D</td>
					<td><input type="text" name="examOptionD" id="examOptionD" /></td>
				</tr>
				<tr>
					<td>答案</td>
					<td><input type="text" name="examAnswer" id="examAnswer" /></td>
				</tr>
				<tr>
					<td>题目解析</td>
					<td><input type="text" name="examParse" id="examParse" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="添加" /></td>
					<td><input type="reset" value="取消" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>