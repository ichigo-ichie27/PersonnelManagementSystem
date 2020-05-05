package com.graduationDesign.service;

import java.util.List;
import java.util.Map;

import com.graduationDesign.entity.PartEmployeeInformation;
import com.graduationDesign.entity.PartEmployeeInformation2;

public interface PartEmployeeInformationService {

	// 有选择的查询数据
	List<PartEmployeeInformation> selectPartEmployeeInformationBySelectQuery(PartEmployeeInformation employee);

	// 删除员工信息
	void deletePartEmployeeInformation(Integer id);

	// 批量删除员工信息
	void batchDeletePartEmployeeInformation(List<Integer> id);

	// 查询用户名
	List<String> selectUserName();

	// 查询文化程度类型
	List<Map<String, Integer>> selectCultureTypeName();

	// 查询职位类型
	List<Map<String, Integer>> selectPositionTypeName();

	// 查询部门类型
	List<Map<String, Integer>> selectDeptTypeName();

	// 查询民族类型
	List<Map<String, Integer>> selectNationTypeName();

	// 查询政治面貌类型
	List<Map<String, Integer>> selectPoliticalTypeName();

	// 添加人事信息
	void insertEmpInfo(PartEmployeeInformation2 employeeInformation);

	// 修改人事信息
	void updateEmpInfo(PartEmployeeInformation2 employeeInformation);

	// 通过id查询数据
	PartEmployeeInformation2 selectEmpInfoById(Integer id);

}
