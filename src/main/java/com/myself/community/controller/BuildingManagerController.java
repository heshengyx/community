package com.myself.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;
import com.myself.community.entity.Building;
import com.myself.community.entity.BuildingData;
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
		pageResult.setPage(param.getPage());
		pageResult.setRows(param.getLength());

		pageResult.setEntity(param);
		List<BuildingData> buildings = buildingService.list(pageResult);
		
		JsonResult<BuildingData> jResult = new JsonResult<BuildingData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(pageResult.getTotalRecord());
		jResult.setRecordsFiltered(pageResult.getTotalRecord());
		jResult.setData(buildings);
		return jResult;
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public Object search(BuildingQueryParam param) {
		List<Building> buildings = null;
		try {
			buildings = buildingService.list(param);
		} catch (Exception e) {
			
		}
		return buildings;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Building param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			buildingService.save(param);
		} catch (Exception e) {
		}
		return jMessage;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(Building param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			buildingService.update(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jMessage;
	}
	
	@RequestMapping("/getData")
	@ResponseBody
	public Object getData(Building param) {
		JsonMessage jMessage = new JsonMessage();
		Building data = null;
		try {
			data = buildingService.getData(param);
			jMessage.setData(data);
		} catch (Exception e) {
		}
		return jMessage;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(Building param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			buildingService.delete(param);
		} catch (Exception e) {
		}
		return jMessage;
	}
}
