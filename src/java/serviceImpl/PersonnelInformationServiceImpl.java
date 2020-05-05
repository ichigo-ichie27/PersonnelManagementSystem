package com.graduationDesign.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.PartEmployeeInformationMapper;
import com.graduationDesign.dao.PersonnelInformationMapper;
import com.graduationDesign.service.PersonnelInformationService;

@Service
public class PersonnelInformationServiceImpl implements PersonnelInformationService {
	
	@Autowired
	PersonnelInformationMapper mapper;
	
	@Override
	public List<Map<String, Integer>> selectCountSex() {
		
		return mapper.getCountSex();
	}

	@Override
	public List<Map<String, Integer>> selectCountNationType() {
		
		return mapper.getCountNationType();
	}

	@Override
	public List<Map<String, Integer>> selectCountPoliticalType() {
		
		return mapper.getCountPoliticalType();
	}

	@Override
	public List<Map<String, Integer>> selectCountCultureType() {
		
		return mapper.getCountCultureType();
	}

	@Override
	public List<Map<String, Integer>> selectCountWagesType() {
		
		return mapper.getCountWagesType();
	}

	@Override
	public List<Map<String, Integer>> selectCountPositionType() {
		
		return mapper.getCountPositionType();
	}

	@Override
	public List<Map<String, Integer>> selectCountDeptType() {
		
		return mapper.getCountDeptType();
	}


}
