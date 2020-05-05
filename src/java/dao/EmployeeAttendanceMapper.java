package com.graduationDesign.dao;

import java.util.List;

import com.graduationDesign.entity.AttendanceRecord;

public interface EmployeeAttendanceMapper {
	
	//有选择性的查询
	List<AttendanceRecord> getPersonnelAttendancesBySelectiveQuery(AttendanceRecord record);
	
	//删除个人考勤记录
	int movePersonnelAttendance(Integer id);
	
	//批量删除个人考勤记录
	int batchMovePersonnelAttendance(List<Integer> id);
	
	//通过员工姓名查询员工id
	Integer selectEmpIdByEmpName(String name);
	
	//添加员工考勤记录
	int addEmpAttendance(AttendanceRecord record);
	
	
}
