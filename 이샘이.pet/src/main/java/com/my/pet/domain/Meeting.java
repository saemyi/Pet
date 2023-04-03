package com.my.pet.domain;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Meeting {
	private int meetingId;
	private String title;
	private String meetingContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss", timezone = "Asia/Seoul")
	private LocalDateTime datetime;
	private int recruitmentNumber;
	private int applicantNumber;
	private String userId;
	private String sidoId;
	private String sigunguId;
	private String dongId;
}
