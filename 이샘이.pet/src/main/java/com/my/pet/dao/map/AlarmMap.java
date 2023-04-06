package com.my.pet.dao.map;

import java.util.List;

import com.my.pet.domain.Alarm;

public interface AlarmMap {
	List<Alarm> selectAlarms();
	int insertAlarm(Alarm alarm);
}
