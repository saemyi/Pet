package com.my.pet.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.CommentMap;
import com.my.pet.domain.Comment;

@Repository
public class CommentDaoImpl implements CommentDao{
@Autowired private CommentMap commentMap;

	@Override
	public List<Comment> selectComments(){
		return commentMap.selectComments();
	} 
	
	@Override
	public void insertComment(String commentContent, LocalDateTime commentTime, String userId, int meetingId) {
		commentMap.insertComment(commentContent, commentTime, userId, meetingId);
	}
	
	@Override
	public void updateComment(Comment comment) {
		commentMap.updateComment(comment);
	}
	
	@Override
	public void deleteComment(int commentId) {
		commentMap.deleteComment(commentId);
	}
}
