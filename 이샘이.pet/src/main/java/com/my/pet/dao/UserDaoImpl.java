package com.my.pet.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.UserMap;
import com.my.pet.domain.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMap userMap;
	@Override
	public int selectUserId(String userId) {
		return userMap.selectUserId(userId);
	}
	
	@Override
	public User findUserId(String userName, String phone) {
		return userMap.findUserId(userName, phone);
	}
	
	@Override
	public int selectNickname(String nickname) {
		return userMap.selectNickname(nickname);
	}
	
	@Override
	public User selectUser(String userId, String pw) {
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
	public void updateUser(User user) {
		userMap.updateUser(user);
	}
	
	@Override
	public void deleteUser(String userId) {
		userMap.deleteUser(userId);
	} 
	 
	@Override
	   public List<User> adminselectUsers() {
	      return userMap.adminselectUsers();
   }
	   
   @Override
   public User adminSelectUser(String userId) {
      return userMap.adminSelectUser(userId);
   }
   
   @Override
   public int userCount() {
	   return userMap.userCount();
   }
   
   @Override
   public List<User> search(User user) {
	   return userMap.search(user);
   }
   
   @Override
   public void changeAdmin(User user) {
	   userMap.changeAdmin(user);
   }
   
   @Override
   public void benUser(User user) {
	   userMap.benUser(user);
   }
   
   @Override
   public void updateUserName(User user) {
	   userMap.updateUserName(user);
   }
}