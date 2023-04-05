package com.my.pet.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.ReportMap;
import com.my.pet.domain.Report;

@Repository
public class ReportDaoImpl implements ReportDao{
	@Autowired private ReportMap reportMap;
	
	@Override
	public List<Report> selectReport(){
		return reportMap.selectReport();
	}
	
	@Override
	public void insertReport(String targetId, String reason, String reportContent) {
		reportMap.insertReport(targetId, reason, reportContent);
	}
	
	@Override
	public Report selectDetailReport(int reportId) {
		return reportMap.selectDetailReport(reportId);
	}
}
