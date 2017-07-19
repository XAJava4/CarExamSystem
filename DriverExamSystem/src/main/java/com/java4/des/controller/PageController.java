package com.java4.des.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java4.des.controller.valueobject.RequestObject;
import com.java4.des.entity.Exam;
import com.java4.des.entity.Student;
import com.java4.des.service.ExamService;
import com.java4.des.service.StudentService;


@Controller
public class PageController {
	@Autowired
	private ExamService examService;
	@Autowired
	private StudentService studentService;
	//向考生表中添加分数
	@RequestMapping(value = "/submit", method = { RequestMethod.GET, RequestMethod.POST })
	public void addScoreByID(HttpServletRequest request, HttpServletResponse response,
			 Integer score,Integer id) {
		    Student student=studentService.getOne(id);
		    student.setStuScore(score);
		    studentService.addstudent(student);

	}

	@RequestMapping(value = "/getAll", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Exam> getAll(HttpSession session,HttpServletRequest request, HttpServletResponse response) {

		List<Exam> list = new ArrayList<Exam>();
		try {
			list = examService.getAllExams();
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return list;
	}

}
