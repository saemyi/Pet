package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.MeetingDao;
import com.my.pet.domain.Meeting;
import com.my.pet.domain.Participant;

@Service
public class MeetingServiceImpl implements MeetingService {
	@Autowired private MeetingDao meetingDao;
	
	@Override
	public int getLastMeetingId() {
		return meetingDao.selectLastMeetingId();
	}
	
	@Override
	public List<Meeting> getMeetings(String sidoId, String sigunguId, String dongId, String userId) {
		return meetingDao.selectMeetings(sidoId, sigunguId, dongId, userId);
	}
	
	@Override
	public Meeting getMeetingByIdAndParticipant(int meetingId, String userId) {
		return meetingDao.selectMeetingByIdAndParticipant(meetingId, userId);
	}
	
	@Override
	public List<Meeting> getMeetingsByParticipant(String userId) {
		return meetingDao.selectMeetingsByParticipant(userId);
	}
	
	@Override
	public Meeting getMeeting(int meetingId) {
		return meetingDao.selectMeeting(meetingId);
	}
	
	@Override
	public void addMeeting(String meetingTitle, String meetingContent, 
			LocalDateTime meetingTime, int recruitmentNumber, int applicantNumber, 
			String userId, String sidoId, String sigunguId, String dongId) {
		meetingDao.insertMeeting(meetingTitle, meetingContent, meetingTime, recruitmentNumber, 
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
	public Participant getMeetingCreator(int meetingId) {
		return meetingDao.selectMeetingCreator(meetingId);
	}
	
	@Override
	public List<Participant> getParticipants(int meetingId) {
		return meetingDao.selectParticipants(meetingId);
	}
	
	@Override
	public void addParticipant(int meetingId, String userId) {
		meetingDao.insertParticipant(meetingId, userId);
	}
	
	@Override
	public void fixApplicantNumber(int meetingId, int applicantNumber) {
		meetingDao.updateApplicantNumber(meetingId, applicantNumber);
	}
	
	@Override
	public void delParticipant(int meetingId, String userId) {
		meetingDao.deleteParticipant(meetingId, userId);
	}
}
