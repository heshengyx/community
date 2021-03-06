package com.myself.community.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myself.community.dao.BaseDao;
import com.myself.community.dao.UserDao;
import com.myself.community.entity.User;
import com.myself.community.mapper.UserMapper;

@Repository
public class UserDaoImpl extends BaseDao<UserMapper> implements UserDao {

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	public int save(User user) {
		UserMapper mapper = getMapper(UserMapper.class);
		int count = 0;
		try {
			count = mapper.save(user);
		} catch (Exception e) {
		}
		return count;
	}

	public User getUserByAccount(String account) {
		UserMapper mapper = getMapper(UserMapper.class);
		return mapper.getUserByAccount(account);
	}

}
