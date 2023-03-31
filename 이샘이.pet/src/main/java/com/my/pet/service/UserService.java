package com.my.pet.service;

import com.my.pet.domain.UserDto;

public interface UserService {
	UserDto getUser(String userId, String pw);
}