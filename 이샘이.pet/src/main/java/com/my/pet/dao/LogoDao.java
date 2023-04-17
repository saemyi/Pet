package com.my.pet.dao;

import com.my.pet.domain.Logo;

public interface LogoDao {
	Logo selectLogo();
	void insertLogo(String imageFilename);
}
