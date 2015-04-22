package com.myself.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.community.entity.User;
import com.myself.community.service.UserService;
import com.myself.source.message.JsonMessage;

@Controller
@RequestMapping("/manage/user")
public class UserManageController extends BaseController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(User user) {
		System.out.println("==============list=" + user.getUserName() + "," + user.getPassword());
		return "user/list";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String edit() {
		return "manage/user/user-edit";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody
	public Object save(User user) {
		JsonMessage jm = new JsonMessage();
		int count = 0;
		try {
			count = userService.save(user);
			
			jm.setCode(JsonMessage.SUCCESS_CODE);
			jm.setMessage("保存用户成功");
		} catch (Exception e) {
			jm.setCode(JsonMessage.ERROR_CODE);
			jm.setMessage(e.getMessage());
		}
		return jm;
	}
}
