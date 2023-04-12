package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Comment;
import com.my.pet.domain.Reply;

public interface ReplyDao {
	Comment selectComment(int commentId);
	List<Reply> selectReplies(int commentId);
	void insertReply(String replyContent, LocalDateTime	replyTime, String userId, int commentId);
	void updateReply(Reply reply);
	void deleteReply(int replyId);
}
