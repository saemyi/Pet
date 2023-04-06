package com.my.pet.web;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.service.PetService;

@RestController
@RequestMapping("pet")
public class PetController {
	@Autowired private PetService petService;
	@Value("${attachPath}") private String attachPath;
	
	@PostMapping("join")
	public ModelAndView joinPet(ModelAndView mv) {
		mv.setViewName("main");
		return mv;
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
	
	//펫추가
	@PostMapping("add")
	public void addPet(String petName, MultipartFile file,
			String petIntro, String userId) {
		String filename = null;
		if(file != null) {
			filename = file.getOriginalFilename();
			saveFile(attachPath + "/" + filename, file);
		}
		petService.addPet(petName, filename, petIntro, userId);
	}
}
