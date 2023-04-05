package com.my.pet.domain;

import lombok.Data;

@Data
public class Report {
	private int reportId;
	private String reason;
	private String reportContent;
	private int isProcessed;
	private String userId;
	private String targetId;
}
