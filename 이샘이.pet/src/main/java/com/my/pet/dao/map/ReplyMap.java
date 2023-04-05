package com.my.pet.dao.map;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.pet.domain.Reply;

public interface ReplyMap {
	List<Reply> selectReplies();
	int insertReply(@Param("replyContent") String replyContent, @Param("replyTime") LocalDateTime replyTime,
			@Param("userId") String userId, @Param("commentId") int commentId);
	int updateReply(@Param("replyContent") String replyContent, @Param("replyTime") LocalDateTime replyTime);
	int deleteReply(int replyId);
}
