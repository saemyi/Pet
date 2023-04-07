package com.my.pet.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.CommentDao;
import com.my.pet.domain.Comment;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired private CommentDao commentDao;
	
	@Override
	public List<Comment> getComments(){
		return commentDao.selectComments();
	}
	
	@Override
	public void addComment(String commentContent, LocalDateTime commentTime, String userId, int meetingId) {
		commentDao.insertComment(commentContent, commentTime, userId, meetingId);
	}  
	
	@Override
	public void fixComment(Comment comment) {
		commentDao.updateComment(comment);
	}
	
	@Override
	public void delComment(int commentId) {
		commentDao.deleteComment(commentId);
	}
}
