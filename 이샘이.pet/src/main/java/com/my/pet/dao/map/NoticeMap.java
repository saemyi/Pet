package com.my.pet.dao.map;

import java.util.List;

import com.my.pet.domain.Notice;

public interface NoticeMap {
	List<Notice> selectNotices();
	List<Notice> searchNotices(String noticeTitle);
	Notice selectNotice(int noticeId);
	int insertNotice(String noticeTitle, String noticeContent, String userId);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeId);
}