package com.my.pet.domain;

import lombok.Data;

@Data
public class Pet {
	private int petId;
	private String petName;
	private String petIntro;
	private String petProfileImageFilename;
	private String userId;	
}
