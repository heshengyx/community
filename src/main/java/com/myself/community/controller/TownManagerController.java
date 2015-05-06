package com.myself.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;
import com.myself.common.utils.LevelUtil;
import com.myself.community.entity.Region;
import com.myself.community.page.Page;
import com.myself.community.param.RegionQueryParam;
import com.myself.community.service.RegionService;

@Controller
@RequestMapping("/manage/town")
public class TownManagerController {

	@Autowired
	private RegionService regionService;
	
	@RequestMapping("")
	public String list(Model model) {
		return "manage/region/town-list";
	}
	
	@RequestMapping("list")
	@ResponseBody
	public Object list(RegionQueryParam param, HttpServletRequest request) {
		String searchValue = request.getParameter("search[value]");
		param.setName(searchValue);
		Page<RegionQueryParam> pageResult = new Page<RegionQueryParam>();
		pageResult.setPage(param.getPage());
		pageResult.setRows(param.getLength());

		param.setLevel(LevelUtil.LEVEL_TOWN);
		pageResult.setEntity(param);
		List<Region> regions = regionService.list(pageResult);
		
		JsonResult<Region> jResult = new JsonResult<Region>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(pageResult.getTotalRecord());
		jResult.setRecordsFiltered(pageResult.getTotalRecord());
		jResult.setData(regions);
		return jResult;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Region param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			param.setLevel(LevelUtil.LEVEL_TOWN);
			regionService.save(param);
		} catch (Exception e) {
		}
		return jMessage;
	}
}
