package com.myself.community.dao;

import java.util.List;

import com.myself.community.entity.Building;
import com.myself.community.page.Page;
import com.myself.community.param.BuildingQueryParam;

public interface BuildingDao {

	int save(Building param);
	int update(Building param);
	int delete(Building param);
	Building getData(Building param);
	List<Building> list(BuildingQueryParam param);
	List<Building> list(Page<BuildingQueryParam> param);
}
