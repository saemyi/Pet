package com.my.pet.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.PetMap;
import com.my.pet.domain.Pet;

@Repository
public class PetDaoImpl implements PetDao {
	@Autowired private PetMap petMap;
	
	@Override
	public int insertPet(String petName, String petProfileImageFilename,
			String petIntro, String userId) {
		return petMap.insertPet(petName, petProfileImageFilename, petIntro, userId);
	}
	
	@Override
	public List<Pet> selectPets(String userId) {
		return petMap.selectPets(userId);
	}
	
	@Override
	public int deletePet(int petId) {
	   return petMap.deletePet(petId);
	}
	
	@Override
	public int updatePet(Pet pet) {
		return petMap.updatePet(pet);
	}
}