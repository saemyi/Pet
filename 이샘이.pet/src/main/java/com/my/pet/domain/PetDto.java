package com.my.pet.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PetDto {
	private int petId;
	private String petName;
	private String petIntro;
	private MultipartFile petProfile;
	private String userId;	
}
