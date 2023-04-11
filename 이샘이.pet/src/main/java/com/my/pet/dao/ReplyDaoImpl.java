package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.ReplyMap;
import com.my.pet.domain.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao{
@Autowired private ReplyMap replyMap;
	
	@Override
	public List<Reply> selectReplies(int commentId){
		return replyMap.selectReplies(commentId);
	} 
	
	@Override
	public void insertReply(String replyContent, LocalDateTime replyTime, String userId, int commentId) {
		replyMap.insertReply(replyContent, replyTime, userId, commentId);
	}
	
	@Override
	public void updateReply(Reply reply) {
		replyMap.updateReply(reply);
	}
	
	@Override
	public void deleteReply(int replyId) {
		replyMap.deleteReply(replyId);
	}
}
