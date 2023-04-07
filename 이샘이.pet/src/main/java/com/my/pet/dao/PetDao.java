package com.my.pet.dao;

public interface PetDao {
	int insertPet(String petName, String petProfileImageFilename,
			String petIntro, String userId);
}
