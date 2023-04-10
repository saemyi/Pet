package com.my.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.NoticeDao;
import com.my.pet.domain.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired private NoticeDao noticeDao;
	
	@Override
	public List<Notice> getNotices() {
		return noticeDao.selectNotices();
	}
	
	@Override
	public List<Notice> searchNotices(String noticeTitle) {
		System.out.println(noticeTitle);
		return noticeDao.searchNotices(noticeTitle);
	}
	
	@Override
	public Notice getNotice(int noticeId) {
		return noticeDao.selectNotice(noticeId);
	}
	
	@Override
	public void addNotice(String noticeTitle, String noticeContent, String userId) {
		noticeDao.insertNotice(noticeTitle, noticeContent, userId);
	}
	
	@Override
	public void fixNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}
	
	@Override
	public void delNotice(int noticeid) {
		noticeDao.deleteNotice(noticeid);
	}
}
