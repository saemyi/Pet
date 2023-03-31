package com.my.pet.dao;

import com.my.pet.domain.UserDto;

public interface UserDao {
	UserDto selectUser(String userId, String pw);
}