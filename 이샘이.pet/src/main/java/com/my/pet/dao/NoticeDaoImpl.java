package com.my.pet.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.NoticeMap;
import com.my.pet.domain.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired private NoticeMap noticeMap;
	
	@Override
	public List<Notice> selectNotices() {
		return noticeMap.selectNotices();
	}
	
	@Override
	public List<Notice> searchNoticesTitle(String noticeTitle) {
		return noticeMap.searchNoticesTitle(noticeTitle);
	}
	
	@Override
	public List<Notice> searchNoticesUserId(String userId) {
		return noticeMap.searchNoticesUserId(userId);
	}
	
	@Override
	public Notice selectNotice(int noticeId) {
		return noticeMap.selectNotice(noticeId);
	}
	
	@Override
	public int insertNotice(String noticeTitle, String noticeContent, String userId) {
		return noticeMap.insertNotice(noticeTitle, noticeContent, userId);
	}
	
	@Override
	public int updateNotice(Notice notice) {
		return noticeMap.updateNotice(notice);
	}
	
	@Override
	public int deleteNotice(int noticeId) {
		return noticeMap.deleteNotice(noticeId);
	}
}