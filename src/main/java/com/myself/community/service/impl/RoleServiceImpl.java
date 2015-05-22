package com.myself.community.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myself.common.utils.UIDGeneratorUtil;
import com.myself.community.dao.RoleDao;
import com.myself.community.entity.Role;
import com.myself.community.page.Page;
import com.myself.community.param.RoleQueryParam;
import com.myself.community.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	
	public List<Role> queryRolesByUserId(String userId) {
		return roleDao.queryRolesByUserId(userId);
	}

	public int save(Role param) {
		param.setId(UIDGeneratorUtil.getUID());
		param.setStatus("1");
		param.setCreateTime(new Date());
		return roleDao.save(param);
	}

	public int update(Role param) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Role param) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Role getData(Role param) {
		return roleDao.getData(param);
	}

	public List<Role> list(Page<RoleQueryParam> param) {
		return roleDao.list(param);
	}

}
