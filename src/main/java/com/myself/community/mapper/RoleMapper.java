package com.myself.community.mapper;

import java.util.List;

import com.myself.community.entity.Role;

public interface RoleMapper {

	List<Role> queryRolesByUserId(String userId);
}
