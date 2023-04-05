package com.my.pet.dao;

import java.util.List;

import com.my.pet.domain.Report;

public interface ReportDao {
	List<Report> selectReport();
	void insertReport(String targetId, String reason, String reportContent);
	Report selectDetailReport(int reportId);

}
