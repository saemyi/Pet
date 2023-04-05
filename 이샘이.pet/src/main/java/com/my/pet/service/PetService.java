package com.my.pet.service;

public interface PetService {
	int addPet(int petId, String petName, String petProfileImageFilename,
			String petIntro, String userId);
}
