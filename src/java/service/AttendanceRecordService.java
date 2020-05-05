package com.graduationDesign.service;

import java.util.List;

import com.graduationDesign.dao.AttendanceRecordMapper;
import com.graduationDesign.entity.AttendanceRecord;

public interface AttendanceRecordService {

	// 有选择查询数据
	List<AttendanceRecordMapper> selectAttendanceRecordInfoBySelectQuery(AttendanceRecord aRecord);

	// 修改状态
	void updateStateById(AttendanceRecord aRecord);

	// 删除数据
	void deleteAttendanceRecord(Integer id);

	// 批量删除数据
	void batchDeleteAttendanceRecord(List<Integer> id);

}
