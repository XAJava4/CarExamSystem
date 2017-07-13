package com.java4.des.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java4.des.entity.Student;
import com.java4.des.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/stulogin" ,method={RequestMethod.POST})
	public ModelAndView stuLogin( HttpServletRequest request,HttpServletResponse response, Student student ){
			int id=student.getStuId();
			String pass=student.getStuPass();
			ModelAndView modelAndView=new ModelAndView();
			//先判断id是否为空 
			if (null!=Integer.toString(id)) {
				if (null!=pass) {
					Student student2=studentService.findByStuId(id);
					//判判断数据库中是否有这个值
					if (null!=student2) {
						String  yanzhen =student2.getStuPass();
						if (pass.equals(yanzhen)) {
							modelAndView.addObject("stu", student2);
							//跳转到成功界面
							modelAndView.setViewName("student/loginsuccess");
						}else {
							//学号和密码不匹配
							modelAndView.addObject("massage", "账号密码不匹配");
							//返回登录界面
							
						}
					}else {
						//这个学员不存在
						modelAndView.addObject("massage", "该学员不存在");
						//返回登录界面
						
					}
				}else {
					//密码不能为空
					modelAndView.addObject("massage", "密码不能为空");
				}
				
			}else {
				//写一个学生id不能为空的信息
				modelAndView.addObject("massage", "学号不能为空");
			}
			
			return modelAndView;
	}
	@RequestMapping(value="stuloginindex", method={RequestMethod.GET})
	public String  loginindex(){
		return "student/stulogin";
	}
	@RequestMapping(value="addstudent" ,method={RequestMethod.GET} )
	public String addstudentg(){
		return "student/addstudent";
	}
	
	@RequestMapping(value="addstudent" ,method={RequestMethod.POST} )
	public ModelAndView addstudent( Student student ){
		studentService.addstudent(student);
		ModelAndView mv=new ModelAndView();
		mv.addObject("message","添加成功");
		mv.setViewName("student/addstudent");
		return mv;
	}
}
