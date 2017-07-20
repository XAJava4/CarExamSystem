<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/script/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//给 stuId 添加一个change事件
		$("#stuId").change(function() {
		//获取stuId 表单的value
			var val = $(this).val();
			// 除去两边空格
			val = $.trim(val);
			var $this = $(this);
			//判断输入值是否为空
			if ("" != val) {
				//消除之前的<font> 标签
				$this.nextAll("font").remove();
				//给 url 值
				var url="<%=request.getContextPath()%>/validate";
				var reqdate={"id":val};
				//使用ajax
				$.post( url,reqdate,function(date){
						$("span").html(date);
					} )
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
	<form action="<%= request.getContextPath() %>/addstudent" method="post">
		<table>
			<tr>
				<td>身份证号：</td>
				<td><input type="text" id="stuId" name="stuId" /></td>
				<td><span></span></td>
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