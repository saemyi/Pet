package com.my.pet.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Report;

public interface ReportMap {
	List<Report> selectReport();
	int insertReport(@Param("targetId")String targetId, @Param("reason")String reason, @Param("reportContent")String reportContent);
	Report selectDetailReport(int reportId);

}
