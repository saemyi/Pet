package com.my.pet.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.service.MeetingService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("admin/meeting")
public class AdminMeetingController {
	@Autowired private MeetingService meetingService;
	
	@GetMapping("list")
	public ModelAndView addMeeting(ModelAndView mv) {
		mv.setViewName("admin/meeting/adminMeetingList");
		return mv;
	}
	
	@GetMapping("{meetingId}")
	public ModelAndView getMeetingById(@PathVariable int meetingId, ModelAndView mv, HttpSession session) {
		session.setAttribute("lastMeetingId", meetingId);
		mv.setViewName("admin/meeting/adminMeetingView");
		return mv;
	}
	
	@DeleteMapping("del/{meetingId}")
	public void delMeeting(@PathVariable int meetingId) {
		meetingService.delMeeting(meetingId);
	}
}
