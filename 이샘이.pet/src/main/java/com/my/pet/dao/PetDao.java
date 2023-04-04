package com.my.pet.dao;

public interface PetDao {
	int insertPet(int petId, String petName, String petProfileImageFilename,
			String petIntro, String userId);
}
