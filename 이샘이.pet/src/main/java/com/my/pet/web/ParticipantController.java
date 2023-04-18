package com.my.pet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Participant;
import com.my.pet.service.ParticipantService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("participant")
public class ParticipantController {
	@Autowired private ParticipantService participantService;
	
	@GetMapping("participantView")
	public ModelAndView getParticipants(ModelAndView mv) {
		mv.setViewName("participant/participantView");
		return mv;
	}
	
	@GetMapping("getMeetingCreator")
	public Participant getMeetingCreator(HttpSession session) {
		int meetingId = (int)session.getAttribute("lastMeetingId");
		return participantService.getMeetingCreator(meetingId);
	}
	
	@GetMapping("getParticipants")
	public List<Participant> getParticipants(HttpSession session) {
		int meetingId = (int)session.getAttribute("lastMeetingId");
		return participantService.getParticipants(meetingId);
	}
	
	@PostMapping("addParticipant")
	public void addParticipant(int meetingId, String userId) {
		participantService.addParticipant(meetingId, userId);
	}
	
	@PostMapping("fixApplicantNumber")
	public void fixApplicantNumber(int meetingId, int applicantNumber) {
		participantService.fixApplicantNumber(meetingId, applicantNumber);
	}
	
	@PostMapping("delParticipant")
	public void delParticipant(int meetingId, String userId) {
		participantService.delParticipant(meetingId, userId);
	}
}