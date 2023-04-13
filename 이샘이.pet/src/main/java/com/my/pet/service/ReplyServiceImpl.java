package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.ReplyDao;
import com.my.pet.domain.Comment;
import com.my.pet.domain.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired private ReplyDao replyDao;
	
	@Override
	public Comment getComment(int commentId) {
		return replyDao.selectComment(commentId);
	}
	
	@Override
	public List<Reply> getReplies(int commentId){
		return replyDao.selectReplies(commentId);
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
	public void fixComment(Comment comment) {
		replyDao.updateComment(comment);
	}
	
	@Override
	public void delReply(int replyId) {
		replyDao.deleteReply(replyId);
	}
	
	@Override
	public void delComment(int commentId) {
		replyDao.deleteComment(commentId);
	}
}
