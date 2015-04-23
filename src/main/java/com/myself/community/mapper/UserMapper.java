package com.myself.community.mapper;

import com.myself.community.entity.User;

public interface UserMapper {

	int save(User user);
	User getUserByAccount(String account);
}
