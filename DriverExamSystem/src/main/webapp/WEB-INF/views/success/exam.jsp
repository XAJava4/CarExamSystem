<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试界面</title>
</head>
<body>
<div style="width:300px;height: 500px;border: 1px solid;position: absolute;">
	<!-- 学生信息部分 -->
    <input type="image" src="${stu.image}" align="left" style="height: 100px;width: 100px; ">
			<table width="100px" height="100px" border="1" align="right" style="position: relative;">
				<tr>
					<td>摄像头</td>
				</tr>
			</table>
  
        <center>
		<table style="position: relative;top: 75px;">
			<caption>学生信息</caption>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="name" value="${stu.name}"></td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input type="text" name="age" value="${stu.age}"></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><input type="text" name="sex" value="${stu.sex}" >
					<!-- 女 <input type="radio" name="sex" value=""> -->
				</td>
			</tr>
			<tr>
				<td>学生编号：</td>
				<td><input type="text" name="stuId" value="${stu.id}"></td>
			</tr>
		</table>
		
		<div id="timer" style="color: red;position: relative;top: 200px;"></div>	
		</center>
</div>
	<!-- 试题内容 -->
<div id="answer" style="width:800px;height: 500px;border: 1px solid;position: absolute;left: 310px;">
    <input type="hidden" id="id" value="${exam.id} " >
    <center>
   <div id="question">${exam.question}</div>
   <div id="optionA"><input type="radio" name="option" value="${exam.optionA}">${exam.optionA} </div>
   <div id="optionB"><input type="radio" name="option" value="${exam.optionB}">${exam.optionB}</div>
   <div id="optionC"><input type="radio" name="option" value="${exam.optionC}">${exam.optionC}</div>
   <div id="optionD"><input type="radio" name="option" value="${exam.optionD}">${exam.optionD}</div>
   <input type="hidden" id="answer" value="${exam.answer} " >
   <br>
   <input type="button" id="last" value="上一题">
   <input type="button" id="next" value="下一题">
   <script type="text/javascript">
    var id=$("#id").val();
    if(id==1){
    	$("#last").attr("disabled",true);
    }
    if(id==5){//最大题目数
    	$("#first").attr("disabled",true);
    }
    if(id==2){
    	$("#first").removeAttr(disabled);
    }
    if(id==4){
    	$("#last").removeAttr(disabled);
    }
 
    
   </script>
	</center>
</div>
	<!-- 题目列表 -->
<div style="width:320px;height: 500px;border: 1px solid;position: absolute;left: 1110px;">
<c:forEach  begin="1" end="100" >
  <div><input type="checkbox" style="width: 20px; height: 20px"></div>
</c:forEach>
</div>
    <!-- 下面部分 -->
<div style="height: 250px;width:1422px;position: absolute;top:510px;border: 1px solid; ">
  <!-- 图片 -->
     <center>
      <div>
			<div  id="first" style="display:none; height: 150px; width: 200px; position: absolute;left:600px; top: 40px; border: 1px solid;"><input  type="image" src="${exam.optionAImg}"/></div>
			<div id="second" style="display:none; height: 150px; width: 200px; position: absolute;left:600px; top: 40px; border: 1px solid;"><input type="image" src="${exam.optionBImg}"/></div>
			<div id="third" style="display:none; height: 150px; width: 200px; position: absolute;left:600px; top: 40px; border: 1px solid;"><input type="image" src="${exam.optionCImg}"/></div>
			<div id="fourth" style="display:none; height: 150px; width: 200px; position: absolute;left:600px; top: 40px; border: 1px solid;"><input type="image" src="${exam.optionDImg}"/></div>
		</div>
  </center>
		<script type="text/javascript">
          var result=$('#answer input[name="option"]:checked ').val();
          if(result=='A'){
              $('#first').style.display="";
                }
             if (result=='B') {
              	  $('#second').style.display="";
  			}
  			if (result=='C') {
              	  $('#third').style.display="";
  			}
  			if(result=='D') {
              	  $('#fourth').style.display="";
  			}
		</script>
  <span style="position:absolute; right:0px; bottom:0px;">
    <input type="button" id="refer" value="交卷" align="right" style="height: 60px; width: 100px"></span>
   
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB-INF/views/success/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB-INF/views/success/js/util.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB-INF/views/success/js/jnameSpace.js"></script>


</body>
</html>