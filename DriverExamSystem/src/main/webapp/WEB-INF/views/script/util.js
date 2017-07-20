/**
 * 
 */
SSH.namespace("EXAM")

SSH.EXAM = (function() {
	"use strict";
	var CONTEXT = "";// url的上下文，是否包含项目名，默认不包含，若包含修改之
	// 获取项目上下文路径
	var exams;
	var len;
	var start=0;

	var curIndex = 0; // 默認第一個
	function getProjPath() {
		if (window.location.href.indexOf("DriverExamSystem") > 0) {
			CONTEXT = "/DriverExamSystem";
		}
	}

	function getOne() {
		var data1 = exams[curIndex];
		$("#id").val(data1.examID);
		$("#title").text("");
		$("#title").append(data1.examTitle);
		$("#optionA").text("");
		$("#optionA").append(data1.examOptionA);
		$("#optionB").text("");
		$("#optionB").append(data1.examOptionB);
		$("#optionC").text("");
		$("#optionC").append(data1.examOptionC);
		$("#optionD").text("");
		$("#optionD").append(data1.examOptionD);
		/*
		 * $("#answer").text(""); $("#answer").append(data1.examAnswer);
		 */
		$("#examParse").text("");
		$("#examParse").append(data1.examParse);
		$("#answer").val(data1.examAnswer);
	}
	function getFirst() {
		start+=1;
		getOne();

		$("#last").attr("disabled", true);

	}
	function getNext() {
		var curExam = exams[curIndex];

		curIndex += 1;
		getOne();
		if (curIndex != 0) {
			$("#last").removeAttr("disabled");
		}
		if (curIndex == 0) {
			$("#last").attr("disabled", true);
		}
		if (curIndex == len - 1) {
			$("#next").attr("disabled", true);
		}
	}
	function getLast() {
		var curExam = exams[curIndex];

		curIndex -= 1;
		getOne();
		if (curIndex != len - 1) {
			$("#next").removeAttr("disabled");
		}
		if (curIndex == 0) {
			$("#last").attr("disabled", true);
		}

	}

	/*
	 * function getOneExam(id) { getProjPath(); $.ajax({ type : 'POST',
	 * contentType : 'application/json', url : CONTEXT + '/getExam/',
	 * processData : false, dataType : 'json', data : '{"id":"' + id + '"}',
	 * success : function(data) {
	 * 
	 * $("#id").val(data.examID); $("#title").text("");
	 * $("#title").append(data.examTitle); $("#optionA").text("");
	 * $("#optionA").append(data.examOptionA); $("#optionB").text("");
	 * $("#optionB").append(data.examOptionB); $("#optionC").text("");
	 * $("#optionC").append(data.examOptionC); $("#optionD").text("");
	 * $("#optionD").append(data.examOptionD); $("#answer").text("");
	 * $("#answer").append(data.examAnswer); $("#examParse").text("");
	 * $("#examParse").append(data.examParse) var address=data.examImage;
	 * $("#image").src=address;
	 *  }, error : function() { alert("error") } }); } function refer(id,score) {
	 * 
	 * $.ajax({ type : 'POST', contentType : 'application/json', url : CONTEXT +
	 * '/addScore', processData : false, dataType : 'json', data : '{"id":"' +
	 * id + '","score":"' + score + '"}', success : function(data) {
	 * alert("考试结束！您本次考试得分为："+score+"分！")
	 *  }, error : function() { alert("提交失败！"); } }); }
	 */
	function getAll() {

		$.ajax({
					type : 'POST',
					contentType : 'application/json',
					url : CONTEXT + '/getAll',
					processData : false,
					dataType : 'json',
					data : '{}',
					success : function(data) {
						console.log("%o", data);
						if (null != data) {
							exams = data;
							len = exams.length;
							var x;
							for (x in exams) {

								var topicBox = "<span id='"
										+ exams[x].examID
										+ "'><input type='checkbox' style='width:20px;height:20px;' "
										+ " onclick='return false' /><span>";
								$("#boxList").append(topicBox);
							}
						}
					},
					error : function() {

					}
				});
	}
	function check() {
         if(start==0){
        	 return;
         }
		var val = $('input:radio[name="option"]:checked').val();
		var answer = $("#answer").val();
		var checkBoxId = $("#id").val();
		if (val == null) {
			alert('这题还没做哦！')
		} else {

			if (val == answer) {

				$("#" + checkBoxId).css("background-color", "green");
				$("#" + checkBoxId).attr("class", "good");
			} else {
				$("#" + checkBoxId).css("background-color", "red");
			}
		}

	}
	function submit() {
		var score = $(".good").length;
		var id = $("#stuId").html();
		alert('考试结束！得分：' + score);
		$.ajax({
			type : 'POST',
			async:	false,
			contentType : 'application/json',
			url : CONTEXT + '/submit',
			processData : false,
			dataType : 'json',
			data : '{"id":"' + id + '","score":"' + score + '"}',
			success : function(data) {
				alert("分數保存成功！")
			},
			error : function() {
				alert("分數保存失敗！")
			}
		})
		window.location.href = CONTEXT + "/user/redirect";

	}
	// 若想上面的定义的常量和ｆｕｎｃｔｉｏｎ可以被外面调用，要使用下面的写法！！
	return {
		CONTEXT : CONTEXT,
		curIndex : curIndex,
		submit : submit,
		getAll : getAll,
		exams : exams,
		getNext : getNext,
		getLast : getLast,
		getFirst : getFirst,
		check : check,
		len : len,
		start : start

	};

})();

$(function() {

	// 试题页面载入完成后，执行这个操作
	window.onload = function() {

		SSH.EXAM.getAll();
		/* SSH.EXAM.getOneExam(0); */
	}

	// 提交按钮
	$("#refer").click(function() {
		SSH.EXAM.check();

		SSH.EXAM.submit();

	})
	// 上一题按钮
	$("#last").click(function() {
		SSH.EXAM.check();
		SSH.EXAM.getLast();

	})
	// 下一题按钮
	$("#next").click(function() {
		SSH.EXAM.check();
		SSH.EXAM.getNext();

	})
	// 点击开始考试按钮
	$("#start").click(function() {
		
		SSH.EXAM.getFirst();

	})

})