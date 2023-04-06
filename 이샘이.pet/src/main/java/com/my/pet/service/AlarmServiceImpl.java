package com.my.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.pet.dao.AlarmDao;
import com.my.pet.domain.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired private AlarmDao alarmDao;
	
	@Override
	public List<Alarm> getAlarms() {
		return alarmDao.selectAlarms();
	}
	
	@Override
	public void addAlarm(Alarm alarm) {
		alarmDao.insertAlarm(alarm);
	}
}