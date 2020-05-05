package com.graduationDesign.service;

import java.util.List;

import com.graduationDesign.entity.AttendanceRecord;

public interface EmployeeAttendanceService {

	// 有选择性的查询
	List<AttendanceRecord> selectPersonnelAttendancesBySelectiveQuery(AttendanceRecord record);

	// 删除个人考勤记录
	void deletePersonnelAttendance(Integer id);

	// 批量删除个人考勤记录
	void batchDeletePersonnelAttendance(List<Integer> id);

	// 通过员工姓名查询员工id
	Integer selectEmpIdByEmpName(String name);

	// 添加员工考勤记录
	void insertEmpAttendance(AttendanceRecord record);
}
