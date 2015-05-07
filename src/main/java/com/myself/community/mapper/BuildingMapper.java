package com.myself.community.mapper;

import java.util.List;

import com.myself.community.entity.Building;
import com.myself.community.page.Page;
import com.myself.community.param.BuildingQueryParam;

public interface BuildingMapper {

	int save(Building param);
	int update(Building param);
	int delete(Building param);
	Building getData(Building param);
	List<Building> listAll(BuildingQueryParam param);
	List<Building> list(Page<BuildingQueryParam> param);
}
