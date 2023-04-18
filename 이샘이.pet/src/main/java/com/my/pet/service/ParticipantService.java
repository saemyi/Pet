package com.my.pet.service;

import java.util.List;

import com.my.pet.domain.Participant;

public interface ParticipantService {
	Participant getMeetingCreator(int meetingId);
	List<Participant> getParticipants(int meetingId);
	void addParticipant(int meetingId, String userId);
	void fixApplicantNumber(int meetingId, int applicantNumber);
	void delParticipant(int meetingId, String userId);
}