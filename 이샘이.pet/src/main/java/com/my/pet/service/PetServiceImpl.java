package com.my.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.PetDao;

@Service
public class PetServiceImpl implements PetService {
	@Autowired private PetDao petDao;
	
	@Override
	public int addPet(String petName, String petProfileImageFilename,
			String petIntro, String userId) {
		return petDao.insertPet(petName, petProfileImageFilename, petIntro, userId);
	}
}
