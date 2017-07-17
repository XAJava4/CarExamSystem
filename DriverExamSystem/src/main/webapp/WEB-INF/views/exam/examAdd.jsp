<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>试题添加页面</title>
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
		background-color: #EEF2FB;
	}
	#addSubjectForm table  td{
		font-size:12px;
	}
	-->
	</style>
	<link href="images/skin.css" rel="stylesheet" type="text/css">
  </head>
<body> 
 <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="../images/mail_leftbg.gif"><img src="../images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="../images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">录入试题</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="53%" valign="top">&nbsp;</td>
        </tr>
      <tr>
        <td valign="middle"><span class="left_txt">
			<div id="addExamForm" align="center"><!--录入试题表单-->
				<form action="<%=request.getContextPath()%>/addexam" method="post">
				<table border="0" cellspacing="10" cellpadding="0">
				  <tr>
					<td colspan="2"><FONT color="red"><s:actionerror/></FONT></td>
				  </tr>
				  <tr>
					<td>试题题目:</td>
					<td><input type="text" name="examTitle" id="examTitle"  size="80" value="${exam.examTitle}"></td>
				  </tr>
				  <tr>
					<td>选项A:</td>
					<td><input type="text" name="examOptionA" id="examOptionA" size="20" value="${exam.examOptionA}" ></td>
				  </tr>
				   <tr>
					<td>选项B:</td>
					<td><input type="text" name="examOptionB" id="examOptionB" size="20" value="${exam.examOptionB}"></td>
				  </tr>
				   <tr>
					<td>选项C:</td>
					<td><input type="text" name="examOptionC" id="examOptionC" size="20" value="${exam.examOptionC}"></td>
				  </tr>
				   <tr>
					<td>选项D:</td>
					<td><input type="text" name="examOptionD" id="examOptionD" size="20" value="${exam.examOptionD}"></td>
				  </tr>
				   <tr>
					<td>答案:</td>
					<td>
						<input name="examAnswer" type="radio" value="A" 
						${exam.examAnswer == "A" ? "checked" : ""}>A
						<input name="examAnswer" type="radio" value="B"
						${exam.examAnswer == "B" ? "checked" : ""}>B
						<input name="examAnswer" type="radio" value="C"
						${exam.examAnswer == "C" ? "checked" : ""}>C
						<input name="examAnswer" type="radio" value="D"
						${exam.examAnswer == "D" ? "checked" : ""}>D
					</td>
				  </tr>
				  <tr>
					<td valign="top">试题解析:</td>
					<td>
						<textarea id="examParse" name="examParse" cols="76" rows="10" value="${exam.examParse}" ></textarea>
					</td>
				  </tr>
				  <tr>
				  	<td colspan="2"><div align="center">
				  	  <input type="submit" value="录入">				  	  
				  	  <input type="reset" value="重置">
			  	  </div>
				</td>
				  </tr>
			</table>
			</form>	
			</div>
		</td>
        </tr>
      
    </table></td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
</html>