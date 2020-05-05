package com.graduationDesign.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.graduationDesign.entity.WagesManagement;

public interface WagesManagementService {

	// 有选择性查询工资记录
	List<WagesManagement> selectWagesManagementBySelectiveQuery(WagesManagement wages);

	// 删除工资记录
	void deleteWagesManagement(Integer id);

	// 批量删除工资记录
	void batchDeleteWagesManagement(List<Integer> id);

	// 添加工资记录
	void insertWagesManagement(WagesManagement wages);

	// 修改工资记录
	void updateWagesManagement(WagesManagement wages);

	// 工资统计
	List<Map<String, BigDecimal>> selectCountWages();

	// 得到员工姓名和id
	List<Map<String, Integer>> selectEmpNameAndId();
}
