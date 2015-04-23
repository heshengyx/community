package com.myself.community.dao;

import java.util.List;

import com.myself.community.entity.Permission;

public interface PermissionDao {

	List<Permission> queryPermissionsByRoleId(String roleId);
	List<Permission> queryPermissions();
}
