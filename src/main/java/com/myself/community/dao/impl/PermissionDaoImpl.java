package com.myself.community.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.PermissionDao;
import com.myself.community.entity.Permission;
import com.myself.community.mapper.PermissionMapper;
import com.myself.community.page.Page;
import com.myself.community.param.PermissionQueryParam;

@Repository
public class PermissionDaoImpl extends BaseDao<PermissionMapper> implements PermissionDao {

	public List<Permission> queryPermissionsByRoleId(String roleId) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.queryPermissionsByRoleId(roleId);
	}

	public List<Permission> list(PermissionQueryParam param) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.listAll(param);
	}

	public int save(Permission param) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.save(param);
	}

	public int update(Permission param) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.update(param);
	}

	public int delete(Permission param) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.delete(param);
	}

	public Permission getData(Permission param) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.getData(param);
	}

	public List<Permission> list(Page<PermissionQueryParam> param) {
		PermissionMapper mapper = getMapper(PermissionMapper.class);
		return mapper.list(param);
	}

}
