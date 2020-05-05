package com.graduationDesign.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.BasicInformationMapper;
import com.graduationDesign.entity.BasicInformation;
import com.graduationDesign.service.BasicInformationService;

@Service
public class BasicInformationServiceImpl implements BasicInformationService{
	
	@Autowired
	BasicInformationMapper basicInformationMapper;

	@Override
	public List<BasicInformation> selectMarks() {
		
		return basicInformationMapper.getMarks();
	}

	@Override
	public List<BasicInformation> selectBasicInformationsByMark(String mark) {
		
		return basicInformationMapper.getBasicInformationsByMark(mark);
	}

	@Override
	public List<BasicInformation> selectBasicInformationBySelectiveQuery(BasicInformation basic) {
		
		return basicInformationMapper.getBasicInformationBySelectiveQuery(basic);
	}

	@Override
	public void insertBasicInformation(BasicInformation basic) {
		
		basicInformationMapper.addBasicInformation(basic);
	}

	@Override
	public void updateBasicInformation(BasicInformation basic) {
		
		basicInformationMapper.editBasicInformation(basic);
	}

	@Override
	public void deleteBasicInformation(Integer id) {
		
		basicInformationMapper.moveBasicInformation(id);
		
	}

	@Override
	public void batchDeletBasicInformation(List<Integer> id) {
		
		basicInformationMapper.batchDeleteBasicInformation(id);
		
	}
	
	
}
