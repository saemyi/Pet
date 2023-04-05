package com.my.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.ReportDao;
import com.my.pet.domain.Report;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired private ReportDao reportDao;
	
	@Override
	public List<Report> getReports(){
		return reportDao.selectReport();
	}
	
	@Override
	public void addReport(String targetId, String reason, String reportContent) {
		reportDao.insertReport(targetId, reason, reportContent);
	}
	
	@Override
	public Report getDetailReport(int reportId) {
		return reportDao.selectDetailReport(reportId);
	}
}
