package com.java4.des.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java4.des.entity.User;
import com.java4.des.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static Logger log = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping("/save")
	@ResponseBody
	public User saveUser() {
		log.warn("访问--------------------" + UserController.class.getResource("/"));
		User user = new User();
		user.setUsername("zhaogao");
		user.setPassword("888888");
		this.userService.saveUser(user);
		return user;
	}

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
