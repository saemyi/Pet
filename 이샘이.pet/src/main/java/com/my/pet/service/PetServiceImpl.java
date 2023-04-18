package com.my.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.PetDao;
import com.my.pet.domain.Pet;

@Service
public class PetServiceImpl implements PetService {
	@Autowired private PetDao petDao;
	
	@Override
	public int addPet(String petName, String petProfileImageFilename,
			String petIntro, String userId) {
		return petDao.insertPet(petName, petProfileImageFilename, petIntro, userId);
	}
	
	@Override
	public List<Pet> getPets(String userId) {
		return petDao.selectPets(userId);
	}
	
	@Override
	public void delPet(int petId) {
	   petDao.deletePet(petId);
	}
	
	@Override
	public void fixPet(Pet pet) {
		petDao.updatePet(pet);
	}
}