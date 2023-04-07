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
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Pet;
import com.my.pet.domain.PetDto;
import com.my.pet.service.PetService;

@RestController
@RequestMapping("pet")
public class PetController {
	@Autowired private PetService petService;
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("petJoin")
	public ModelAndView joinIn(ModelAndView mv) {
		mv.setViewName("pet/petJoin");
		return mv;
	}
	
	@PostMapping("petJoin")
	public ModelAndView joinPet(ModelAndView mv,  PetDto petDto, Pet pet) {
		String filename = petDto.getPetProfile().getOriginalFilename();
		saveFile(attachPath + "/" + filename,  petDto.getPetProfile());
		pet.setPetProfileImageFilename(filename);
		petService.addPet(petDto.getPetName(), filename, petDto.getPetIntro(), petDto.getUserId());
		mv.setViewName("redirect:/login");
		return mv;
	}
	
	private void saveFile(String filename, MultipartFile file) { 
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
}
