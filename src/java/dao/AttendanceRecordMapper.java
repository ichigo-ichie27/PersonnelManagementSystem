package com.graduationDesign.dao;

import java.util.List;

import com.graduationDesign.entity.AttendanceRecord;

public interface AttendanceRecordMapper {
	//有选择的查询数据
	List<AttendanceRecordMapper> getAttendanceRecordInfoBySelectQuery(AttendanceRecord aRecord);
	
	//修改状态
	int editStateById(AttendanceRecord aRecord);
	
	//删除数据
	int moveAttendanceRecord(Integer id);
	
	//批量删除数据
	int batchDeleteAttendanceRecord(List<Integer> id);
}
