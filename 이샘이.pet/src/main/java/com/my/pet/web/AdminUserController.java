package com.my.pet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.User;
import com.my.pet.service.UserService;

@RestController
@RequestMapping("admin")
public class AdminUserController {
   @Autowired private UserService userService;
   
   @GetMapping
   public ModelAndView main(ModelAndView mv) {
      mv.setViewName("admin/main");
      return mv;
   }
   
   @GetMapping("user/get")
   public List<User> getUsers() {
      return userService.admingetUsers();
   }
   
   @GetMapping("adminUserDetail/{userId}")
   public ModelAndView getUser(@PathVariable("userId") String userId, ModelAndView mv) {
      User user = userService.adminGetUser(userId);
      mv.addObject(user);
      mv.setViewName("admin/user/adminUserDetail");
      return mv;
   }
}