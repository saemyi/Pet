package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.MeetingMap;
import com.my.pet.domain.Meeting;
import com.my.pet.domain.Participant;

@Repository
public class MeetingDaoImpl implements MeetingDao {
	@Autowired private MeetingMap meetingMap;
	
	@Override
	public int selectLastMeetingId() {
		return meetingMap.selectLastMeetingId();
	}
	
	@Override
	public List<Meeting> selectMeetings(String sidoId, String sigunguId, String dongId, String userId) {
		return meetingMap.selectMeetings(sidoId, sigunguId, dongId, userId);
	}
	
	@Override
	public Meeting selectMeetingByIdAndParticipant(int meetingId, String userId) {
		return meetingMap.selectMeetingByIdAndParticipant(meetingId, userId);
	}

	@Override
	public List<Meeting> selectMeetingsByParticipant(String userId) {
		return meetingMap.selectMeetingsByParticipant(userId);
	}
	
	@Override
	public Meeting selectMeeting(int meetingId) {
		return meetingMap.selectMeeting(meetingId);
	}
	
	@Override
	public void insertMeeting(String meetingTitle, String meetingContent, 
			LocalDateTime meetingTime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId) {
		meetingMap.insertMeeting(meetingTitle, meetingContent, meetingTime, recruitmentNumber, 
				applicantNumber, userId, sidoId, sigunguId, dongId);
	}
	
	@Override
	public void updateMeeting(Meeting meeting) {
		meetingMap.updateMeeting(meeting);
	}
	
	@Override
	public void deleteMeeting(int meetingId) {
		meetingMap.deleteMeeting(meetingId);
	}
	
	@Override
	
	public Participant selectMeetingCreator(int meetingId) {
		return meetingMap.selectMeetingCreator(meetingId);
	}
	
	@Override
	public List<Participant> selectParticipants(int meetingId) {
		return meetingMap.selectParticipants(meetingId);
	}
	
	@Override
	public void insertParticipant(int meetingId, String userId) {
		meetingMap.insertParticipant(meetingId, userId);
	}
	
	@Override
	public void updateApplicantNumber(int meetingId, int applicantNumber) {
		meetingMap.updateApplicantNumber(meetingId, applicantNumber);
	}
	
	@Override
	public void deleteParticipant(int meetingId, String userId) {
		meetingMap.deleteParticipant(meetingId, userId);
	}
}
