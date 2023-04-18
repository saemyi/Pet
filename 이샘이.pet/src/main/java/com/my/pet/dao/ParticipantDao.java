package com.my.pet.dao;

import java.util.List;

import com.my.pet.domain.Participant;

public interface ParticipantDao {
	Participant selectMeetingCreator(int meetingId);
	List<Participant> selectParticipants(int meetingId);
	void insertParticipant(int meetingId, String userId);
	void updateApplicantNumber(int meetingId, int applicantNumber);
	void deleteParticipant(int meetingId, String userId);
}