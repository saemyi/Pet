package com.my.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.ParticipantDao;
import com.my.pet.domain.Participant;

@Service
public class ParticipantServiceImpl implements ParticipantService {
	@Autowired private ParticipantDao participantDao;
	
	@Override
	public Participant getMeetingCreator(int meetingId) {
		return participantDao.selectMeetingCreator(meetingId);
	}
	
	@Override
	public List<Participant> getParticipants(int meetingId) {
		return participantDao.selectParticipants(meetingId);
	}
	
	@Override
	public void addParticipant(int meetingId, String userId) {
		participantDao.insertParticipant(meetingId, userId);
	}
	
	@Override
	public void fixApplicantNumber(int meetingId, int applicantNumber) {
		participantDao.updateApplicantNumber(meetingId, applicantNumber);
	}
	
	@Override
	public void delParticipant(int meetingId, String userId) {
		participantDao.deleteParticipant(meetingId, userId);
	}
}
