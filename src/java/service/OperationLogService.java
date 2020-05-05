package com.graduationDesign.service;

import java.util.List;

import com.graduationDesign.entity.OperationLog;

public interface OperationLogService {

	// 有选择性查询操作日志
	List<OperationLog> selectOperationLogsBySelectiveQuery(OperationLog log);

	// 添加操作日志
	void insertOperationLog(OperationLog log);

	// 通过id删除操作日志
	void deleteOperationLogById(Integer id);

	// 批量删除操作日志
	void batchDeleteOperationLog(List<Integer> id);
}
