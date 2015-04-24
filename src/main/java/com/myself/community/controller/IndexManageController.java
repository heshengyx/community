package com.myself.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/index")
public class IndexManageController {

	@RequestMapping("")
	public String index() {
		return "manage/index";
	}
}
