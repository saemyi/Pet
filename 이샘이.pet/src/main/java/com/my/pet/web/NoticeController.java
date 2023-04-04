package com.my.pet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Notice;
import com.my.pet.service.NoticeService;

@RestController
@RequestMapping("notice")
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	@GetMapping("get")
	public List<Notice> getNotices() {
		return noticeService.getNotices();
	}
	
	@GetMapping("noticeDetail/{noticeId}")
	public ModelAndView getNotice(@PathVariable int noticeId, ModelAndView mv) {
		Notice notice = noticeService.getNotice(noticeId);
		mv.addObject(notice);
		mv.setViewName("notice/noticeDetail");
		return mv;
	}
}