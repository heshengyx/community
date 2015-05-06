package com.myself.community.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myself.common.utils.UIDGeneratorUtil;
import com.myself.community.dao.RegionDao;
import com.myself.community.entity.Region;
import com.myself.community.page.Page;
import com.myself.community.param.RegionQueryParam;
import com.myself.community.service.RegionService;

@Service
public class RegionServiceImpl implements RegionService {

	@Autowired
	private RegionDao regionDao;
	
	public int save(Region param) {
		param.setId(UIDGeneratorUtil.getUID());
		param.setStatus("1");
		param.setCreateTime(new Date());
		return regionDao.save(param);
	}

	public int update(Region param) {
		return regionDao.update(param);
	}

	public int delete(Region param) {
		return regionDao.delete(param);
	}

	public Region getData(Region param) {
		return regionDao.getData(param);
	}

	public List<Region> list(Page<RegionQueryParam> param) {
		return regionDao.list(param);
	}

	public List<Region> list(RegionQueryParam param) {
		return regionDao.list(param);
	}

}
