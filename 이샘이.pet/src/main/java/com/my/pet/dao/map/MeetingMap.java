package com.my.pet.dao.map;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Meeting;
import com.my.pet.domain.Participant;

public interface MeetingMap {
	int selectLastMeetingId();
	List<Meeting> selectAllMeetings();
	List<Meeting> selectMeetingsByAddress(@Param("sidoId") String sidoId,
								@Param("sigunguId") String sigunguId,
								@Param("dongId") String dongId
								);
	List<Meeting> selectMeetingsByParticipant(String userId);
	List<Meeting> selectMeetingsByCreator(String userId);
	Meeting selectMeeting(int meetingId);
	int insertMeeting(@Param("meetingTitle") String meetingTitle, 
					@Param("meetingContent") String meetingContent,
					@Param("meetingTime") LocalDateTime meetingTime,
					@Param("recruitmentNumber") int recruitmentNumber,
					@Param("applicantNumber") int applicantNumber,
					@Param("userId") String userId,
					@Param("sidoId") String sidoId,
					@Param("sigunguId") String sigunguId,
					@Param("dongId") String dongId
					);
	int updateMeeting(Meeting meeting);
	int deleteMeeting(int meetingId);
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
