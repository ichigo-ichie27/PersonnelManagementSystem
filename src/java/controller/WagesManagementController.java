package com.graduationDesign.controller;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.WagesManagement;
import com.graduationDesign.service.PartEmployeeInformationService;
import com.graduationDesign.service.WagesManagementService;
import com.graduationDesign.utils.GetBatchIdUtils;
import com.graduationDesign.utils.Msg;

@Controller
public class WagesManagementController {
	@Autowired
	WagesManagementService service;
	@Autowired
	PartEmployeeInformationService emp;
	
	@MyOperationLog(operationContent = "工资记录--查看工资记录列表")
	@GetMapping("/wagesRecord")
	public String wagesRecords() {
		return "wagesRecord";
	}
	
	//分页显示数据
	@ResponseBody
	@GetMapping("wagesManagement")
	public Msg wagesManagement(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,String empName,Integer years,Integer months) {
		PageHelper.startPage(pageNum, 5);
		WagesManagement wages = new WagesManagement();
		wages.setEmpName(empName);
		wages.setYears(years);
		wages.setMonths(months);
		List<WagesManagement> WagesManagement = service.selectWagesManagementBySelectiveQuery(wages);
		PageInfo page = new PageInfo(WagesManagement,5);
		return Msg.success().add("pageInfo", page);
	}
	
	//删除工资记录
	@MyOperationLog(operationContent = "工资记录--删除工资记录")
	@ResponseBody
	@DeleteMapping("/deleteWages/{id}")
	public Msg deleteWages(@PathVariable("id")Integer id) {
		service.deleteWagesManagement(id);
		return Msg.success();
	}
	
	//批量删除工资记录
	@MyOperationLog(operationContent = "工资记录--批量删除工资记录")
	@ResponseBody
	@DeleteMapping("/batchDeleteWages/{id}")
	public Msg batchDeleteWages(@PathVariable("id")String id) {
		List<Integer> batchId = GetBatchIdUtils.batchId(id);
		service.batchDeleteWagesManagement(batchId);
		return Msg.success();
	}
	
	//添加工资记录
	@MyOperationLog(operationContent = "工资记录--添加工资记录")
	@ResponseBody
	@PostMapping("/insertWages")
	public Msg insertWages(WagesManagement wages) {
		service.insertWagesManagement(wages);
		return Msg.success();
	}
	
	//通过id查询数据
	@ResponseBody
	@GetMapping("/selectWagesById")
	public Msg selectWagesById(Integer id) {
		WagesManagement wages = new WagesManagement();
		wages.setId(id);
		List<WagesManagement> getWagesById = service.selectWagesManagementBySelectiveQuery(wages);
		return Msg.success().add("getWagesById", getWagesById);
	}
	
	//通过id修改数据
	@MyOperationLog(operationContent = "工资记录--修改工资记录")
	@ResponseBody
	@PutMapping("/updateWages/{id}")
	public Msg updateWages(WagesManagement wages) {
		service.updateWagesManagement(wages);
		return Msg.success();
	}
	
	//工资统计
	@MyOperationLog(operationContent = "工资记录--查看工资统计图表")
	@ResponseBody
	@GetMapping("/sumWages")
	public Msg sumWages() {
		List<Map<String, BigDecimal>> countWage = service.selectCountWages();
		return Msg.success().add("countWages", countWage);
	}
	
	//查询员工姓名和id
	@ResponseBody
	@GetMapping("/getEmpInfo")
	public Msg getEmpInfo() {
		List<Map<String, Integer>> EmpNameAndId = service.selectEmpNameAndId();
		return Msg.success().add("empInfo", EmpNameAndId);
	}
}
