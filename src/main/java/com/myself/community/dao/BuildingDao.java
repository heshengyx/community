package com.myself.community.dao;

import java.util.List;

import com.myself.community.entity.Building;
import com.myself.community.page.Page;
import com.myself.community.param.BuildingQueryParam;

public interface BuildingDao {

	List<Building> list(Page<BuildingQueryParam> param);
}
