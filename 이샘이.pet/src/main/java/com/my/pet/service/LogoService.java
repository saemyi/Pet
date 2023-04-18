package com.my.pet.service;

import com.my.pet.domain.Logo;

public interface LogoService {
	Logo getLogo();
	void addLogo(String imageFilename);
}