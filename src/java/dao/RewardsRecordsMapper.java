package com.graduationDesign.dao;

import java.util.List;

import com.graduationDesign.entity.RewardsRecords;

public interface RewardsRecordsMapper {
	
	//查询员工奖惩记录
	List<RewardsRecords> getRewardsRecords(Integer id);
	
	//插入数据
	int addRewardsRecord(RewardsRecords records);
}
