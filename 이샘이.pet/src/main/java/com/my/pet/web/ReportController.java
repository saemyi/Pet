package com.my.pet.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.my.pet.service.ReportService;

@RestController
@RequestMapping("report")
public class ReportController {
	@Autowired private ReportService reportService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("report/reportAdd");
		return mv;
	}
	
	@PostMapping("add")
	public void addReport(String nickName, String reason, String reportContent, String userId) {
		reportService.addReport(nickName, reason, reportContent, userId);
	}
	
	@GetMapping("main")
	public ModelAndView logout(ModelAndView mv) {
		mv.setViewName("/");
		return mv;
	}
}