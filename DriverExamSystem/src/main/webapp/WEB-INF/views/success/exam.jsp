<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script/nameSpace.js"></script>


<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0"
	http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试界面</title>
</head>
<body>
	<div
		style="width: 300px; height: 420px; border: 1px solid; position: absolute;">
		<!-- 学生信息部分 -->
		<%--  <input type="image" src="${stu.image}" align="left" style="height: 100px;width: 100px; "> --%>
		<table width="100px" height="150px" border="1" align="right"
			style="position: relative;">
			<tr>
				<td><video id="video" width="285" height="150" autoplay></video></td>
			</tr>
			<script type="text/javascript">
				var video = document.querySelector('video');
				var audio, audioType;

				navigator.getUserMedia = navigator.getUserMedia
						|| navigator.webkitGetUserMedia
						|| navigator.mozGetUserMedia
						|| navigator.msGetUserMedia;
				window.URL = window.URL || window.webkitURL || window.mozURL
						|| window.msURL;
				function getMedia() {
					if (navigator.getUserMedia) {
						navigator.getUserMedia({
							'video' : true,
							'audio' : true
						}, successFunc, errorFunc); //success是获取成功的回调函数  
					} else {
						alert('Native device media streaming (getUserMedia) not supported in this browser.');
					}
				}

				function successFunc(stream) {
					//alert('Succeed to get media!');  
					if (video.mozSrcObject !== undefined) {
						//Firefox中，video.mozSrcObject最初为null，而不是未定义的，我们可以靠这个来检测Firefox的支持  
						video.mozSrcObject = stream;
					} else {
						video.src = window.URL
								&& window.URL.createObjectURL(stream) || stream;
					}

				}
				function errorFunc(e) {
					alert('Error！' + e);
				}
				window.onload = getMedia;
			</script>
		</table>

		<center>
			<table style="position: relative; top: 75px;">
				
				<caption>学生信息</caption>
				
				<tr>
					<td>姓名：</td>
					<td>${stu.stuName}</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><c:choose>
							<c:when test="${stu.stuSex==1}">男</c:when>
							<c:otherwise>女</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>学号：</td>
					<td id="stuId">${stu.stuId}</td>
				</tr>
				<tr>
					<td>老师：</td>
					<td>${stu.teaName}</td>
					<%-- <td><input value="${stu.teaName}">${stu.teaName}</td> --%>
				</tr>
			</table>

			<div id="timer" style="color: red; position: relative; top: 100px;"></div>
		</center>
	</div>
	<!-- 试题内容 -->
	<div id="exam"
		style="width: 800px; height: 420px; border: 1px solid; position: absolute; left: 310px;">
		<input type="hidden" id="id">
		<center>
		<br><br><br>
			<div id="title"></div>
			
				<input type="radio" name="option" value="A">
				<span id="optionA"></span><br>

			
				<input type="radio" name="option" value="B">
				<span  id="optionB"></span><br>
			
			
				<input type="radio" name="option" value="C">
				<span  id="optionC"></span><br>
			
			
				<input type="radio" name="option" value="D">
				<span  id="optionD"></span><br>
			

			
				<div style="position: relative; top: 100px;">试题说明：<span style="color: red;" id="examParse">${exam.examParse}</span></div>
			
			<input type="hidden" id="answer" >
			
			<div style="position: absolute;left: 200px; bottom: 50px;"><input type="button" id="last" value="上一题" style="width: 96px; height: 44px"> </div>
			<div style="position: absolute;right: 200px; bottom: 50px;"><input type="button" id="next" value="下一题" style="width: 96px; height: 44px"></div>
		</center>
	</div>
	<!-- 题目列表 -->
	<div id="boxList"
		style="width: 320px; height: 420px; border: 1px solid; position: absolute; left: 1110px;">
		
	</div>
	<!-- 下面部分 -->
	<div
		style="height: 330px; width: 1422px; position: absolute; top: 430px; border: 1px solid;">
		<!-- 图片 -->
		<center>
			<img id="image" >
		</center>
		<span style="position: absolute; right: 0px; bottom: 0px;"> <input
			type="button" id="refer" value="交卷" align="right"
			style="height: 60px; width: 100px"></span>
         <span style="position: absolute; left: 0px; bottom: 0px;"> <input
			type="button" id="start" value="开始考试" 
			style="height: 60px; width: 100px"></span>
	</div>
	<SCRIPT LANGUAGE="JavaScript">
	var maxtime = 60 * 60 //一个小时，按秒计算，自己调整!  
	function CountDown() {
		if (maxtime >= 0) {
			minutes = Math.floor(maxtime / 60);
			seconds = Math.floor(maxtime % 60);
			msg = "距离结束还有" + minutes + "分" + seconds + "秒";
			document.all["timer"].innerHTML = msg;
			if (maxtime == 5 * 60)
				alert('注意，还有5分钟!');
			--maxtime;
		} else {
			clearInterval(timer);
			alert("时间到，结束!");
		}
	}
	$("#start").click(function (){
      
		$(this).attr("disabled", true);
	timer = setInterval("CountDown()", 1000);


	
		})
</SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script/util.js"></script>


</body>
</html>