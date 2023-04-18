package com.my.pet.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Participant;

public interface ParticipantMap {
	Participant selectMeetingCreator(int meetingId);
	List<Participant> selectParticipants(int meetingId);
	int insertParticipant(@Param("meetingId") int meetingId,
						@Param("userId") String userId
						);
	int updateApplicantNumber(@Param("meetingId") int meetingId,
							@Param("applicantNumber") int applicantNumber
							);
	int deleteParticipant(@Param("meetingId") int meetingId,
							@Param("userId") String userId
							);
}