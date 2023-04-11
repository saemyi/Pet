package com.my.pet.dao;

import java.util.List;

import com.my.pet.domain.Pet;

public interface PetDao {
	int insertPet(String petName, String petProfileImageFilename,
			String petIntro, String userId);
	List<Pet> selectPets(String userId);
}
