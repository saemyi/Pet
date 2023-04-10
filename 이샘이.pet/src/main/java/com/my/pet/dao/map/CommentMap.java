package com.my.pet.dao.map;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Comment;

public interface CommentMap {
	List<Comment> selectComments();
	int insertComment(@Param("commentContent") String commentContent, @Param("commentTime") LocalDateTime commentTime,
			@Param("userId") String userId, @Param("meetingId") int meetingId, @Param("nickname") String nickname);
	
	int updateComment(Comment comment);
	int deleteComment(int commentId);
}
 