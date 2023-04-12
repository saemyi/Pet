package com.my.pet.dao;

import java.util.List;

import com.my.pet.domain.Report;

public interface ReportDao {
	List<Report> selectReport();
	void insertReport(String nickName, String reason, String reportContent);
	Report selectDetailReport(int reportId);
	Report selectSuspended(String loginId);
	List<Report> search(Report report);
	void changeProcessed(Report report);
}