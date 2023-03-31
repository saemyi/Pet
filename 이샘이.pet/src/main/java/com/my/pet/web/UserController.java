package com.my.pet.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;
import com.my.pet.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping
	   public String main() {
	      return "main";
	   }
	
	//쿠기 값이 있으면 userId에 값을 담는다.
	@GetMapping("login")
	public String loginIn(@CookieValue(required=false) String userId, @ModelAttribute("user") User user) {
		user.setUserId(userId);
	return "user/01";
	}
	
	@PostMapping("login")
	public String login(@ModelAttribute("user") UserDto user, String rememberMe,
			HttpSession session, HttpServletResponse response, HttpServletRequest request) {
			
			UserDto userData = userService.getUser(user.getUserId(), user.getPw());
			
			if(userData != null) {
			session.setAttribute("userId", user.getUserId());

			if(rememberMe != null && rememberMe.equals("on")) {
				Cookie cookie = new Cookie("userId", user.getUserId());
				cookie.setMaxAge(10);
				response.addCookie(cookie);
			}
			return "main";
			} else {
			request.setAttribute("errMsg", "아이디 또는 비밀번호를 확인해주세요.");
			return "user/01";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:login";
	}
}