package com.myself.community.mapper;

import java.util.List;

import com.myself.community.entity.Role;
import com.myself.community.page.Page;
import com.myself.community.param.RoleQueryParam;

public interface RoleMapper {

	int save(Role param);
	int update(Role param);
	int delete(Role param);
	Role getData(Role param);
	List<Role> list(Page<RoleQueryParam> param);
	List<Role> queryRolesByUserId(String userId);
}
