package com.java4.des.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
		List<Exam> list=examService.getAllExams();
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("exam/examMain");
		return mv;
	}
	@RequestMapping(value="getAllexam" ,method={RequestMethod.GET} )
	public ModelAndView getAllExam(){
		List<Exam> list=examService.getAllExams();
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("exam/examMain");
		return mv;
	}
	
	@RequestMapping(value="deleteExam/{examID}" ,method={RequestMethod.GET} )
	public ModelAndView deleteExamById(@PathVariable Integer examID) {
		examService.delteExam(examID);
		List<Exam> list=examService.getAllExams();
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("exam/examMain");
		return mv;
	}
	
	
	

}
