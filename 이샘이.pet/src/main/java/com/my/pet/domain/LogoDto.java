package com.my.pet.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data 
public class LogoDto {
	private String logoId;
    private MultipartFile file;
}