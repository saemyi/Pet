package com.my.pet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Alarm;
import com.my.pet.service.AlarmService;

@RestController
@RequestMapping("alarm")
public class AlarmController {
	@Autowired private AlarmService alarmService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("alarm/alarmList");
		return mv;
	}
	
	@GetMapping("get")
	public List<Alarm> getAlarms() {
		return alarmService.getAlarms();
	}
	
	@PostMapping("add")
	public void addAlarm(Alarm alarm) {
		alarmService.addAlarm(alarm);
	}
}
