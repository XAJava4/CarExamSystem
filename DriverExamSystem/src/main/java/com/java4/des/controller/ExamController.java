package com.java4.des.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java4.des.entity.Exam;
import com.java4.des.service.ExamService;

@Controller
public class ExamController {
	@Autowired
	private ExamService examService;
	
	@RequestMapping(value="addexam" ,method={RequestMethod.GET} )
	public String addexam(){
		return "exam/examAdd";
	}
	@RequestMapping(value="addexam" ,method={RequestMethod.POST} )
	public ModelAndView addExam(Exam exam ){
		examService.addExam(exam);
		ModelAndView mv=new ModelAndView();
		mv.addObject("message","添加成功");
		mv.setViewName("exam/examMain");
		return mv;
	}
	

}
