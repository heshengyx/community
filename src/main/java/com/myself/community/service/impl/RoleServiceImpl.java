package com.myself.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myself.community.dao.RoleDao;
import com.myself.community.entity.Role;
import com.myself.community.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	
	public List<Role> queryRolesByUserId(String userId) {
		return roleDao.queryRolesByUserId(userId);
	}

}
