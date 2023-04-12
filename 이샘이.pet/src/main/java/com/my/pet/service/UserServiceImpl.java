package com.my.pet.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.UserDao;
import com.my.pet.domain.User;

@Service
public class UserServiceImpl implements UserService{
   @Autowired private UserDao userDao;
   
   @Override
   public int duplicateCheckUserId(String userId) {
      int cnt =  userDao.selectUserId(userId);
      return cnt;
   }
   
   @Override
   public int duplicateCheckNickname(String nickname) {
      int cnt = userDao.selectNickname(nickname);
      return cnt;
   }
   
   @Override
   public User getMypage(String userId) {
	   return userDao.selectUser(userId, null);
   }
   
   @Override
   public User loginUser(String userId, String pw) {
      return userDao.selectUser(userId, pw); 
   }
   
   @Override
   public User searchUserId(String phone, String userName) {
      return userDao.findUserId(phone, userName); 
   }

   @Override
   public int joinUser(String userId, String userName, String profileImageFileName,
          String phone, String email, String address, String detailedAddress,
          LocalDate birthdate, String pw, String nickname) {
      return userDao.insertUser(userId, userName, profileImageFileName, phone, email, 
            address, detailedAddress, birthdate, pw, nickname);
   }
   
   @Override
      public List<User> admingetUsers() {
         return userDao.adminselectUsers();
   }
      
   @Override
   public User adminGetUser(String userId) {
      return userDao.adminSelectUser(userId);
   }
   
   @Override
   public int userCount() {
      return userDao.userCount();
   }
   
   @Override
   public List<User> search(User user) {
      return userDao.search(user);
   }
   
   @Override
   public void changeAdmin(User user) {
      userDao.changeAdmin(user);
   }
   
   @Override
   public void benUser(User user) {
      userDao.benUser(user);
   }
   
   @Override
   public void fixUserName(User user) {
      userDao.updateUserName(user);
   }
} 