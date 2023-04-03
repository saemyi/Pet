package com.my.pet.service;

import com.my.pet.domain.UserDto;

public interface UserService {
	UserDto loginUser(String userId, String pw);
}