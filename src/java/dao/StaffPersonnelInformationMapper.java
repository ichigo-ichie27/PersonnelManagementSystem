package com.graduationDesign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.graduationDesign.entity.EmployeeInformation;
import com.graduationDesign.entity.WagesManagement;

public interface StaffPersonnelInformationMapper {

	// 通过用户名获取员工信息
	EmployeeInformation getStaffInfoByEmpUserName(String empUserName);

	// 通过用户名修改图片
	int editEmpPhotoUrlByUserName(@Param("empPhotoUrl") String empPhotoUrl, @Param("empUserName") String empUserName);

	// 通过用户名修改信息
	int editEmpInfoByEmpUserName(EmployeeInformation emp);

	// 通过用户名获取员工id
	Integer getEmpIdByEmpUserName(String empUserName);
	
	//通过员工id得到员工工资记录
	List<WagesManagement> getStaffWagesRecords(Integer id);
}
