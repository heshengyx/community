package com.myself.community.mapper;

import java.util.List;

import com.myself.community.entity.Permission;

public interface PermissionMapper {

	List<Permission> queryPermissionsByRoleId(String roleId);
	List<Permission> queryPermissions();
}
