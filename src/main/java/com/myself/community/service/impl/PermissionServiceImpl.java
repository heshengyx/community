package com.myself.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myself.community.dao.PermissionDao;
import com.myself.community.entity.Permission;
import com.myself.community.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionDao permissionDao;
	
	public List<Permission> queryPermissionsByRoleId(String roleId) {
		return permissionDao.queryPermissionsByRoleId(roleId);
	}

}
