package com.java4.des.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java4.des.auth.AuthPassport;
import com.java4.des.entity.Exam;
import com.java4.des.service.ExamService;

@Controller
public class ExamController {
	@Autowired
	private ExamService examService;
	
	@AuthPassport
	@RequestMapping(value="addexam" ,method={RequestMethod.GET} )
	public String addexam(){
		return "exam/examAdd";
	}
	//添加试题
	@AuthPassport
	@RequestMapping(value="addexam" ,method={RequestMethod.POST} )
	public ModelAndView addExam(Exam exam ){
		examService.addExam(exam);
		List<Exam> list=examService.getAllExams();
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("exam/examMain");
		return mv;
	}
	
	//获取一个试题查看试题
	@AuthPassport
	@RequestMapping(value="getOneExam/{examID}" ,method={RequestMethod.GET} )
	public ModelAndView getOneExam(@PathVariable int examID ){
		Exam exam=examService.getOne(examID);
		ModelAndView mv=new ModelAndView();
		mv.addObject("exam",exam);
		mv.setViewName("exam/examList");
		return mv;
	}
	
	//获取更新更新试题
	@AuthPassport
	@RequestMapping(value="updateExam/{examID}" ,method={RequestMethod.GET} )
	public ModelAndView UpdateExam(@PathVariable int examID ){
		Exam exam=examService.getOne(examID);
		ModelAndView mv=new ModelAndView();
		mv.addObject("exam",exam);
		mv.setViewName("exam/examUpdate");
		return mv;
	}
	//更新试题
	@AuthPassport
	@RequestMapping(value="updateExam1" ,method={RequestMethod.POST} )
	public ModelAndView updateExam(Exam exam ){
		examService.updateExam(exam);
		List<Exam> list=examService.getAllExams();
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("exam/examMain");
		
		
		return mv;
	}
	//获取所有试题
	@AuthPassport
	@RequestMapping(value="getAllexam" ,method={RequestMethod.GET} )
	public ModelAndView getAllExam(){
		List<Exam> list=examService.getAllExams();
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("exam/examMain");
		return mv;
	}
	
	//根据id删除试题
	@AuthPassport
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
