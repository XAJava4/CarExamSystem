<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>试题管理页面</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}

#manageSubject table  td {
	font-size: 12px;
}
-->
</style>
<link href="images/skin.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif"></td>
			<td valign="top" background="images/content-bg.gif">
			<table width="100%" height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">管理试题</div></td>
						<td height="31"><a
							href="<%=request.getContextPath()%>/getAllexam">获取所有试题</a> <a
							href="<%=request.getContextPath()%>/addexam">增加试题</a></td>
					</tr>
				</table></td>
			<td width="16" valign="top" background="images/mail_rightbg.gif"></td>
		</tr>
		<tr>
			<td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0"
					align="center" cellpadding="0" cellspacing="0">
					<center>
						<tr>
							<td width="53%" valign="top">试题列表</td>
						</tr>
					</center>
					<tr>
						<td valign="middle"><span class="left_txt">
								<div id="manageExam" align="center">
									<table width="95%" cellspacing="10">
										<tr align="center">
											<td>试题编号</td>
											<td>试题标题</td>
											<td>正确答案</td>
											<td>查看试题</td>
											<td>更新试题</td>
											<td>删除试题</td>
										</tr>
										<c:forEach var="list" items="${list}">
											<tr align="center">
												<td>${list.examID}</td>
												<td>${list.examTitle}</td>
												<td>${list.examAnswer}</td>
												<td><a
													href="<%=request.getContextPath()%>/getOneExam/${list.examID}">查看</a></td>
												<td><a
													href="<%=request.getContextPath()%>/updateExam/${list.examID}">更新</a></td>
												<td><a
													href="<%=request.getContextPath()%>/deleteExam/${list.examID}">删除</a></td>
											</tr>
										</c:forEach>
										
									</table>
								</div></td>
					</tr>

					
</body>
</html>