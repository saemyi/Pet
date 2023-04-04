package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Meeting;

public interface MeetingService {
	int getLastMeetingId();
	List<Meeting> getAllMeetings();
	List<Meeting> getMeetingsByAddress(String sidoId, String sigunguId, String dongId);
	List<Meeting> getMeetingsByParticipant(String userId);
	List<Meeting> getMeetingsByCreator(String userId);
	Meeting getMeeting(int meetingId);
	void addMeeting(String meetingTitle, String meetingContent, 
			LocalDateTime meetingTime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId);
	void fixMeeting(Meeting meeting);
	void delMeeting(int meetingId);
	void addParticipation(int meetingId, String userId);
	void fixApplicantNumber(int meetingId, int applicantNumber);
	void delParticipation(int meetingId, String userId);
}
