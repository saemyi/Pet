package com.my.pet.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.PetMap;

@Repository
public class PetDaoImpl implements PetDao {
	@Autowired private PetMap petMap;
	
	@Override
	public int insertPet(int petId, String petName, String petProfileImageFilename,
			String petIntro, String userId) {
		return petMap.insertPet(petId, petName, petProfileImageFilename, petIntro, userId);
	}
}
