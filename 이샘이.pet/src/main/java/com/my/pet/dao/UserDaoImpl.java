package com.my.pet.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.UserMap;
import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMap userMap;
	
	@Override
	public List<User> selectUsers() {
		return userMap.selectUsers();
	}
	@Override
	public UserDto selectUser(String userId, String pw) {
		return userMap.selectUser(userId, pw);
	} 
	
	@Override
	public UserDto insertUser(String userId, String userName, String profileImageFileName,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname) {
		return userMap.insertUser(userId, userName, profileImageFileName, phone, email, 
				address, detailedAddress, birthdate, pw, nickname);
	}
	
	@Override
	public UserDto updateUser(User user) {
		return userMap.updateUser(user);
	}
	
	@Override
	public UserDto deleteUser(String userId) {
		return userMap.deleteUser(userId);
	}
}