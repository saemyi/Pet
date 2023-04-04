package com.my.pet.service;

import java.time.LocalDate;

import com.my.pet.domain.UserDto;

public interface UserService {
	int duplicateCheckUserId(String userId);
	int duplicateCheckNickname(String nickname);
	UserDto loginUser(String userId, String pw); 
	int joinUser(String userId, String userName, String profileImageFileName,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname);
} 