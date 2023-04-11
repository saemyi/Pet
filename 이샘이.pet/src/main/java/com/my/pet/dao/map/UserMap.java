package com.my.pet.dao.map;

import java.time.LocalDate;
import java.util.List;

import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;

public interface UserMap {
	int selectUserId(String userId);
	int selectNickname(String nickname);
	UserDto selectUser(String userId, String pw);
	int insertUser(String userId, String userName, String profileImageFilename,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname);
	int updateUser(User user);
	int deleteUser(String userId);
	List<User> adminselectUsers();
	User adminSelectUser(String userId);
	int userCount();
	List<User> search(User user);
	int changeAdmin(User user);
	int benUser(User user);
	int updateUserName(User user);
} 
