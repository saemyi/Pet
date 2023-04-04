package com.my.pet.service;

import java.util.List;

import com.my.pet.domain.Notice;

public interface NoticeService {
	List<Notice> getNotices();
	Notice getNotice(int noticeId);
	void addNotice(String noticeTitle, String noticeContent);
	void fixNotice(Notice notice);
	void delNotice(int noticeid);
}

