package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.MeetingDao;
import com.my.pet.domain.Meeting;

@Service
public class MeetingServiceImpl implements MeetingService {
	@Autowired private MeetingDao meetingDao;
	
	@Override
	public List<Meeting> getAllMeetings() {
		return meetingDao.selectAllMeetings();
	}
	
	@Override
	public List<Meeting> getMeetingsByAddress(String sidoId, String sigunguId, String dongId) {
		return meetingDao.selectMeetingsByAddress(sidoId, sigunguId, dongId);
	}
	
	@Override
	public List<Meeting> getMeetingsByParticipant(String userId) {
		return meetingDao.selectMeetingsByParticipant(userId);
	}
	
	@Override
	public List<Meeting> getMeetingsByCreator(String userId) {
		return meetingDao.selectMeetingsByCreator(userId);
	}
	
	@Override
	public Meeting getMeeting(int meetingId) {
		return meetingDao.selectMeeting(meetingId);
	}
	
	@Override
	public void addMeeting(String title, String meetingContent, 
			LocalDateTime datetime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId) {
		meetingDao.insertMeeting(title, meetingContent, datetime, recruitmentNumber, 
				applicantNumber, userId, sidoId, sigunguId, dongId);
	}
	
	@Override
	public void fixMeeting(Meeting meeting) {
		meetingDao.updateMeeting(meeting);
	}
	
	@Override
	public void delMeeting(int meetingId) {
		meetingDao.deleteMeeting(meetingId);
	}
	
	@Override
	public void addParticipation(int meetingId, String userId) {
		meetingDao.insertParticipation(meetingId, userId);
	}
	
	@Override
	public void fixApplicantNumber(int meetingId, int applicantNumber) {
		meetingDao.updateApplicantNumber(meetingId, applicantNumber);
	}
	
	@Override
	public void delParticipation(int meetingId, String userId) {
		meetingDao.deleteParticipation(meetingId, userId);
	}
}
