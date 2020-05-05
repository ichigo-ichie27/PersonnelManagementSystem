package com.graduationDesign.service;

import java.util.List;

import com.graduationDesign.entity.BasicInformation;

public interface BasicInformationService {
	
	//有选择性的查询
	List<BasicInformation> selectBasicInformationBySelectiveQuery(BasicInformation basic);
	
	//查询基础信息表的类别标识
	List<BasicInformation> selectMarks();
	
	//通过类别标识查询数据
	List<BasicInformation> selectBasicInformationsByMark(String mark);
	
	//添加基础信息
	void insertBasicInformation(BasicInformation basic);
	
	//更新基础信息
	void updateBasicInformation(BasicInformation basic);
	
	//删除基础信息
	void deleteBasicInformation(Integer id);
	
	//批量删除基础信息
	void batchDeletBasicInformation(List<Integer> id);
}
