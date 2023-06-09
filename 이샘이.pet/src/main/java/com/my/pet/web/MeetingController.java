package com.my.pet.web;

import java.time.LocalDateTime;
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

import com.my.pet.domain.Meeting;
import com.my.pet.service.MeetingService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("meeting")
public class MeetingController {
	@Autowired private MeetingService meetingService;
	
	@GetMapping("view")
	public ModelAndView getMeeting(ModelAndView mv) {
		mv.setViewName("meeting/meetingView");
		return mv;
	}
	
	@GetMapping("{meetingId}")
	public ModelAndView getMeetingById(@PathVariable int meetingId, ModelAndView mv, HttpSession session) {
		session.setAttribute("lastMeetingId", meetingId);
		mv.setViewName("meeting/meetingView");
		return mv;
	}
	
	@GetMapping("myMeetings")
	public ModelAndView getMyMeetings(ModelAndView mv) {
		mv.setViewName("meeting/meetingList");
		return mv;
	}
	
	@GetMapping("get")
	public Meeting getMeeting(HttpSession session) {
		int meetingId = (int)session.getAttribute("lastMeetingId");
		return meetingService.getMeeting(meetingId);
	}
	
	@PostMapping("getMeetings")
	public List<Meeting> getMeetings(String sidoId, String sigunguId, String dongId, String userId) {
		return meetingService.getMeetings(sidoId, sigunguId, dongId, userId);
	}
	
	@PostMapping("getMeetingByIdAndParticipant")
	public Meeting getMeetingByIdAndParticipant(int meetingId, String userId) {
		return meetingService.getMeetingByIdAndParticipant(meetingId, userId);
	}
	
	@PostMapping("getMeetingsByParticipant")
	public List<Meeting> getMeetingsByParticipant(String userId) {
		return meetingService.getMeetingsByParticipant(userId);
	}
	
	@GetMapping("fix")
	public ModelAndView fixMeeting(ModelAndView mv) {
		mv.setViewName("meeting/meetingFix");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView addMeeting(ModelAndView mv) {
		mv.setViewName("meeting/meetingAdd");
		return mv;
	}
	
	// @RequestParam으로 받는다. @RequestBody도 쓸 수 있다.
	@PostMapping("add")
	public void addMeeting(String meetingTitle, String meetingContent, 
					LocalDateTime meetingTime, int recruitmentNumber, int applicantNumber, 
					String userId, String sidoId, String sigunguId, String dongId,
					HttpSession session) {
		meetingService.addMeeting(meetingTitle, meetingContent, meetingTime, recruitmentNumber, applicantNumber, userId, sidoId, sigunguId, dongId);
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
	
	@PostMapping("searchMeetings")
	public List<Meeting> findMeetings(String meetingTitle, LocalDateTime meetingTime, String userId) {
		return meetingService.findMeetings(meetingTitle, meetingTime, userId);
	}
}