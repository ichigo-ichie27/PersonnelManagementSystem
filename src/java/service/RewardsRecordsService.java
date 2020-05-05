package com.graduationDesign.service;

import java.util.List;

import com.graduationDesign.entity.RewardsRecords;

public interface RewardsRecordsService {

	//查询员工奖惩记录
	List<RewardsRecords> selectRewardsRecords(Integer id);
	
	//插入数据
	void insertRewardsRecord(RewardsRecords records);
}
