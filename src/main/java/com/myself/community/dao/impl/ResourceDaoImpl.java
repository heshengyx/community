package com.myself.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.ResourceDao;
import com.myself.community.entity.Resource;
import com.myself.community.mapper.ResourceMapper;

@Repository
public class ResourceDaoImpl extends BaseDao<ResourceMapper> implements ResourceDao {

	private static final Logger logger = LoggerFactory.getLogger(ResourceDaoImpl.class);
	private ResourceMapper mapper;
	
	public ResourceDaoImpl() {
		mapper = getMapper(ResourceMapper.class);
	}
	
	public List<Resource> getResources() {
		List<Resource> resources = new ArrayList<Resource>();
		Resource resource = new Resource();
		resource.setValue("/user/**");
		resource.setPermission("admin:user");
		
		resource = new Resource();
		resource.setValue("/book/**");
		resource.setPermission("admin:book");
		resources.add(resource);
		return resources;
	}

	public int save(Resource resource) {
		int count = 0;
		try {
			count = mapper.save(resource);
		} catch (Exception e) {
		}
		return count;
	}

}
