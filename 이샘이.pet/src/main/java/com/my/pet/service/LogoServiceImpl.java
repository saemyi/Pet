package com.my.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.LogoDao;
import com.my.pet.domain.Logo;

@Service
public class LogoServiceImpl implements LogoService{
	@Autowired private LogoDao logoDao;
	
	@Override
	public Logo getLogo() {
		return logoDao.selectLogo();
	}
	
	@Override
	public void addLogo(String imageFilename) {
		logoDao.insertLogo(imageFilename);
	}
}
