package com.my.pet.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Alarm {
	private int alarmId;
	private LocalDate alaramTime;
	private String alarmContent;
	private String userId;
	private int CommentId;
	private int replyId;
	private int meetingId;
}