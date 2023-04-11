package com.my.pet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Meeting;
import com.my.pet.domain.Pet;
import com.my.pet.domain.User;
import com.my.pet.service.MeetingService;
import com.my.pet.service.PetService;
import com.my.pet.service.UserService;

@RestController
@RequestMapping("admin")
public class AdminUserController {
   @Autowired private UserService userService;
   @Autowired private PetService petService;
   @Autowired private MeetingService meetingService;
   
   @GetMapping
   public ModelAndView main(ModelAndView mv) {
      mv.setViewName("admin/main");
      return mv;
   }
   
   @GetMapping("user/get")
   public List<User> getUsers() {
      return userService.admingetUsers();
   }
   
   @GetMapping("adminUserView/{userId}")
   public ModelAndView getUser(@PathVariable("userId") String userId, ModelAndView mv) {
      User user = userService.adminGetUser(userId);
      mv.addObject(user);
      mv.setViewName("admin/user/adminUserView");
      return mv;
   }
   
   @GetMapping("pet/get/{userId}")
   public List<Pet> getPets(@PathVariable("userId") String userId) {
	   return petService.getPets(userId);
   }
   
   @GetMapping("meeting/get/{userId}")
   public List<Meeting> getMeetings(@PathVariable("userId") String userId) {
	   return meetingService.getMeetingsByParticipant(userId);
   }
   
   @GetMapping("user/count")
   public int userCount() {
	   return userService.userCount();
   }
   
   @GetMapping("user/search")
   public List<User> search( User user) {
	   return userService.search(user);
   }
   
   @PutMapping("changeAdmin")
   public void changeAdmin(@RequestBody User user) {
	   userService.changeAdmin(user);
   }
   
   @PutMapping("benUser")
   public void benUser(@RequestBody User user) {
	   userService.benUser(user);
   }
   
   @PutMapping("userNameFix")
   public void FixuserName(@RequestBody User user) {
	   userService.fixUserName(user);
   }
}