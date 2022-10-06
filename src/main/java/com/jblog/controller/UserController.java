package com.jblog.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jblog.service.UserService;
import com.jblog.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	public UserController() {
		System.out.println("userController....");
	}

	@Autowired
	private UserService userService;

	// 회원가입 폼
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(@ModelAttribute UserVo userVo) {

		return "user/joinForm";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute UserVo userVo, BindingResult result, Model model) {
		System.out.println(userVo.toString());
		if (result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "user/join";
		}
		userService.join(userVo);
		userService.blogInsert(userVo.getId(),userVo.getUsername());
		return "redirect:/user/joinsuccess";
	}

	@RequestMapping("/joinsuccess")
	public String joinSuccess() {
		return "user/joinSuccess";
	}

	@RequestMapping("/login")
	public String login() {
		return "user/loginForm";
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UserVo userVo,Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		boolean result = userService.login(userVo);
		if (result) {
			String username = userService.uname(userVo);
			System.out.println("유저네임"+username);
			String id=userVo.getId();
			session.setAttribute("username", username);
			session.setAttribute("id", id);
			return new ModelAndView("main/index");
		} else {
			model.addAttribute("result", result);
			return new ModelAndView("user/loginForm");
		}
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		session.invalidate();

		return new ModelAndView("main/index");
	}

}
