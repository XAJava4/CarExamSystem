<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
table {
	text-align: center;
}

h2 {
	text-align: center;
}

.one {
	margin-left: 950px;
}

tr td {
	border: 1px solid #000;
	text-align: center
}

div {
	margin-left: 1065px;
}

#jiao {
	margin-left: 1120px;
}

#gbi {
	margin-left: 185px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="gbi" action="<%=request.getContextPath() %>/getOne"
		method="post">

		<input type="text" name="stuId" placeholder="请输入身份证号"> <input
			type="submit" id="gEBid" value="查询">
	</form>
	<div>
		<a href="<%= request.getContextPath() %>/addstudent">增加学员</a>
	</div>
	<form action=" <%=request.getContextPath() %>/deleteStudent" method="post">
		<table align="center" style="border-collapse: collapse" align="center">
			<tr bgcolor="antiquewhite" >
				<td colspan="9"><h2>学员列表</h2></td>
			</tr>
			<tr>
				<td>批量操作</td>
				<td width="100px;">身份证号</td>
				<td width="150px;">姓名</td>
				<td width="100px;">密码</td>
				<td width="100px;">性别</td>
				<td width="100px;">成绩</td>
				<td width="100px;">教练</td>
				<td width="100px;">可执行操作</td>
			</tr>

			<c:forEach var="list" items="${list}" varStatus="status" >
				<tr <c:if test="${ status.count%2==0 }">
				  bgcolor="#9acc60"
				</c:if> >
					<td ><input type="checkbox" name="gou" value="${list.stuId}"></td>
					<td>${list.stuId}</td>
					<td>${list.stuName}</td>
					<td>${list.stuPass}</td>
					<td><c:choose>  
						<c:when test="${list.stuSex==1}">男</c:when>
						<c:otherwise>女</c:otherwise>
					</c:choose>  </td>
					<td>${list.stuScore}</td>
					<td>${list.teaName}</td>
					<td><a
						href=" <%=request.getContextPath() %>/deleteStudent/${list.stuId}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	<input id="jiao" type="submit" value="删除所有勾选的">
	</form>		
	
</body>
</html>