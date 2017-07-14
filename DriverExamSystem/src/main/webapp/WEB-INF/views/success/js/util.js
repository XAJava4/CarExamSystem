/**
 * 
 */
SSH.namespace("EXAM")

SSH.EXAM = (function() {
	"use strict";
	var CONTEXT = "";// url的上下文，是否包含项目名，默认不包含，若包含修改之
	// 获取项目上下文路径
	function getProjPath() {
		if (window.location.href.indexOf("DriverExamSystem") > 0) {
			CONTEXT = "/DriverExamSystem";
		}
	}
	function getFirst() {
		getProjPath();
		$.ajax({
			type : 'POST',
			contentType : 'application/json',
			url : CONTEXT + '/exam/getFirst',
			processData : false,
			dataType : 'json',
			data : '{}',
			success : function(data) {
				
				window.location.href = CONTEXT
				+ "/WEB-INF/views/exam.jsp"


			},
			error : function() {
				alert("打开失败！");
			}
		});
	}
	function refer() {
		
		$.ajax({
			type : 'POST',
			contentType : 'application/json',
			url : CONTEXT + '/exam/refer',
			processData : false,
			dataType : 'json',
			data : '{}',
			success : function(data) {
				alert("考试结束！")

			},
			error : function() {
				alert("提交失败！");
			}
		});
	}
	function getLast(id) {
		$.ajax({
			type : 'POST',
			contentType :  'application/json',
			url : CONTEXT + '/exam/getOne',
			processData : false,
			dataType : 'json',
			data : '{"id":"' + id + '"}',
			success : function(data) {
				window.location.href = CONTEXT
				+ "/WEB-INF/views/exam.jsp"
			 },
			error : function() {
				alert("跳转失败！")
			}
		});
	}
	function getNext(id) {
		$.ajax({
			type : 'POST',
			contentType :  'application/json',
			url : CONTEXT + '/exam/getOne',
			processData : false,
			dataType : 'json',
			data : '{"id":"' + id + '"}',
			success : function(data) {
				window.location.href = CONTEXT
				+ "/WEB-INF/views/exam.jsp"
			 },
			error : function() {
				alert("跳转失败！")
			}
		});
	}
	
	
	
	
// 若想上面的定义的常量和ｆｕｎｃｔｉｏｎ可以被外面调用，要使用下面的写法！！
	return {
		CONTEXT : CONTEXT,
		refer : refer,
		getFirst : getFirst,
		getLast : getLast,
		getNext : getNext,
		
	};

})();

$(function() {
	// 试题页面载入完成后，执行这个操作
	window.onload = SSM.EXAM.getFirst();

	// 提交按钮
	$("#refer").click(function() {

		SSH.EXAM.refer();

	})
	// 上一题按钮
	$("#last").click(function() {
      var id=$("#id").val();
	SSH.EXAM.getLast(id-1);

	})
	// 下一题按钮
	$("#next").click(function() {
		 var result=$('#answer input[name="option"]:checked ').val();
		 var answer=$('#answer').val();
		 if(answer==result){
			 
			 
		 }
		var id=$("#id").val();
		SSH.EXAM.getNext(id+1);

	})
	
})