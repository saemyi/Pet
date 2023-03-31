package com.my.pet.dao.map;

import com.my.pet.domain.UserDto;

public interface UserMap {
	UserDto selectUser(String userId, String pw);
}
