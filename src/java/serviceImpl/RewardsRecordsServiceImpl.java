package com.graduationDesign.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.RewardsRecordsMapper;
import com.graduationDesign.entity.RewardsRecords;
import com.graduationDesign.service.RewardsRecordsService;
@Service
public class RewardsRecordsServiceImpl implements RewardsRecordsService {
	@Autowired
	RewardsRecordsMapper mapper;
	
	@Override
	public List<RewardsRecords> selectRewardsRecords(Integer id) {
		
		return mapper.getRewardsRecords(id);
	}

	@Override
	public void insertRewardsRecord(RewardsRecords records) {
		
		mapper.addRewardsRecord(records);
	}

}
