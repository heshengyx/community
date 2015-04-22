package com.myself.community.dao;

import java.util.List;
import com.myself.community.entity.Resource;

public interface ResourceDao {

	int save(Resource resource);
	List<Resource> getResources();
}
