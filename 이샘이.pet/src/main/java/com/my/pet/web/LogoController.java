package com.my.pet.web;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.my.pet.domain.Logo;
import com.my.pet.domain.LogoDto;
import com.my.pet.service.LogoService;

@RestController
@RequestMapping("logo")
public class LogoController {
	@Autowired private LogoService logoService;
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("get")
	public Logo getLogo() {
		return logoService.getLogo();
	}
	
	@PostMapping("add")
	public void addLogo(Logo logo, LogoDto logoDto) {
		String filename = logoDto.getFile().getOriginalFilename();
		saveFile(attachPath + "/" + filename, logoDto.getFile()); 
		logo.setImageFilename(filename);
		logoService.addLogo(filename); 
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
}