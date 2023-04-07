package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Reply;

public interface ReplyDao {
	List<Reply> selectReplies();
	void insertReply(String replyContent, LocalDateTime	replyTime, String userId, int commentId);
	void updateReply(Reply reply);
	void deleteReply(int replyId);
}
