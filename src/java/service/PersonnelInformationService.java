package com.graduationDesign.service;

import java.util.List;
import java.util.Map;

public interface PersonnelInformationService {

	// 性别统计
	List<Map<String, Integer>> selectCountSex();

	// 民族统计
	List<Map<String, Integer>> selectCountNationType();

	// 政治面貌统计
	List<Map<String, Integer>> selectCountPoliticalType();

	// 文化程度统计
	List<Map<String, Integer>> selectCountCultureType();

	// 工资类型统计
	List<Map<String, Integer>> selectCountWagesType();

	// 职位类型统计
	List<Map<String, Integer>> selectCountPositionType();

	// 部门类型统计
	List<Map<String, Integer>> selectCountDeptType();
}
