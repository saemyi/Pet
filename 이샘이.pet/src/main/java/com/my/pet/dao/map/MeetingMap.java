package com.my.pet.dao.map;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Meeting;

public interface MeetingMap {
	int selectLastMeetingId();
	List<Meeting> selectMeetings(@Param("sidoId") String sidoId,
								@Param("sigunguId") String sigunguId,
								@Param("dongId") String dongId,
								@Param("userId") String userId
								);
	Meeting selectMeetingByIdAndParticipant(@Param("meetingId") int meetingId,
											@Param("userId") String userId
											);
	List<Meeting> selectMeetingsByParticipant(String userId);
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
	List<Meeting> searchMeetings(@Param("meetingTitle") String meetingTitle,
								@Param("meetingTime") LocalDateTime meetingTime,
								@Param("userId") String userId
								);
}