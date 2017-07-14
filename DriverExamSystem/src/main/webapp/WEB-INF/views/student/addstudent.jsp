<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/script/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#stuId").change(function() {
			var val = $(this).val();
			val = $.trim(val);
			var $this = $(this);
			if ("" != val) {
			} else {
				$this.nextAll("font").remove();
				$this.after(" <font color='red' > 账号不能为空! </font> ")

			}

		})

	})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<%=request.getContextPath()%>/findAll"> 查看所有学员 </a>
	<h2 style="color: red">${message}</h2>
	<form action=" addstudent" method="post">
		<table>
			<tr>
				<td>身份证号：</td>
				<td><input type="text" id="stuId" name="stuId" /></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="stuName" /></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="text" name="stuPass" /></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><input type="radio" name="stuSex" value="1"
					checked="checked" />男 &nbsp;&nbsp;&nbsp; <input type="radio"
					name="stuSex" value="2" />女
			</tr>
			<tr>
				<td>教练名：</td>
				<td><input type="text" name="teaName" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" /> <input type="reset" />
				</td>
			</tr>
		</table>


	</form>
</body>
</html>