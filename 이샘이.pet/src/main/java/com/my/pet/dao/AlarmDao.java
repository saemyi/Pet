package com.my.pet.dao;

import java.util.List;

import com.my.pet.domain.Alarm;

public interface AlarmDao {
	List<Alarm> selectAlarms();
	void insertAlarm(Alarm alarm);
}