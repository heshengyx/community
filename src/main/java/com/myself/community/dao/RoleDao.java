package com.myself.community.dao;

import java.util.List;

import com.myself.community.entity.Role;

public interface RoleDao {

	List<Role> queryRolesByUserId(String userId);
}
