package com.my.pet.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Pet;
import com.my.pet.domain.PetDto;
import com.my.pet.service.PetService;

import jakarta.servlet.http.HttpSession;

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
	public ModelAndView joinPet(ModelAndView mv, Pet pet, PetDto petDto) {
		String filename = petDto.getPetProfile().getOriginalFilename();
		saveFile(attachPath + "/" + filename,  petDto.getPetProfile());
		pet.setPetProfileImageFilename(filename);
		petService.addPet(petDto.getPetName(), filename, petDto.getPetIntro(), petDto.getUserId());
		mv.setViewName("redirect:/login");
		return mv;
	}
	
	@PostMapping("add")
	public void addPet(Pet pet, PetDto petDto, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		String filename = petDto.getPetProfile().getOriginalFilename();
		saveFile(attachPath + "/" + filename,  petDto.getPetProfile());
		pet.setPetProfileImageFilename(filename);
		petService.addPet(petDto.getPetName(), filename, petDto.getPetIntro(), userId);
	}
	
	private void saveFile(String filename, MultipartFile file) { 
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
	
	@GetMapping("get")
	public List<Pet> getPets(HttpSession session) { 
		String userId = (String)session.getAttribute("userId");
		return petService.getPets(userId); 
	}
	
	@PostMapping("getPets/{userId}")
	public List<Pet> getPets(@PathVariable("userId") String userId) {
		return petService.getPets(userId);
	}
	
	//펫삭제
	@DeleteMapping("del/{petId}")
	public void delPet(@PathVariable("petId") int petId) {
	   petService.delPet(petId);
	}
	
	@GetMapping("manage")
	public ModelAndView petManage(ModelAndView mv) {
		mv.setViewName("pet/petManage");	
		return mv;
	}
	
	//펫수정
	@PutMapping("fix")
	public void fixPet(PetDto petDto, Pet pet, HttpSession session) {
	   if(petDto.getPetProfile() == null) {
		   String filename = pet.getPetProfileImageFilename();
	   } else {
		   String filename = petDto.getPetProfile().getOriginalFilename();
		   saveFile(attachPath + "/" + filename, petDto.getPetProfile());
		   pet.setPetProfileImageFilename(filename);
	   }
	   String userId = (String)session.getAttribute("userId");
	   pet.setUserId(userId);
	      petService.fixPet(pet);
	}
}