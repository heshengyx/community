package com.myself.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.community.entity.Region;
import com.myself.community.param.RegionQueryParam;
import com.myself.community.service.RegionService;

@Controller
@RequestMapping("/manage/region")
public class RegionManagerController {

	@Autowired
	private RegionService regionService;
	
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(RegionQueryParam param) {
		List<Region> regions = null;
		try {
			regions = regionService.list(param);
		} catch (Exception e) {
			
		}
		return regions;
	}
}
