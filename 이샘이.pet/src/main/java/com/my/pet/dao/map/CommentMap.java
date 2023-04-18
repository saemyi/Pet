package com.my.pet.dao.map;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Comment;

public interface CommentMap {
	List<Comment> selectComments(@Param("meetingId") int meetingId);
	int selectMeeting(@Param("meetingId") int meetingId);
	int insertComment(@Param("commentContent") String commentContent, @Param("commentTime") LocalDateTime commentTime,
			@Param("userId") String userId, @Param("meetingId") int meetingId);	
	int updateComment(Comment comment);
	int deleteComment(int commentId);
}