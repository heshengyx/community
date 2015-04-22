package com.myself.community.service;

import com.myself.community.entity.User;

public interface UserService {

	int save(User user);
	User getUserByAccount(String account);
}
