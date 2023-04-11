package com.my.pet.dao.map;

import java.util.List;

import com.my.pet.domain.Pet;

public interface PetMap {
	int insertPet(String petName, String petProfileImageFilename,
			String petIntro, String userId);
	List<Pet> selectPets(String userId);
}