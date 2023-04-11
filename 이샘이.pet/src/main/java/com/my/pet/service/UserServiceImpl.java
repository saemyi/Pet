package com.my.pet.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.UserDao;
import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	@Override
	public int duplicateCheckUserId(String userId) {
		int cnt =  userDao.selectUserId(userId);
		System.out.println("userId cnt: " + cnt);
		return cnt;
	}
	
	@Override
	public UserDto getMypage(String userId) {
		return userDao.selectUser(userId, null);
	}
	
	@Override
	public int duplicateCheckNickname(String nickname) {
		int cnt = userDao.selectNickname(nickname);
		System.out.println("nickname cnt: " + cnt);
		return cnt;
	}
	
	@Override
	public UserDto loginUser(String userId, String pw) {
		return userDao.selectUser(userId, pw); 
	}

	@Override
	public int joinUser(String userId, String userName, String profileImageFileName,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname) {
		return userDao.insertUser(userId, userName, profileImageFileName, phone, email, 
				address, detailedAddress, birthdate, pw, nickname);
	}
	
	@Override
	   public List<User> admingetUsers() {
	      return userDao.adminselectUsers();
   }
	   
   @Override
   public User adminGetUser(String userId) {
      return userDao.adminSelectUser(userId);
   }
} 
