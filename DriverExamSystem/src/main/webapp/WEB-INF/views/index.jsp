<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/script/jquery.min.js"></script>

<script>
	//检查id和密码是否为空
	function check() {
		var userpwd = document.getElementById("username");
		if (userpwd.value.trim() == "") {
			var findNodes2 = document.getElementById("emId").children;
			if (findNodes2.length == 0) {
				var appdom2 = document.createElement("span");
				appdom2.innerHTML = "*用户名不能为空 ";
				appdom2.style.color = "red";
				document.getElementById("emId").appendChild(appdom2);
			}
			return false;
		} else {
			var findNodes2 = document.getElementById("emId").children;
			if (findNodes2.length > 0) {
				document.getElementById("emId").removeChild(findNodes2[0]);
			}
		}
		var userpwd = document.getElementById("password");
		if (userpwd.value.trim() == "") {
			var findNodes2 = document.getElementById("pass").children;
			if (findNodes2.length == 0) {
				var appdom2 = document.createElement("span");
				appdom2.innerHTML = "*密码不能为空";
				appdom2.style.color = "red";
				document.getElementById("pass").appendChild(appdom2);
			}
			return false;
		} else {
			var findNodes2 = document.getElementById("pass").children;
			if (findNodes2.length > 0) {
				document.getElementById("pass").removeChild(findNodes2[0]);
			}
		}
	}

	$(function() {
		$("#username").change(function() {
			$(".message").empty();

		})
		$("#password").change(function() {
			$(".message").empty();

		})

	})
</script>

<title>校验并登陆</title>
<link rel=stylesheet type=text/css
	href="<%=request.getContextPath()%>/images/common.css" media=screen>
</head>

<body id=loginFrame>

	<div id=header>
		<div id=logo>
			<a title=安徽驾考科目一考试系统 href="http://ah.122.gov.cn/"
				style="width: 437px;"></a>
		</div>
	</div>
	<div id=loginBox>
		<div id=loginBoxHeader></div>
		<div id=loginBoxBody>
			<ul class=floatLeft>
				<li>
					<h4>驾考系统登录</h4>
				</li>

				<form action="<%= request.getContextPath() %>/user/vandlogin" method="post">
					<table style="height: 200px;width: 330px">

						<tr>
							<td colspan="2"><span class="message" style="color:red;" >${massage4}</span> <span
							style="color:red;"	class="message">${massage3}</span></td>
						</tr>
						<tr>
							<td align="right">用户名：</td>
							<td><input type="text" id="username" name="username"
								placeholder="考生请输入准考证号" /></td>
							<td><em id="emId"></em></td>
						</tr>
						<tr>
						<td align="right">密码：</td>
							<td><input type="password" id="password" name="password"
								placeholder="密码" /></td>
							<td><em id="pass"></em></td>
						</tr>
						<tr>
						<td align="right">角色：</td>
							<td><input type="radio" name="id" value="1"
								checked="checked" />管理员 <input type="radio" name="id" value="2" />考生
							</td>
						</tr>
						<tr>
						<td></td>
							<td><input type="submit" value="登录" onclick="return check()" /></td>
						</tr>
					</table>
				</form>
				
			</ul>
			<div class=floatRight>
				一）、考试过程中，考生不允许带帽子、墨镜（包括含有墨镜成份的眼镜），用手托住下巴等，确保视频头像完整。如打印成绩没有抓拍到整张头像，考试成绩做零分处理。注意：考试全过程必须面对摄像头。</br>
				二）、考试过程中，如碰到电脑死机、卡机、断电等情况，请及时举手向考试员反映，请不要大声喧哗（在每个座位的地上有一个电源插头，请学员小心点不要踩到上面，或者踢到上面，否则会导致电脑关机，耽误了考试时间）
			</div>
			<br clear=all>
		</div>

	</div>


</body>

</html>