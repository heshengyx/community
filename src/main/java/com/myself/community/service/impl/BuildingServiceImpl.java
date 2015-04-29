package com.myself.community.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myself.common.utils.UIDGeneratorUtil;
import com.myself.community.dao.BuildingDao;
import com.myself.community.entity.Building;
import com.myself.community.page.Page;
import com.myself.community.param.BuildingQueryParam;
import com.myself.community.service.BuildingService;

@Service
public class BuildingServiceImpl implements BuildingService {

	@Autowired
	private BuildingDao buildingDao;

	public List<Building> list(Page<BuildingQueryParam> param) {
		return buildingDao.list(param);
	}

	public int save(Building param) {
		param.setId(UIDGeneratorUtil.getUID());
		param.setStatus("1");
		param.setCreateTime(new Date());
		return buildingDao.save(param);
	}

	public int delete(Building param) {
		return buildingDao.delete(param);
	}

	public Building getData(Building param) {
		return buildingDao.getData(param);
	}

	public int update(Building param) {
		return buildingDao.update(param);
	}

	
}
