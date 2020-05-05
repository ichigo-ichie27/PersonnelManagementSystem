package com.graduationDesign.service;

import java.util.List;

import com.graduationDesign.entity.WorkExperience;

public interface WorkExperienceService {

	// 查询员工工作经历
	List<WorkExperience> selectEmpWorkExperience(Integer id);

	// 添加工作经历
	void insertWorkExperience(WorkExperience work);

	// 通过id得到员工工作经历
	WorkExperience selectStaffInfoById(Integer id);

	// 通过id修改员工工作经历
	void updateStaffInfoById(WorkExperience work);

	// 通过id删除员工工作经历
	void deleteStaffWorkInfo(Integer id);
}
