package com.my.pet.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.ParticipantMap;
import com.my.pet.domain.Participant;

@Repository
public class ParticipantDaoImpl implements ParticipantDao {
	@Autowired private ParticipantMap participantMap;
	
	@Override
	public Participant selectMeetingCreator(int meetingId) {
		return participantMap.selectMeetingCreator(meetingId);
	}
	
	@Override
	public List<Participant> selectParticipants(int meetingId) {
		return participantMap.selectParticipants(meetingId);
	}
	
	@Override
	public void insertParticipant(int meetingId, String userId) {
		participantMap.insertParticipant(meetingId, userId);
	}
	
	@Override
	public void updateApplicantNumber(int meetingId, int applicantNumber) {
		participantMap.updateApplicantNumber(meetingId, applicantNumber);
	}
	
	@Override
	public void deleteParticipant(int meetingId, String userId) {
		participantMap.deleteParticipant(meetingId, userId);
	}
}
