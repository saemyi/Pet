package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Meeting;

public interface MeetingDao {
	List<Meeting> selectAllMeetings();
	List<Meeting> selectMeetingsByAddress(String sidoId, String sigunguId, String dongId);
	List<Meeting> selectMeetingsByParticipant(String userId);
	List<Meeting> selectMeetingsByCreator(String userId);
	Meeting selectMeeting(int meetingId);
	void insertMeeting(String title, String meetingContent, 
			LocalDateTime datetime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId);
	void updateMeeting(Meeting meeting);
	void deleteMeeting(int meetingId);
	void insertParticipation(int meetingId, String userId);
	void updateApplicantNumber(int meetingId, int applicantNumber);
	void deleteParticipation(int meetingId, String userId);
}
