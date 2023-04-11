package com.my.pet.service;

import java.time.LocalDate;
import java.util.List;

import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;

public interface UserService {
	int duplicateCheckUserId(String userId);
	int duplicateCheckNickname(String nickname);
	UserDto loginUser(String userId, String pw); 
	UserDto getMypage(String userId);
	int joinUser(String userId, String userName, String profileImageFileName,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname);
	List<User> admingetUsers();
	User adminGetUser(String userId);
	int userCount();
	List<User> search(User user);
	void changeAdmin(User user);
	void benUser(User user);
	void fixUserName(User user);
} 