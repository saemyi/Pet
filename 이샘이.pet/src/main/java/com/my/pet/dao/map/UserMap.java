package com.my.pet.dao.map;

import java.time.LocalDate;
import java.util.List;

import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;

public interface UserMap {
	List<User> selectUsers();
	UserDto selectUser(String userId, String pw);
	UserDto insertUser(String userId, String userName, String profileImageFileName,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname);
	UserDto updateUser(User user);
	UserDto deleteUser(String userId);
} 
