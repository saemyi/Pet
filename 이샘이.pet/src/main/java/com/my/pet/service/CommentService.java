package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Comment;

public interface CommentService {
	List<Comment> getComments(int meetingId);
	void addComment(String commentContent, LocalDateTime commentTime, String userId, int meetingId);
	void fixComment(Comment comment);
	void delComment(int commentId);
}