package com.graduationDesign.dao;

import java.util.List;
import java.util.Map;

public interface PersonnelInformationMapper {

	// 性别统计
	List<Map<String, Integer>> getCountSex();

	// 民族统计
	List<Map<String, Integer>> getCountNationType();

	// 政治面貌统计
	List<Map<String, Integer>> getCountPoliticalType();

	// 文化程度统计
	List<Map<String, Integer>> getCountCultureType();

	// 工资类型统计
	List<Map<String, Integer>> getCountWagesType();

	// 职位类型统计
	List<Map<String, Integer>> getCountPositionType();

	// 部门类型统计
	List<Map<String, Integer>> getCountDeptType();
}
