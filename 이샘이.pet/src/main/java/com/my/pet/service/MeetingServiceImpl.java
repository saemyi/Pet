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
}
