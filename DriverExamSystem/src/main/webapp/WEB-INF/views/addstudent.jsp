<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form action=" addstudent" method="post" >
					<table>
					<tr> <td>身份证号：</td> <td> <input type="text" name="stuId" /> </td> </tr>
					<tr> <td>姓名：</td> <td> <input type="text" name="stuName" /> </td> </tr>
					<tr> <td>密码：</td> <td> <input type="text" name="stuPass" /> </td> </tr>
					<tr> <td>性别：</td> <td> <input type="text" name="stuSex" /> </td> </tr>
					<tr> <td>教练名：</td> <td> <input type="text" name="teaName" /> </td> </tr>
					<tr> <td colspan="2" > <input type="submit" />  <input type="reset" /> </td></tr>
					
					</table>
				
			
			</form>
</body>
</html>