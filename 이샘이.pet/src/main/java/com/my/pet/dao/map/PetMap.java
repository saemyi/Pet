package com.my.pet.dao.map;

public interface PetMap {
	int insertPet(String petName, String petProfileImageFilename,
			String petIntro, String userId);
}