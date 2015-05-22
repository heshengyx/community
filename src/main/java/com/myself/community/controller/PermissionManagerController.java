package com.myself.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;
import com.myself.community.entity.Permission;
import com.myself.community.page.Page;
import com.myself.community.param.PermissionQueryParam;
import com.myself.community.service.PermissionService;

@Controller
@RequestMapping("/manage/permission")
public class PermissionManagerController {

	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping("")
	public String list(Model model) {
		return "manage/security/permission-list";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(PermissionQueryParam param) {
		Page<PermissionQueryParam> pageResult = new Page<PermissionQueryParam>();
		pageResult.setPage(param.getPage());
		pageResult.setRows(param.getLength());

		pageResult.setEntity(param);
		List<Permission> buildings = permissionService.list(pageResult);
		
		JsonResult<Permission> jResult = new JsonResult<Permission>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(pageResult.getTotalRecord());
		jResult.setRecordsFiltered(pageResult.getTotalRecord());
		jResult.setData(buildings);
		return jResult;
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public Object tree(PermissionQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			permissionService.list(param);
		} catch (Exception e) {
		}
		return jMessage;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Permission param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			permissionService.save(param);
		} catch (Exception e) {
		}
		return jMessage;
	}
}
