<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/save1" method="post">
		<table>
			<tr>
				<td>用户名</td>
				<td><input name="username" id="username" type="text" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input name="password" id="password" type="password" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="save" /></td>
				<td><input type="reset" value="reset" /></td>
			</tr>
		</table>
	</form>

</body>
</html>