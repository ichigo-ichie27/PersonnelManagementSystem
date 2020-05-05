package com.graduationDesign.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.PartEmployeeInformationMapper;
import com.graduationDesign.entity.PartEmployeeInformation;
import com.graduationDesign.entity.PartEmployeeInformation2;
import com.graduationDesign.service.PartEmployeeInformationService;

@Service
public class PartEmployeeInformationServiceImpl implements PartEmployeeInformationService{
	
	@Autowired
	PartEmployeeInformationMapper mapper;
	
	@Override
	public List<PartEmployeeInformation> selectPartEmployeeInformationBySelectQuery(PartEmployeeInformation employee) {
		
		return mapper.getPartEmployeeInformationBySelectQuery(employee);
	}

	@Override
	public void deletePartEmployeeInformation(Integer id) {
		
		mapper.movePartEmployeeInformation(id);
	}

	@Override
	public void batchDeletePartEmployeeInformation(List<Integer> id) {
		
		mapper.batchMovePartEmployeeInformation(id);
		
	}

	@Override
	public List<Map<String, Integer>> selectCultureTypeName() {
		
		return mapper.getCultureTypeName();
	}

	@Override
	public List<Map<String, Integer>> selectPositionTypeName() {
		
		return mapper.getPositionTypeName();
	}

	@Override
	public List<Map<String, Integer>> selectDeptTypeName() {
		
		return mapper.getDeptTypeName();
	}

	@Override
	public void insertEmpInfo(PartEmployeeInformation2 employeeInformation) {
		
		mapper.addEmpInfo(employeeInformation);
	}

	@Override
	public void updateEmpInfo(PartEmployeeInformation2 employeeInformation) {
		
		mapper.editEmpInfo(employeeInformation);
	}

	@Override
	public PartEmployeeInformation2 selectEmpInfoById(Integer id) {
		
		return mapper.getEmpInfoById(id);
	}

	@Override
	public List<Map<String, Integer>> selectNationTypeName() {
		
		return mapper.getNationTypeName();
	}

	@Override
	public List<Map<String, Integer>> selectPoliticalTypeName() {
		
		return mapper.getPoliticalTypeName();
	}

	@Override
	public List<String> selectUserName() {
		
		return mapper.getUserName();
	}
}
