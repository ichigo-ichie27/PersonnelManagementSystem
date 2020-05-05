package com.graduationDesign.serviceImpl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.StaffPersonnelInformationMapper;
import com.graduationDesign.entity.EmployeeInformation;
import com.graduationDesign.entity.WagesManagement;
import com.graduationDesign.service.StaffPersonnelInformationService;
@Service
public class StaffPersonnelInformationServiceImpl implements StaffPersonnelInformationService {
	@Autowired
	StaffPersonnelInformationMapper mapper;
	
	@Override
	public void updateEmpPhotoUrlByUserName(String empPhotoUrl, String empUserName) {
		mapper.editEmpPhotoUrlByUserName(empPhotoUrl, empUserName);
	}

	@Override
	public EmployeeInformation selectStaffInfoByEmpUserName(String empUserName) {
		
		return mapper.getStaffInfoByEmpUserName(empUserName);
	}

	@Override
	public void updateEmpInfoByEmpUserName(EmployeeInformation emp) {
		mapper.editEmpInfoByEmpUserName(emp);
	}

	@Override
	public Integer selectEmpIdByEmpUserName(String empUserName) {
		
		return mapper.getEmpIdByEmpUserName(empUserName);
	}

	@Override
	public List<WagesManagement> selectStaffWagesRecords(Integer id) {
		
		return mapper.getStaffWagesRecords(id);
	}

	
}
