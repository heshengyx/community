package com.myself.community.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.RegionDao;
import com.myself.community.entity.Region;
import com.myself.community.mapper.RegionMapper;
import com.myself.community.page.Page;
import com.myself.community.param.RegionQueryParam;

@Repository
public class RegionDaoImpl extends BaseDao<RegionMapper> implements RegionDao {

	public int save(Region param) {
		RegionMapper mapper = getMapper(RegionMapper.class);
		return mapper.save(param);
	}

	public int update(Region param) {
		RegionMapper mapper = getMapper(RegionMapper.class);
		return mapper.update(param);
	}

	public int delete(Region param) {
		RegionMapper mapper = getMapper(RegionMapper.class);
		return mapper.delete(param);
	}

	public Region getData(Region param) {
		RegionMapper mapper = getMapper(RegionMapper.class);
		return mapper.getData(param);
	}

	public List<Region> list(Page<RegionQueryParam> param) {
		RegionMapper mapper = getMapper(RegionMapper.class);
		return mapper.list(param);
	}

	public List<Region> list(RegionQueryParam param) {
		RegionMapper mapper = getMapper(RegionMapper.class);
		return mapper.listAll(param);
	}

}
