package com.graduationDesign.serviceImpl;

import java.util.List;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.WorkExperienceMapper;
import com.graduationDesign.entity.WorkExperience;
import com.graduationDesign.service.WorkExperienceService;
@Service
public class WorkExperienceServiceImpl implements WorkExperienceService {
	@Autowired
	WorkExperienceMapper mapper;
	
	@Override
	public List<WorkExperience> selectEmpWorkExperience(Integer id) {
		
		return mapper.getEmpWorkExperience(id);
	}

	@Override
	public void insertWorkExperience(WorkExperience work) {
		mapper.addWorkExperience(work);
	}

	@Override
	public WorkExperience selectStaffInfoById(Integer id) {
		return mapper.getStaffInfoById(id);
	}

	@Override
	public void updateStaffInfoById(WorkExperience work) {
		mapper.editStaffInfoById(work);
	}

	@Override
	public void deleteStaffWorkInfo(Integer id) {
		mapper.moveStaffWorkInfo(id);
	}

}
