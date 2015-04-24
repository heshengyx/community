package com.myself.community.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.BuildingDao;
import com.myself.community.entity.Building;
import com.myself.community.mapper.BuildingMapper;
import com.myself.community.page.Page;
import com.myself.community.param.BuildingQueryParam;

@Repository
public class BuildingDaoImpl extends BaseDao<BuildingMapper> implements BuildingDao {

	public List<Building> list(Page<BuildingQueryParam> param) {
		BuildingMapper mapper = getMapper(BuildingMapper.class);
		return mapper.list(param);
	}

}
