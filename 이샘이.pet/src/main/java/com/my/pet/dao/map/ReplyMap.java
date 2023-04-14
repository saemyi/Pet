package com.my.pet.dao.map;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Comment;
import com.my.pet.domain.Reply;

public interface ReplyMap {
	Comment selectComment(@Param("commentId") int commentId);
	List<Reply> selectReplies(@Param("commentId") int commentId);
	int insertReply(@Param("replyContent") String replyContent, @Param("replyTime") LocalDateTime replyTime,
			@Param("userId") String userId, @Param("commentId") int commentId);
	int updateReply(Reply reply);
	int updateComment(Comment comment);
	int deleteReply(int replyId);
	int deleteComment(@Param("commentId")int commentId);
}
