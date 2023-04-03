package com.my.pet.service;

import java.time.LocalDate;

import com.my.pet.domain.UserDto;

public interface UserService {
	UserDto loginUser(String userId, String pw); 
	UserDto joinUser(String userId, String userName, String profileImageFileName,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname);
} 