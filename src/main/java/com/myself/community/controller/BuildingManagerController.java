package com.myself.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonResult;
import com.myself.community.entity.Building;
import com.myself.community.page.Page;
import com.myself.community.param.BuildingQueryParam;
import com.myself.community.service.BuildingService;

@Controller
@RequestMapping("/manage/building")
public class BuildingManagerController {

	@Autowired
	private BuildingService buildingService;
	
	@RequestMapping("")
	public String list(Model model) {
		return "manage/building/building-list";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(BuildingQueryParam param) {
		Page<BuildingQueryParam> pageResult = new Page<BuildingQueryParam>();
		pageResult.setPage(1);
		pageResult.setRows(30);

		param = (param == null) ? new BuildingQueryParam() : param;
		pageResult.setEntity(param);
		List<Building> buildings = buildingService.list(pageResult);
		
		JsonResult<Building> jResult = new JsonResult<Building>();
		jResult.setsEcho(1);
		jResult.setiTotalRecords(pageResult.getTotalRecord());
		jResult.setiTotalDisplayRecords(pageResult.getTotalRecord());
		jResult.setAaData(buildings);
		return jResult;
	}
}
