package com.my.pet.dao.map;

import com.my.pet.domain.Logo;

public interface LogoMap {
	Logo selectLogo();
	int insertLogo(String imageFilename);
}