package com.graduationDesign.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.AttendanceRecordMapper;
import com.graduationDesign.entity.AttendanceRecord;
import com.graduationDesign.service.AttendanceRecordService;
@Service
public class AttendanceRecordServiceImpl implements AttendanceRecordService {
	@Autowired
	AttendanceRecordMapper mapper;

	@Override
	public List<AttendanceRecordMapper> selectAttendanceRecordInfoBySelectQuery(AttendanceRecord aRecord) {
		
		return mapper.getAttendanceRecordInfoBySelectQuery(aRecord);
	}

	@Override
	public void updateStateById(AttendanceRecord aRecord) {
		mapper.editStateById(aRecord);
	}

	@Override
	public void deleteAttendanceRecord(Integer id) {
		
		mapper.moveAttendanceRecord(id);
		
	}

	@Override
	public void batchDeleteAttendanceRecord(List<Integer> id) {
		
		mapper.batchDeleteAttendanceRecord(id);
		
	}
	
}
