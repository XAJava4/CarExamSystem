<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 导入下面的js文件是为了使用Ajax发异步请求 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/script/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/ssm/ssmnamespace.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/ssm/student/student.js"></script>
</head>
<body>
	
	<center>
	<table>
		<tr>
		<td>欢迎登陆：</td>
		 <td>		
		<c:forEach items="${list}" var="list" >	
		${list.username}
		</c:forEach>
		</td>
		</tr>
	</table>
	</center>
	
	<%-- <center>
	<!-- <input id="saveBtn" type="button" value="添加管理员" />
	<input id="delBtn" type="button" value="删除管理员" />
	<input id="modBtn" type="button" value="修改密码" />
	<br /> -->
	
	<a href="<%=request.getContextPath()%>/user/save">添加管理员</a>
	<br>
	<input type="password" id="modpad" name="modpad"/>
	<a href="<%=request.getContextPath()%>/user/update/${modpad}">修改密碼</a>
	</center>
	 --%>
</body>
</html>