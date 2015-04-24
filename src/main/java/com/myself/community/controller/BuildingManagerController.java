package com.myself.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String list(BuildingQueryParam param) {
		Page<BuildingQueryParam> pageResult = new Page<BuildingQueryParam>();
		pageResult.setPage(1);
		pageResult.setRows(30);

		param = (param == null) ? new BuildingQueryParam() : param;
		pageResult.setEntity(param);
		List<Building> buildings = buildingService.list(pageResult);
		return "manage/building/building-list";
	}
}
