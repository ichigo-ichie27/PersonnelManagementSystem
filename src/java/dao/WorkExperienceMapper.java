package com.graduationDesign.dao;

import java.util.List;

import com.graduationDesign.entity.WorkExperience;

public interface WorkExperienceMapper {
	
	//查询员工工作经历
	List<WorkExperience> getEmpWorkExperience(Integer id);
	
	//添加工作经历
	int addWorkExperience(WorkExperience work);
	
	//通过id得到员工工作经历
	WorkExperience getStaffInfoById(Integer id);
	
	//通过id修改员工工作经历
	int editStaffInfoById(WorkExperience work);
	
	//通过id删除员工工作经历
	int moveStaffWorkInfo(Integer id);
}
