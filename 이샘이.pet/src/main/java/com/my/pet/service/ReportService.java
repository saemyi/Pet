package com.my.pet.service;

import java.util.List;

import com.my.pet.domain.Report;

public interface ReportService {
	List<Report> getReports();
	void addReport(String nickName, String reason, String reportContent);
	Report getDetailReport(int reportId);
	Report getSuspended(String loginId);
	List<Report> search(Report report);
}
