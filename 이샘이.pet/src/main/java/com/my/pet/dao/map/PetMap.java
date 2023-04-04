package com.my.pet.dao.map;

public interface PetMap {
	int insertPet(int petId, String petName, String petProfileImageFilename,
			String petIntro, String userId);
}