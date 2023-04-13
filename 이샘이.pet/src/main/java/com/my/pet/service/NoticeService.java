package com.my.pet.service;

import java.util.List;

import com.my.pet.domain.Notice;

public interface NoticeService {
	List<Notice> getNotices();
	List<Notice> searchNoticesTitle(String noticeTitle);
	List<Notice> searchNoticesUserId(String userId);
	Notice getNotice(int noticeId);
	void addNotice(String noticeTitle, String noticeContent, String userId);
	void fixNotice(Notice notice);
	void delNotice(int noticeid);
}
