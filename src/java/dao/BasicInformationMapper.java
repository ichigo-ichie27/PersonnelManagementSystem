package com.graduationDesign.dao;

import java.util.List;
import com.graduationDesign.entity.BasicInformation;

public interface BasicInformationMapper {
	
	//有选择性的查询
	List<BasicInformation> getBasicInformationBySelectiveQuery(BasicInformation basicInformation);
	
	//查询基础信息表的类别标识
	List<BasicInformation> getMarks();
	
	//通过类别标识查询数据
	List<BasicInformation> getBasicInformationsByMark(String mark);
	
	//添加基础信息
	int addBasicInformation(BasicInformation basic);
	
	//更新基础信息
	int editBasicInformation(BasicInformation basic);
	
	//删除基础信息                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
	int moveBasicInformation(Integer id);
	
	//批量删除基础信息
	int batchDeleteBasicInformation(List<Integer> id);
	
	
	
}
