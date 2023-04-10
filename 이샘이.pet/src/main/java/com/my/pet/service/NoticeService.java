package com.my.pet.service;

import java.util.List;

import com.my.pet.domain.Notice;

public interface NoticeService {
	List<Notice> getNotices();
	List<Notice> searchNotices(String noticeTitle);
	Notice getNotice(int noticeId);
	void addNotice(String noticeTitle, String noticeContent, String userId);
	void fixNotice(Notice notice);
	void delNotice(int noticeid);
}
