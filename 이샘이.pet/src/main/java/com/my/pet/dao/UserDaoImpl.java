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
	public int selectUserId(String userId) {
		return userMap.selectUserId(userId);
	}
	
	@Override
	public int selectNickname(String nickname) {
		return userMap.selectNickname(nickname);
	}
	
	@Override
	public UserDto selectUser(String userId, String pw) {
		return userMap.selectUser(userId, pw);
	} 
	
	@Override
	public int insertUser(String userId, String userName, String profileImageFilename,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname) {
		return userMap.insertUser(userId, userName, profileImageFilename, phone, email, 
				address, detailedAddress, birthdate, pw, nickname);
	}
	
	@Override
	public int updateUser(User user) {
		return userMap.updateUser(user);
	}
	
	@Override
	public int deleteUser(String userId) {
		return userMap.deleteUser(userId);
	}
}