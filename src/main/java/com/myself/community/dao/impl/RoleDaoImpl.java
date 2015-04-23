package com.myself.community.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.RoleDao;
import com.myself.community.entity.Role;
import com.myself.community.mapper.RoleMapper;

@Repository
public class RoleDaoImpl extends BaseDao<RoleMapper> implements RoleDao {

	public List<Role> queryRolesByUserId(String userId) {
		RoleMapper mapper = getMapper(RoleMapper.class);
		return mapper.queryRolesByUserId(userId);
	}

}
