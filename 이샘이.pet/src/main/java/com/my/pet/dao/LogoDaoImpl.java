package com.my.pet.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.LogoMap;
import com.my.pet.domain.Logo;

@Repository
public class LogoDaoImpl implements LogoDao{
	@Autowired private LogoMap logoMap;
	
	@Override
	public Logo selectLogo() {
		return logoMap.selectLogo();
	}
	
	@Override
	public void insertLogo(String imageFilename) {
		logoMap.insertLogo(imageFilename);
	}
}