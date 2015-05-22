package com.myself.community.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.RoleDao;
import com.myself.community.entity.Role;
import com.myself.community.mapper.RoleMapper;
import com.myself.community.page.Page;
import com.myself.community.param.RoleQueryParam;

@Repository
public class RoleDaoImpl extends BaseDao<RoleMapper> implements RoleDao {

	public List<Role> queryRolesByUserId(String userId) {
		RoleMapper mapper = getMapper(RoleMapper.class);
		return mapper.queryRolesByUserId(userId);
	}

	public int save(Role param) {
		RoleMapper mapper = getMapper(RoleMapper.class);
		return mapper.save(param);
	}

	public int update(Role param) {
		RoleMapper mapper = getMapper(RoleMapper.class);
		return mapper.update(param);
	}

	public int delete(Role param) {
		RoleMapper mapper = getMapper(RoleMapper.class);
		return mapper.delete(param);
	}

	public Role getData(Role param) {
		RoleMapper mapper = getMapper(RoleMapper.class);
		return mapper.getData(param);
	}

	public List<Role> list(Page<RoleQueryParam> param) {
		RoleMapper mapper = getMapper(RoleMapper.class);
		return mapper.list(param);
	}

}
