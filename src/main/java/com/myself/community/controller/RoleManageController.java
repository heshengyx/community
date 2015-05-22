package com.myself.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;
import com.myself.community.entity.Role;
import com.myself.community.page.Page;
import com.myself.community.param.RoleQueryParam;
import com.myself.community.service.RoleService;

@Controller
@RequestMapping("/manage/role")
public class RoleManageController {

	@Autowired
	private RoleService roleService;
	
	@RequestMapping("")
	public String list(Model model) {
		return "manage/security/role-list";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(RoleQueryParam param) {
		Page<RoleQueryParam> pageResult = new Page<RoleQueryParam>();
		pageResult.setPage(param.getPage());
		pageResult.setRows(param.getLength());

		pageResult.setEntity(param);
		List<Role> buildings = roleService.list(pageResult);
		
		JsonResult<Role> jResult = new JsonResult<Role>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(pageResult.getTotalRecord());
		jResult.setRecordsFiltered(pageResult.getTotalRecord());
		jResult.setData(buildings);
		return jResult;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Role param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			roleService.save(param);
		} catch (Exception e) {
		}
		return jMessage;
	}
}
