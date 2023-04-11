package com.my.pet.service;

import java.util.List;

import com.my.pet.domain.Pet;

public interface PetService {
	int addPet(String petName, String petProfileImageFilename,
			String petIntro, String userId);
	List<Pet> getPets(String userId);
}
