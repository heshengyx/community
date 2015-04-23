package com.myself.community.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.PermissionDao;
import com.myself.community.entity.Permission;
import com.myself.community.mapper.PermissionMapper;

@Repository
public class PermissionDaoImpl extends BaseDao<PermissionMapper> implements PermissionDao {

	public List<Permission> queryPermissionsByRoleId(String roleId) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.queryPermissionsByRoleId(roleId);
	}

	public List<Permission> queryPermissions() {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.queryPermissions();
	}

}
