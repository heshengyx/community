package com.myself.community.mapper;

import java.util.List;

import com.myself.community.entity.Building;
import com.myself.community.page.Page;
import com.myself.community.param.BuildingQueryParam;

public interface BuildingMapper {

	List<Building> list(Page<BuildingQueryParam> param);
}
