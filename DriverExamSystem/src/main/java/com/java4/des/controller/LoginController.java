package com.java4.des.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java4.des.auth.AuthPassport;

@Controller
public class LoginController {

	//private static Logger log = Logger.getLogger(LoginController.class);

	@RequestMapping(value = "/index")
	public String index() {
		System.out.println("index method run....");
		return "index";
	}
	
	@AuthPassport
	@ResponseBody
	@RequestMapping(value = "/json")
	public List<String> json() {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < 10; i++) {
			list.add("xxxxxx" + i);
		}
		return list;
	}

}
