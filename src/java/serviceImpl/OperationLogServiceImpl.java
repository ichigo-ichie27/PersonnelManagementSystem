package com.graduationDesign.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.OperationLogMapper;
import com.graduationDesign.entity.OperationLog;
import com.graduationDesign.service.OperationLogService;
@Service
public class OperationLogServiceImpl implements OperationLogService{
	@Autowired
	OperationLogMapper mapper;
	
	@Override
	public List<OperationLog> selectOperationLogsBySelectiveQuery(OperationLog log) {
		
		return mapper.getOperationLogsBySelectiveQuery(log);
	}

	@Override
	public void insertOperationLog(OperationLog log) {
		
		mapper.addOperationLog(log);
	}

	@Override
	public void deleteOperationLogById(Integer id) {
		mapper.removeOperationLogById(id);
	}

	@Override
	public void batchDeleteOperationLog(List<Integer> id) {
		mapper.batchRemoveOperationLog(id);
	}

}
