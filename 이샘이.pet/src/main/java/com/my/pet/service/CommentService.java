package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Comment;

public interface CommentService {
	List<Comment> getComments();
	void addComment(String commentContent, LocalDateTime commentTime, String userId, int meetingId,String nickname);
	void fixComment(Comment comment);
	void delComment(int commentId);
}
  