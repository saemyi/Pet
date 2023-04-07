package com.my.pet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Notice;
import com.my.pet.service.NoticeService;

@RestController
@RequestMapping("admin/notice")
public class AdminNoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("admin/notice/adminNoticeList");
		return mv;
	}
	
	@GetMapping("get")
	public List<Notice> getNotiecs() {
		return noticeService.getNotices();
	}
	
	@GetMapping("search")
	public List<Notice> searchNotices(String noticeTitle) {
		System.out.println(noticeTitle);
		return noticeService.searchNotices(noticeTitle);
	}
	
	@GetMapping("adminNoticeAdd")
	public ModelAndView noticeAdd(ModelAndView mv) {
		mv.setViewName("admin/notice/adminNoticeAdd");
		return mv;
	}
	
	@GetMapping("adminNoticeFix/{noticeId}")
	public ModelAndView fixNotice(@PathVariable int noticeId, ModelAndView mv) {
		Notice notice = noticeService.getNotice(noticeId);
		mv.addObject(notice);
		mv.setViewName("admin/notice/adminNoticeFix");
		return mv;
	}
	
	@GetMapping("adminNoticeDetail/{noticeId}")
	public ModelAndView getNotice(@PathVariable int noticeId, ModelAndView mv) {
		Notice notice = noticeService.getNotice(noticeId);
		mv.addObject(notice);
		mv.setViewName("admin/notice/adminNoticeDetail");
		return mv;
	}
	
	@PostMapping("add")
	public void noticeAdd(String noticeTitle, String noticeContent) {
		noticeService.addNotice(noticeTitle, noticeContent);
	}
	
	@PutMapping("fix")
	public void noticeFix(@RequestBody Notice notice) {
		noticeService.fixNotice(notice);
	}
	
	@DeleteMapping("del/{noticeId}")
	public void noticeDel(@PathVariable int noticeId) {
		noticeService.delNotice(noticeId);
	}
}
