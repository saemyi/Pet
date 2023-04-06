package com.my.pet.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.pet.dao.map.AlarmMap;
import com.my.pet.domain.Alarm;

@Repository
public class AlarmDaoImpl implements AlarmDao{
	@Autowired private AlarmMap alarmMap;
	
	@Override
	public List<Alarm> selectAlarms() {
		return alarmMap.selectAlarms();
	}
	
	@Override
	public void insertAlarm(Alarm alarm) {
		alarmMap.insertAlarm(alarm);
	}
}
