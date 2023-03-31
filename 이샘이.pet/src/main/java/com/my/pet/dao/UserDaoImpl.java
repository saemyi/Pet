package com.my.pet.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.UserMap;
import com.my.pet.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMap userMap;
	
	@Override
	public UserDto selectUser(String userId, String pw) {
		return userMap.selectUser(userId, pw);
	}
}