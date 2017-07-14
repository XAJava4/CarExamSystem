package com.java4.des.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java4.des.entity.User;
import com.java4.des.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static Logger log = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	//添加超链接跳转
	
	@RequestMapping(value = "/save", method = { RequestMethod.POST, RequestMethod.GET })
	public String save(HttpServletRequest request, HttpServletResponse response, User user) throws Exception {

		return "add";
		}
	
	@RequestMapping(value = "/save1", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView save1(HttpServletRequest request, HttpServletResponse response, User user) throws Exception {

	userService.saveUser(user);
	//List<User> list = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	List<User> list = userService.findUserByUsername(user.getUsername());
	ModelAndView mv = new ModelAndView();
	mv.addObject("list", list);
	mv.setViewName("cheng");
	return mv;
		}
	
	//校验超链接
	@RequestMapping(value = "/validator", method = { RequestMethod.POST, RequestMethod.GET })
	public String validator(HttpServletRequest request, HttpServletResponse response, User user) throws Exception {

		return "validatorTest";
		}
		//校验并登陆
	@RequestMapping(value = "/vandlogin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView loginJsr(@Valid @ModelAttribute User user,BindingResult result,	Errors errors,Model model,HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv =new ModelAndView();
		if (errors.hasErrors()) {
			mv.setViewName("validatorTest");
			return mv;
		}else{
		List<User> list = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (list.size() > 0) {
			mv.addObject("list", list);
			mv.setViewName("cheng");
			return mv;
		} else { 
			request.setAttribute("error", "密码或账号错误");
			mv.setViewName("redirect:index");
			return mv;
			}

		}
	}


	
	
	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })

	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, String username,
			String password) throws Exception {
		List<User> list = userService.findByUsernameAndPassword(username, password);

		ModelAndView mv = new ModelAndView();
		System.out.println("控制器+list+" + list + "+size=" + list.size());
		if (list.size() > 0) {
			mv.addObject("list", list);
			mv.setViewName("cheng");
			return mv;
		} else { // log.warn("用户名或密码错误");
			mv.setViewName("redirect:index");
			return mv;
		}
	}
	
	
	
	

	/*@RequestMapping("/save")
	@ResponseBody
	public User saveUser() {
		log.warn("访问--------------------" + UserController.class.getResource("/"));
		User user = new User();
		user.setUsername("zhangsan");
		user.setPassword("123654");
		this.userService.saveUser(user);
		return user;
	}*/

	@RequestMapping("/get")
	@ResponseBody
	public List<User> getUsers() {
		log.warn("访问--------------------" + UserController.class.getResource("/"));
		List<User> list = this.userService.findAll();
		return list;
	}
	
	@RequestMapping("/het")
	@ResponseBody
	public List<User> hetUsers() {
		log.warn("访问--------------------" + UserController.class.getResource("/"));
		List<User> list = this.userService.findAll();
		return list;
	}
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public String deleteUserById(@PathVariable Long id) {
		log.warn("访问--------------------" + UserController.class.getResource("/"));
		userService.delteUser(id);
		return "";
	}

	
	
	@RequestMapping("/findbyid/{id}")
	@ResponseBody
	public User findById(@PathVariable long id) {
		return this.userService.findUserById(id);
	}

	@RequestMapping("/findbyusername/{username}")
	@ResponseBody
	public List<User> findByUsername(@PathVariable String username) {
		System.out.println("In findByUsername");

		List<User> list = this.userService.findUserByUsername(username);
		return list;

	}

	@RequestMapping("/findbypassword/{password}")
	@ResponseBody
	public List<User> findByPassword(@PathVariable String password) {
		System.out.println("In findByPassword!");
		List<User> list = this.userService.findUserByPassword(password);
		return list;
	}
}
