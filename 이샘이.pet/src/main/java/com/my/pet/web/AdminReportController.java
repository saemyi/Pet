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

import com.my.pet.domain.Report;
import com.my.pet.domain.User;
import com.my.pet.service.ReportService;

@RestController
@RequestMapping("admin/report")
public class AdminReportController {
	@Autowired private ReportService reportService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("admin/report/adminReportList");
		return mv;
	}
	
	@GetMapping("get")
	public List<Report> selectReport() {
		return reportService.getReports();
	}
	
	@GetMapping("adminReportView/{reportId}")
	public ModelAndView getReport(@PathVariable int reportId, ModelAndView mv) {
		Report report = reportService.getDetailReport(reportId);
		mv.addObject("report", report);
		mv.setViewName("admin/report/adminReportView");
		return mv;
	}
	
	@GetMapping("search")
	public List<Report> search(Report report) {
		return reportService.search(report);
	}
	
	@PutMapping("changeProcessed")
	public void chachangeProcessed(@RequestBody Report report) {
		reportService.changeProcessed(report);
	}
}