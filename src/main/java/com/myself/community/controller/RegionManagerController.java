package com.myself.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonMessage;
import com.myself.community.entity.Region;
import com.myself.community.param.RegionQueryParam;
import com.myself.community.service.RegionService;

@Controller
@RequestMapping("/manage/region")
public class RegionManagerController {

	@Autowired
	private RegionService regionService;
	
	
	@RequestMapping("/select")
	@ResponseBody
	public Object list(RegionQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		List<Region> regions = null;
		try {
			regions = regionService.list(param);
			jMessage.setCode(JsonMessage.SUCCESS_CODE);
			jMessage.setData(regions);
		} catch (Exception e) {
			
		}
		return jMessage;
	}
}
