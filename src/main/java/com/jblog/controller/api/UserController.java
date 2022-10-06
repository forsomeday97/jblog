package com.jblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jblog.dto.JSONResult;
import com.jblog.service.UserService;

@Controller("userAPIController")
@RequestMapping("/user/api")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/checkId")
	public String checkId(@RequestParam(value="id",required=true,defaultValue = "")String id) {
		System.out.println(id);
		String a="";
		Boolean exist = userService.existId(id);
		if(exist==true) {
			a="true";
		}else {
			a="false";
		}
		return a;
	}
}
