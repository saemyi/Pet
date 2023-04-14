package com.my.pet.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.pet.domain.User;

public interface UserDao {
	int selectUserId(String userId);
	int selectNickname(String nickname);
	User selectUser(String userId, String pw);
	User findUserId(String userName, String phone);
	int insertUser(String userId, String userName, String profileImageFilename,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname);
	void updateUser(User user);
	void deleteUser(String userId);
	List<User> adminselectUsers();
	User adminSelectUser(String userId);
	int userCount();
	List<User> search(User user);
	void changeAdmin(User user);
	void benUser(User user);
	void updateUserName(User user);
}  