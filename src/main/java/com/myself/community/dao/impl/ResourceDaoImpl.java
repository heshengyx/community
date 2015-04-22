package com.myself.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.myself.community.dao.ResourceDao;
import com.myself.community.entity.Resource;

@Repository
public class ResourceDaoImpl implements ResourceDao {

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

}
