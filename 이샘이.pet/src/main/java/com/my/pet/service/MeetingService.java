package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Meeting;

public interface MeetingService {
	int getLastMeetingId();
	List<Meeting> getMeetings(String sidoId, String sigunguId, String dongId, String userId);
	Meeting getMeetingByIdAndParticipant(int meetingId, String userId);
	List<Meeting> getMeetingsByParticipant(String userId);
	Meeting getMeeting(int meetingId);
	void addMeeting(String meetingTitle, String meetingContent, 
			LocalDateTime meetingTime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId);
	void fixMeeting(Meeting meeting);
	void delMeeting(int meetingId);
	List<Meeting> findMeetings(String meetingTitle, LocalDateTime meetingTime, String userId);
}