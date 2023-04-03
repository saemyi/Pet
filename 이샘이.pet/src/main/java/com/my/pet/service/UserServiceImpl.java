package com.my.pet.service;

import java.time.LocalDate;

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

	@Override
	public UserDto joinUser(String userId, String userName, String profileImageFileName,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname) {
		return userDao.insertUser(userId, userName, profileImageFileName, phone, email, 
				address, detailedAddress, birthdate, pw, nickname);
	}
} 
