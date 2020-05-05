package com.graduationDesign.dao;

import java.util.List;
import java.util.Map;

import com.graduationDesign.entity.PartEmployeeInformation;
import com.graduationDesign.entity.PartEmployeeInformation2;

public interface PartEmployeeInformationMapper {
	
	//有选择的查询数据
	List<PartEmployeeInformation> getPartEmployeeInformationBySelectQuery(PartEmployeeInformation employee);
	
	//删除员工信息
	int movePartEmployeeInformation(Integer id);
	
	//批量删除员工信息
	int batchMovePartEmployeeInformation(List<Integer> id);
	
	//查询用户名
	List<String> getUserName();
	
	//查询文化程度类型
	List<Map<String,Integer>> getCultureTypeName();
	
	//查询职位类型
	List<Map<String,Integer>> getPositionTypeName();
	
	//查询部门类型
	List<Map<String,Integer>> getDeptTypeName();
	
	//查询民族类型
	List<Map<String,Integer>> getNationTypeName();
	
	//查询政治面貌类型
	List<Map<String,Integer>> getPoliticalTypeName();
	
	//添加人事信息
	int addEmpInfo(PartEmployeeInformation2 employeeInformation);
	
	//修改人事信息
	int editEmpInfo(PartEmployeeInformation2 employeeInformation);
	
	//通过id查询数据
	PartEmployeeInformation2 getEmpInfoById(Integer id);
}
