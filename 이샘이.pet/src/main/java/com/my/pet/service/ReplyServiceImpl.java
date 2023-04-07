package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.ReplyDao;
import com.my.pet.domain.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired private ReplyDao replyDao;
	
	@Override
	public List<Reply> getReplies(){
		return replyDao.selectReplies();
	}
	
	@Override
	public void addReply(String replyContent, LocalDateTime replyTime, String userId, int commentId) {
		replyDao.insertReply(replyContent, replyTime, userId, commentId);
	}  
	
	@Override
	public void fixReply(Reply reply) {
		replyDao.updateReply(reply);
	}
	
	@Override
	public void delReply(int replyId) {
		replyDao.deleteReply(replyId);
	}
}
