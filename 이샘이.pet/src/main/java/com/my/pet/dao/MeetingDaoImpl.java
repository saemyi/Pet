package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.MeetingMap;
import com.my.pet.domain.Meeting;

@Repository
public class MeetingDaoImpl implements MeetingDao {
	@Autowired private MeetingMap meetingMap;
	
	@Override
	public int selectLastMeetingId() {
		return meetingMap.selectLastMeetingId();
	}
	
	@Override
	public List<Meeting> selectAllMeetings() {
		return meetingMap.selectAllMeetings();
	}
	
	@Override
	public List<Meeting> selectMeetingsByAddress(String sidoId, String sigunguId, String dongId) {
		return meetingMap.selectMeetingsByAddress(sidoId, sigunguId, dongId);
	}
	
	@Override
	public List<Meeting> selectMeetingsByParticipant(String userId) {
		return meetingMap.selectMeetingsByParticipant(userId);
	}
	
	@Override
	public List<Meeting> selectMeetingsByCreator(String userId) {
		return meetingMap.selectMeetingsByCreator(userId);
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
	public void insertParticipation(int meetingId, String userId) {
		meetingMap.insertParticipation(meetingId, userId);
	}
	
	@Override
	public void updateApplicantNumber(int meetingId, int applicantNumber) {
		meetingMap.updateApplicantNumber(meetingId, applicantNumber);
	}
	
	@Override
	public void deleteParticipation(int meetingId, String userId) {
		meetingMap.deleteParticipation(meetingId, userId);
	}
}
