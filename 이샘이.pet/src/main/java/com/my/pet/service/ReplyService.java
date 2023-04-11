package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import com.my.pet.domain.Reply;

public interface ReplyService {
	List<Reply> getReplies(int commentId);
	void addReply(String replyContent, LocalDateTime replyTime, String userId, int commentId);
	void fixReply(Reply reply);
	void delReply(int replyId);
}
