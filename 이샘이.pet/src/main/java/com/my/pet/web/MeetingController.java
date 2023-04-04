package com.my.pet.web;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

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

import com.my.pet.domain.Meeting;
import com.my.pet.service.MeetingService;

@RestController
@RequestMapping("meeting")
public class MeetingController {
	@Autowired private MeetingService meetingService;
	
	@GetMapping("get")
	public ModelAndView getMeeting(ModelAndView mv) {
		mv.setViewName("meeting/meetingView");
		return mv;
	}
	
	@PostMapping("get/{meetingId}")
	public Meeting getMeeting(@PathVariable int meetingId) {
		return meetingService.getMeeting(meetingId);
	}
	
	@GetMapping("add")
	public ModelAndView addMeeting(ModelAndView mv) {
		mv.setViewName("meeting/meetingAdd");
		return mv;
	}
	
	// @RequestParam으로 받는다. @RequestBody도 쓸 수 있다.
	@PostMapping("add")
	public void addMeeting(String title, String meetingContent, 
					LocalDateTime datetime, int recruitmentNumber, int applicantNumber, 
					String userId, String sidoId, String sigunguId, String dongId) {
		meetingService.addMeeting(title, meetingContent, datetime, recruitmentNumber, applicantNumber, userId, sidoId, sigunguId, dongId);
	}
	
	private void setLastMeetingId(HttpSession session) {
		session.setAttribute("lastMeetingId", meetingService.getLastMeetingId());
	}
	
	// @RequestBody로 받는다. @RequestParam 불가.
	@PutMapping("fix")
	public void fixMeeting(@RequestBody Meeting meeting) {
		meetingService.fixMeeting(meeting);
	}
	
	// @RequestParam 불가.
	@DeleteMapping("del/{meetingId}")
	public void delMeeting(@PathVariable int meetingId) {
		meetingService.delMeeting(meetingId);
	}
}
