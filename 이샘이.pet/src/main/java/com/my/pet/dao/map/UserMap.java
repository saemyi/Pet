package com.my.pet.dao.map;

import java.time.LocalDate;
import java.util.List;

import com.my.pet.domain.User;

public interface UserMap {
	List<User> adminselectUsers();
	List<User> search(User user);
	User selectUser(String userId, String pw);
	User findUserId(String userName, String phone);
	User adminSelectUser(String userId);
	int selectUserId(String userId);
	int selectNickname(String nickname);
	int insertUser(String userId, String userName, String profileImageFilename,
			 String phone, String email, String address, String detailedAddress,
			 LocalDate birthdate, String pw, String nickname);
	int updateUser(User user);
	int deleteUser(String userId);
	int userCount();
	int changeAdmin(User user);
	int benUser(User user);
	int updateUserName(User user);
}  