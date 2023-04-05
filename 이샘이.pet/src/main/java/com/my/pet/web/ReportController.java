package com.my.pet.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Report;
import com.my.pet.service.ReportService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	public void addReport(String targetId, String reason, String reportContent) {
		reportService.addReport(targetId, reason, reportContent);
	}
	
	@GetMapping("main")
	public ModelAndView logout(ModelAndView mv) {
		mv.setViewName("/");
		return mv;
	}
}
 