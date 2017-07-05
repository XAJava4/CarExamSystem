package com.java4.des.controller;

import java.util.ArrayList;
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
public class UserController {

	private static Logger log = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/index")
	public String index() {
		System.out.println("index method run....");
		return "index";
	}

	@ResponseBody
	@RequestMapping(value = "/json")
	public List<String> json() {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < 10; i++) {
			list.add("xxxxxx" + i);
		}
		return list;
	}

	@ResponseBody
	@RequestMapping("/save")
	public User saveUser() {
		log.warn("访问--------------------" + UserController.class.getResource("/"));
		User user = new User();
		user.setUsername("mengxy");
		user.setPassword("mengxy");
		this.userService.saveUser(user);
		return user;
	}

	@ResponseBody
	@RequestMapping("/findbyid/{id}")
	public User findById(@PathVariable long id) {
		return this.userService.findUserById(id);
	}

	@ResponseBody
	@RequestMapping("/findbyusername/{username}")
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
