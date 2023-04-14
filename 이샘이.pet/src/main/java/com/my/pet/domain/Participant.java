package com.my.pet.domain;

import lombok.Data;

@Data
public class Participant {
	private String userId;
	private String userIntro;
	private String userProfileImageFilename;
	private String nickname;
}
