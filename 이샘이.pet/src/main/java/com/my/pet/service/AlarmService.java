package com.my.pet.service;

import java.util.List;

import com.my.pet.domain.Alarm;

public interface AlarmService {
	List<Alarm> getAlarms();
	void addAlarm(Alarm alarm);
}