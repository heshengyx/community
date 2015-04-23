package com.myself.community.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myself.community.entity.User;


@Controller
@RequestMapping("/security")
public class LogoutController {

	@RequestMapping("/logout")
	public String login(User user) {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/login.jsp";
	}
}
