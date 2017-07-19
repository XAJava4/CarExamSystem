package com.java4.des.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java4.des.auth.Authpassport;
import com.java4.des.entity.Student;
import com.java4.des.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	private ModelAndView modelAndView=new ModelAndView();
	
	//学生登录 
	@RequestMapping(value="/stulogin" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView stuLogin( HttpServletRequest request,HttpServletResponse response ){
			int id=Integer.parseInt((String) request.getSession().getAttribute("username"));
			String  pass=(String) request.getSession().getAttribute("password");
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
							request.getSession().setAttribute("logined", student2);
							modelAndView.setViewName("success/exam");
						}else {
							//学号和密码不匹配
							modelAndView.clear();;
							modelAndView.addObject("massage4", "账号密码不匹配");
							//返回登录界面
							modelAndView.setViewName("index");
							
							request.getSession().removeAttribute("username");
							request.getSession().removeAttribute("password");
						}
					}else {
						//这个学员不存在
						modelAndView.clear();
						modelAndView.addObject("massage3", "该学员不存在");
						//返回登录界面
						modelAndView.setViewName("index");
					
						request.getSession().removeAttribute("username");
						request.getSession().removeAttribute("password");
					}
				}else {
					//密码不能为空
					modelAndView.addObject("massage2", "密码不能为空");
					modelAndView.setViewName("index");
				
					request.getSession().removeAttribute("username");
					request.getSession().removeAttribute("password");
				}
				
			}else {
				//写一个学生id不能为空的信息
				modelAndView.addObject("massage1", "学号不能为空");
				modelAndView.setViewName("index");
			
				request.getSession().removeAttribute("username");
				request.getSession().removeAttribute("password");
			}
			
			return modelAndView;
	}

	//转到添加学生页面
	@RequestMapping(value="addstudent" ,method={RequestMethod.GET} )
	public String addstudentg(){
		return "student/addstudent";
	}
	// 增加学生
	// 增加页面
	@Authpassport
	@RequestMapping(value="/addstudent" ,method={RequestMethod.POST} )
	public ModelAndView addstudent(Student student ){
		studentService.addstudent(student);
		modelAndView.addObject("message","添加成功");
		modelAndView.setViewName("student/addstudent");
		return modelAndView;
	}
	// 查看学员
	@Authpassport
	@RequestMapping(value="/findAll" ,method={RequestMethod.GET,RequestMethod.POST} )
	public ModelAndView findAll(){
		List<Student>  list=studentService.findAll();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("student/studentindex");
		return modelAndView;
	}
	
	//删除
	@Authpassport
	@RequestMapping(value="/deleteStudent/{id}" ,method={RequestMethod.GET} )
	public String  deleteStudent( HttpServletRequest request,@PathVariable Integer id  ){
		studentService.delete(id);
		return "redirect:/findAll";
		
	}
	//多删除
	@Authpassport
	@RequestMapping(value="/deleteStudent" ,method={RequestMethod.POST} )
	public String  deleteList( HttpServletRequest request ){
		String[] ids=request.getParameterValues("gou");
		if (null !=ids) {
			for (String id : ids) {
				studentService.delete(Integer.parseInt(id));
			}
			
		}
		return "redirect:/findAll";
	}
	
	//获取单个学员
		@RequestMapping(value="/getOne",method={RequestMethod.POST} )
		public ModelAndView getOne( HttpServletRequest request ){
			 String id= request.getParameter("stuId");
			 if (""==id) {
				 List<Student> list=new ArrayList<>();
				modelAndView.addObject("list", list);
				modelAndView.setViewName("student/studentindex");
			}
			 Student student=studentService.getOne(Integer.parseInt(id));
			 if (null==student) {
				 List<Student> list=new ArrayList<>();
				modelAndView.addObject("list", list);
				modelAndView.setViewName("student/studentindex");
			}else {
				List< Student> list =new ArrayList<>();
				list.add(student);
				modelAndView.addObject("list", list);
				modelAndView.setViewName("student/studentindex");
				
			}
			 return modelAndView;
		}
		
		//更新页面
		@Authpassport
		@RequestMapping(value="/updatestudent/{id}",method={RequestMethod.GET})
		public ModelAndView update( @PathVariable Integer id ){
			Student student=studentService.getOne(id);
			modelAndView.addObject("stu", student);
			modelAndView.setViewName("student/updatestudent");
			return modelAndView;
		}
		
		//更新学员
		//更新
		@Authpassport
		@RequestMapping(value="/update", method={RequestMethod.POST})
		public String upStudent( Student student ){
			studentService.update(student.getStuName(), student.getStuPass(), student.getStuSex(), student.getTeaName(), student.getStuId());
				return "redirect:/findAll";
		}
		
		//验证用户名使用否可用
		@ResponseBody
		@RequestMapping(value="/validate", method={RequestMethod.POST})
		public String validate(Integer id ){
				Student student=studentService.getOne(id);
			if (null!=student) {
				return  "<font color='red' > 账号不可用! </font>";
			}else {
				return  "<font color='green' > 账号可用! </font>";
			}
			
		}
}
