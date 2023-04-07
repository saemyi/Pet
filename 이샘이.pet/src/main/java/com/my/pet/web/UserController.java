package com.my.pet.web;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Report;
import com.my.pet.domain.User;
import com.my.pet.domain.UserDto;
import com.my.pet.service.ReportService;
import com.my.pet.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/")
public class UserController {
	@Autowired private UserService userService;
	@Autowired private ReportService reportService;
	@Value("${attachPath}") private String attachPath;
	
	//메인화면
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("main");
		return mv;
	}
	
	//쿠기가 있으면, 아이디를 폼에 입력한다.
	@GetMapping("login")
	public ModelAndView loginIn(ModelAndView mv, @CookieValue(required=false) String userId, @ModelAttribute("user") User user) {
		user.setUserId(userId);
		mv.setViewName("user/login");
		return mv;
	} 
	
	//로그인 시도
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
				//이용정지 당한 유저 report
				if(userData.getIsSuspended() == 1) {
					Report report = reportService.getSuspended(user.getUserId());
					mv.addObject("report", report);
					mv.setViewName("report/suspended");
					return mv;					
				}
				
				mv.setViewName("main");
				return mv;
			} else {
			request.setAttribute("errMsg", "아이디 또는 비밀번호를 확인해주세요.");
			mv.setViewName("user/login");
			return mv;
		}
	}
	
	//로그아웃
	@GetMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		
		mv.setViewName("main");
		return mv;
	}
	
	//회원가입화면
	@GetMapping("join")
	public ModelAndView joinIn(ModelAndView mv) {
		mv.setViewName("user/userJoin");
		return mv;
	}
	
	@PostMapping("join")
	public ModelAndView joinUser(ModelAndView mv, UserDto userDto, User user) {
		String filename = userDto.getUserProfile().getOriginalFilename();
		saveFile(attachPath + "/" + filename, userDto.getUserProfile());
		user.setProfileImageFilename(filename);
		mv.addObject("user", user);
		mv.setViewName("pet/petJoin");
		return mv;
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
	
	//아이디 중복체크
	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {
		int cnt = userService.duplicateCheckUserId(userId);
		return cnt;
	}
	
	//닉네임 중복체크
	@PostMapping("nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		int cnt = userService.duplicateCheckNickname(nickname);
		return cnt;
	}
	
	//회원추가
	@PostMapping("add")
	public void addUser(String userId, String userName, String profileImageFilename,
			 String phone, String email, String address, String detailedAddress,
			 @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate birthdate, String pw, String nickname) {
		System.out.println(userId + userName + profileImageFilename + phone + email + address + detailedAddress + birthdate + pw + nickname);
		userService.joinUser(userId, userName, profileImageFilename, phone, email, address, detailedAddress, birthdate, pw, nickname);
	}
}