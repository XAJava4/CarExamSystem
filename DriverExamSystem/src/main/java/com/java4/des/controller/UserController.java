package com.java4.des.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java4.des.entity.User;
import com.java4.des.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

<<<<<<< Updated upstream
	// private static Logger log = Logger.getLogger(UserController.class);
=======
>>>>>>> Stashed changes

	@Autowired
	private UserService userService;

	// 校验并登陆
	@RequestMapping(value = "/vandlogin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView loginJsr(User user, BindingResult result, Errors errors, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		if ("2".equals(id)) {
			request.getSession().setAttribute("username", user.getUsername());
			request.getSession().setAttribute("password", user.getPassword());
			mv.setViewName("redirect:/stulogin");
			return mv;
		} else {
			if (errors.hasErrors()) {
				mv.setViewName("validatorTest");
				return mv;
			} else {
				List<User> list = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
				if (list.size() > 0) {
					mv.addObject("list", list);
					request.getSession().setAttribute("logined", user.getUsername());
					mv.setViewName("adminindex");
					return mv;
				} else {
					request.setAttribute("message", "密码或账号错误");
					mv.setViewName("redirect:index");
					return mv;
				}

			}
		}

	}
	
	//注销	
	@RequestMapping(value="/redirect",method= RequestMethod.GET)
	public String adminDisable(HttpServletRequest request){
		request.getSession().invalidate();
		
		return "index";
		
	}
}
