<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/nameSpace.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/util.js"></script>
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
	timer = setInterval("CountDown()", 1000);
</SCRIPT>
<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试界面</title>
</head>
<body>
<div style="width:300px;height: 500px;border: 1px solid;position: absolute;">
	<!-- 学生信息部分 -->
   <%--  <input type="image" src="${stu.image}" align="left" style="height: 100px;width: 100px; "> --%>
			<table width="100px" height="150px" border="1" align="right" style="position: relative;">
				<tr>
					<td><video id="video" width="100" height="150" autoplay></video>  
                    <canvas id="canvas" width="150" height="0"></canvas>  </td>
				</tr>
				 <script type="text/javascript">  
				 var video = document.querySelector('video');
					var audio, audioType;

					navigator.getUserMedia = navigator.getUserMedia
							|| navigator.webkitGetUserMedia || navigator.mozGetUserMedia
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
							video.src = window.URL && window.URL.createObjectURL(stream)
									|| stream;
						}

					}
					function errorFunc(e) {
						alert('Error！' + e);
					}
					window.onload=getMedia;
    </script>  
			</table>
  
        <center>
		<table style="position: relative;top: 75px;">
			<caption>学生信息</caption>
			</tr>
			<tr>
				<td>姓名：</td>
				<td>${stu.stuName}</td>
			</tr>
			<tr>
				<td>性别：</td>
					<td><c:choose>  
						<c:when test="${stu.stuSex==1}">男</c:when>
						<c:otherwise>女</c:otherwise>
					</c:choose>  </td>
			</tr>
			<tr>
				<td>学号：</td>
				<td>${stu.stuId}</td>
			</tr>
						<tr>
				<td>老师：</td>
				<td><input value="${stu.teaName}">${stu.teaName}</td>
			</tr>
		</table>
		
		<div id="timer" style="color: red;position: relative;top: 150px;"></div>	
		</center>
</div>
	<!-- 试题内容 -->
<div id="exam" style="width:800px;height: 500px;border: 1px solid;position: absolute;left: 310px;">
    <input type="hidden" id="id" >
    <center>
   <div id="title"></div>
   <div id="optionA"><input type="radio" name="option" value="${exam.examOptionA}"></div>
   <div id="optionB"><input type="radio" name="option" value="${exam.examOptionB}"></div>
   <div id="optionC"><input type="radio" name="option" value="${exam.examOptionC}"></div>
   <div id="optionD"><input type="radio" name="option" value="${exam.examOptionD}"></div>
   <br><br><br>
   <div id="examParse"><h3>试题说明：${exam.examParse}</h3></div>
   <input type="hidden" id="answer" value="${exam.examAnswer}" >
   <br>
   <input type="button" id="last" value="上一题">
   <input type="button" id="next" value="下一题">
   <script type="text/javascript">
    var id=$("#id").val();
    if(id==1){
    	$("#last").attr("disabled",true);
    }
    if(id==20){//最大题目数
    	$("#first").attr("disabled",true);
    }
    if(id==2){
    	$("#first").removeAttr(disabled);
    }
    if(id==19){
    	$("#last").removeAttr(disabled);
    }  
   </script>
	</center>
</div>
	<!-- 题目列表 -->
<div style="width:320px;height: 500px;border: 1px solid;position: absolute;left: 1110px;">
  <c:forEach  begin="1" end="100" >
     <input type="checkbox" style="width: 20px; height: 20px" onclick="return false">
  </c:forEach>
</div>
    <!-- 下面部分 -->
<div style="height: 250px;width:1422px;position: absolute;top:510px;border: 1px solid; ">
  <!-- 图片 -->
  <center>
     <img id="image">
  </center>
  <span style="position:absolute; right:0px; bottom:0px;">
    <input type="button" id="refer" value="交卷" align="right" style="height: 60px; width: 100px"></span>
   
</div>



</body>
</html>