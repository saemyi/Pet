package com.my.pet.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;
import com.my.pet.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/")
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("main");
		return mv;
	}
	@GetMapping("login")
	public ModelAndView loginIn(ModelAndView mv, @CookieValue(required=false) String userId, @ModelAttribute("user") User user) {
		user.setUserId(userId);
		mv.setViewName("user/login");
		return mv;
	} 
	
	@PostMapping("login")
	public ModelAndView login(ModelAndView mv, @ModelAttribute("user") UserDto user, String rememberMe,
			HttpSession session, HttpServletResponse response, HttpServletRequest request) {
			
			UserDto userData = userService.loginUser(user.getUserId(), user.getPw());
			
			if(userData != null) {
			session.setAttribute("userId", user.getUserId());

			if(rememberMe != null && rememberMe.equals("on")) {
				Cookie cookie = new Cookie("userId", user.getUserId());
				cookie.setMaxAge(10);
				response.addCookie(cookie);
			}
			mv.setViewName("main");
			return mv;
			
			} else {
			request.setAttribute("errMsg", "아이디 또는 비밀번호를 확인해주세요.");
			mv.setViewName("user/login");
			return mv;
		}
	}
	
	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		
		mv.setViewName("main");
		return mv;
	}
	
	@GetMapping("join")
	public String joinIn() {
		return "user/join";
	}
	
	@PostMapping("join")
	public String join() {
		
	}
	
	@GetMapping("petJoin")
	public String petJoinIn() {
		return "pet/join";
	}
}