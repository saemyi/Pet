package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments(int meetingId);
	void insertComment(String commentContent, LocalDateTime	commentTime, String userId, int meetingId);
	void updateComment(Comment comment);
	void deleteComment(int commentId);
}