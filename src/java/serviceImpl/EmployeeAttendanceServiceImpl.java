package com.graduationDesign.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.EmployeeAttendanceMapper;
import com.graduationDesign.entity.AttendanceRecord;
import com.graduationDesign.service.EmployeeAttendanceService;

@Service
public class EmployeeAttendanceServiceImpl implements EmployeeAttendanceService {
	@Autowired
	EmployeeAttendanceMapper mapper;

	@Override
	public List<AttendanceRecord> selectPersonnelAttendancesBySelectiveQuery(AttendanceRecord record) {
		
		return mapper.getPersonnelAttendancesBySelectiveQuery(record);
	}

	@Override
	public void deletePersonnelAttendance(Integer id) {
		mapper.movePersonnelAttendance(id);
		
	}

	@Override
	public void batchDeletePersonnelAttendance(List<Integer> id) {
		mapper.batchMovePersonnelAttendance(id);
		
	}

	@Override
	public Integer selectEmpIdByEmpName(String name) {
		
		return mapper.selectEmpIdByEmpName(name);
	}

	@Override
	public void insertEmpAttendance(AttendanceRecord record) {
		mapper.addEmpAttendance(record);
	}
	
	
}
