package com.graduationDesign.serviceImpl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.WagesManagementMapper;
import com.graduationDesign.entity.WagesManagement;
import com.graduationDesign.service.WagesManagementService;

@Service
public class WagesManagementServiceImpl implements WagesManagementService {

	@Autowired
	WagesManagementMapper mapper;

	@Override
	public List<WagesManagement> selectWagesManagementBySelectiveQuery(WagesManagement wages) {
		
		return mapper.getWagesManagementBySelectiveQuery(wages);
	}

	@Override
	public void deleteWagesManagement(Integer id) {
		
		mapper.moveWagesManagement(id);
		
	}

	@Override
	public void batchDeleteWagesManagement(List<Integer> id) {
		mapper.batchDeleteWagesManagement(id);
	}

	@Override
	public void insertWagesManagement(WagesManagement wages) {
		mapper.addWagesManagement(wages);
	}

	@Override
	public void updateWagesManagement(WagesManagement wages) {
		mapper.editWagesManagement(wages);
	}

	@Override
	public List<Map<String, BigDecimal>> selectCountWages() {
		
		return mapper.getCountWages();
	}
	
	@Override
	public List<Map<String, Integer>> selectEmpNameAndId() {
		
		return mapper.getEmpNameAndId();
	}
}
