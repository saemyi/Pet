package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Meeting;
import com.my.pet.domain.Participant;

public interface MeetingDao {
	int selectLastMeetingId();
	List<Meeting> selectMeetings(String sidoId, String sigunguId, String dongId, String userId);
	Meeting selectMeetingByIdAndParticipant(int meetingId, String userId);
	List<Meeting> selectMeetingsByParticipant(String userId);
	Meeting selectMeeting(int meetingId);
	void insertMeeting(String meetingTitle, String meetingContent, 
			LocalDateTime meetingTime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId);
	void updateMeeting(Meeting meeting);
	void deleteMeeting(int meetingId);
	Participant selectMeetingCreator(int meetingId);
	List<Participant> selectParticipants(int meetingId);
	void insertParticipant(int meetingId, String userId);
	void updateApplicantNumber(int meetingId, int applicantNumber);
	void deleteParticipant(int meetingId, String userId);
}
