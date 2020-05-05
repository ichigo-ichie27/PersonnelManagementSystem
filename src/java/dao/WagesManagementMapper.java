package com.graduationDesign.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.graduationDesign.entity.WagesManagement;

public interface WagesManagementMapper {

	// 有选择性查询工资记录
	List<WagesManagement> getWagesManagementBySelectiveQuery(WagesManagement wages);

	// 删除工资记录
	int moveWagesManagement(Integer id);

	// 批量删除工资记录
	int batchDeleteWagesManagement(List<Integer> id);

	// 添加工资记录
	int addWagesManagement(WagesManagement wages);

	// 修改工资记录
	int editWagesManagement(WagesManagement wages);

	// 工资统计
	List<Map<String, BigDecimal>> getCountWages();

	// 得到员工姓名和id
	List<Map<String, Integer>> getEmpNameAndId();
}
