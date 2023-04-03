package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Meeting;

public interface MeetingService {
	List<Meeting> getAllMeetings();
	List<Meeting> getMeetingsByAddress(String sidoId, String sigunguId, String dongId);
	List<Meeting> getMeetingsByParticipant(String userId);
	List<Meeting> getMeetingsByCreator(String userId);
	Meeting getMeeting(int meetingId);
	void addMeeting(String title, String meetingContent, 
			LocalDateTime datetime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId);
	void fixMeeting(Meeting meeting);
	void delMeeting(int meetingId);
	void addParticipation(int meetingId, String userId);
	void fixApplicantNumber(int meetingId, int applicantNumber);
	void delParticipation(int meetingId, String userId);
}
