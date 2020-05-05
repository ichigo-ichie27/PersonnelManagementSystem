package com.graduationDesign.service;

import java.util.List;

import com.graduationDesign.entity.EmployeeInformation;
import com.graduationDesign.entity.WagesManagement;

public interface StaffPersonnelInformationService {

	// 通过用户名获取员工信息
	EmployeeInformation selectStaffInfoByEmpUserName(String empUserName);

	// 通过用户名修改图片
	void updateEmpPhotoUrlByUserName(String empPhotoUrl, String empUserName);

	// 通过用户名修改信息
	void updateEmpInfoByEmpUserName(EmployeeInformation emp);

	// 通过用户名获取员工id
	Integer selectEmpIdByEmpUserName(String empUserName);

	// 通过员工id得到员工工资记录
	List<WagesManagement> selectStaffWagesRecords(Integer id);
}
