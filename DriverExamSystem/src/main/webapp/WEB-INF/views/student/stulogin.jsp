<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>驾校考试系统</title>


<script>
        //检查id和密码是否为空
        function check(){
            var username= document.getElementById("stu_id");
            if(username.value.trim()==""){//没有输入id是显示提示
                //获取所有子节点
                var findNodes = document.getElementById("Id").children;
                if(findNodes.length==0){//只添加一次span
                    var appdom= document.createElement("span");
                    appdom.innerHTML="*ID不能为空";
                    appdom.style.color="red";
                    document.getElementById("Id").appendChild(appdom);
                }
                return false;
            }else{//输入了内容后清除节点内容
                var findNodes =document.getElementById("Id").children;
                if(findNodes.length>0){
                    document.getElementById("Id").removeChild(findNodes[0]);
                }
            }
            var userpwd = document.getElementById("stu_pas");
            if(userpwd.value.trim()==""){
                var findNodes2 = document.getElementById("Pass").children;
                if(findNodes2.length==0){
                    var appdom2 = document.createElement("span");
                    appdom2.innerHTML="*密码不能为空";
                    appdom2.style.color="red";
                    document.getElementById("Pass").appendChild(appdom2);
                }
                return false;
            }else{
                var findNodes2 = document.getElementById("Pass").children;
                if(findNodes2.length>0){
                    document.getElementById("Pass").removeChild(findNodes2[0]);
                }
            }
        }
    </script>

<style type="text/css">
body {
	position: inherit;
	margin-left: 0px;
	margin-top: -45px;
	margin-right: 0px;
	margin-bottom: 0px;
}

#div001 {
	background-color: #2196f3;
}

#div002 {
	padding: 0px;
	margin: 0px;
	margin-top: 10px;
	background-color: #00bcd4;
	text-align: center;
}

#div003 {
	background-color: #19d3ea;
	bottom: 0px;
	left: 0px;
	margin: 0;
	padding: 0;
}

#p001 {
	font-size: 45px;
	margin-left: 45px;
	font-size: 45px;
}

#p002 {
	margin-left: 45px;
	font-size: 20px;
	color: white;
}

#b001 {
	letter-spacing: 10px;
}

#td001 {
	font-size: 30px;
}

input {
	height: 25px;
	width: 250px;
}

table {
	margin-left: 260px;
}

textarea {
	border-radius: 15px;
	font-weight: bold;
	border-style: solid;
	width: 800px;
	height: 150px;
	background-color: #00bcd4;
	font-size: 25px;
	color: white;
	outline-color: white;
	resize: none;
	border-top-width: 10px;
	border-right-width: 10px;
	border-left-width: 10px;
	border-bottom-width: 10px;
	border-color: white;
	text-indent: 50px;
	outline-color: white;
}
</style>
</head>
<body>
	<div id="div001">
		<p id="p001">新 安 驾 校</p>
		<p id="p002">
			<b id="b001">xinanjiaxiao</b>
		</p>
	</div>
	<div id="div002">
		<p>&nbsp;</p>
		<textarea disabled="disabled" rows="" cols="">车管所驾驶员各科目考试均在全程电子监控和公开公正公平的环境下进行，为防止有些人利用学员怕考试或急于拿牌的心理进行诈骗,特别提醒您：任何人以包过考试向您收考试保险费或先夸大考试难度,承诺帮考试合格后再收费的行为完全是诈骗行为。</textarea>

		<p>&nbsp;</p>


		<form action="<%= request.getContextPath() %>/stulogin" method="post" >
			<table>
				<tr><td id="td001">准考号：</td>
					<td><input type="text" name="stuId" id="stu_id"/></td><em id="Id"></em></tr>
				<tr><td id="td001">密码：</td>
					<td><input type="password" name="stuPass" id="stu_pas"/></td><em id="Pass"></tr>
				<tr>
					<td></td>
					<td><input type="submit" value="进入考试系统" onclick="return check()"
						style="width: 250px; height: 30px;"  /></td>
				</tr>

			</table>
		</form>
		<p>&nbsp;</p>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br>
	</div>

</body>
</html>