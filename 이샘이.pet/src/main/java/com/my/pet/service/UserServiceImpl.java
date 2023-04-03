package com.my.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.UserDao;
import com.my.pet.domain.UserDto;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	@Override
	public UserDto loginUser(String userId, String pw) {
		return userDao.selectUser(userId, pw); 
	}
} 
