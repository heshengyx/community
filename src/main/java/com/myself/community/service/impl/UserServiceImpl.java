package com.myself.community.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.myself.community.entity.Permission;
import com.myself.community.entity.Role;
import com.myself.community.entity.User;
import com.myself.community.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	public User getByUserName(String userName) {
		User user = new User();
		user.setUserName(userName);
		user.setPassword("123456");
		user.setNickName("jack");
		
		List<Role> roles = new ArrayList<Role>();
		Role role = new Role();
		role.setName("admin");
		
		List<Permission> permissions = new ArrayList<Permission>();
		Permission permission = new Permission();
		permission.setUrl("admin:user");
		permissions.add(permission);
		role.setPermissions(permissions);
		roles.add(role);
		user.setRoles(roles);
		return user;
	}

}
