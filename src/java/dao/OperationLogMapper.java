package com.graduationDesign.dao;

import java.util.List;

import com.graduationDesign.entity.OperationLog;

public interface OperationLogMapper {
	
	//有选择性查询操作日志
	List<OperationLog> getOperationLogsBySelectiveQuery(OperationLog log);
	
	//添加操作日志
	int addOperationLog(OperationLog log);
	
	//通过id删除操作日志
	int removeOperationLogById(Integer id);
	
	//批量删除操作日志
	int batchRemoveOperationLog(List<Integer> id);
	
}
