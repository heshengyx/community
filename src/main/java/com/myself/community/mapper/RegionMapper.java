package com.myself.community.mapper;

import java.util.List;

import com.myself.community.entity.Region;
import com.myself.community.page.Page;
import com.myself.community.param.RegionQueryParam;

public interface RegionMapper {

	int save(Region param);
	int update(Region param);
	int delete(Region param);
	Region getData(Region param);
	List<Region> listAll(RegionQueryParam param);
	List<Region> list(Page<RegionQueryParam> param);
}
