package com.myself.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myself.community.dao.UserDao;
import com.myself.community.entity.User;
import com.myself.community.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public int save(User user) {
		return userDao.save(user);
	}

	public User getUserByAccount(String account) {
		return null;
	}

}
