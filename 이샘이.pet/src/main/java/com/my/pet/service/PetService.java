package com.my.pet.service;

public interface PetService {
	int addPet(String petName, String petProfileImageFilename,
			String petIntro, String userId);
}
