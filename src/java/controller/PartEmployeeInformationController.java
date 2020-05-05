package com.graduationDesign.controller;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.PartEmployeeInformation;
import com.graduationDesign.entity.PartEmployeeInformation2;
import com.graduationDesign.service.PartEmployeeInformationService;
import com.graduationDesign.utils.GetBatchIdUtils;
import com.graduationDesign.utils.Msg;

@Controller
public class PartEmployeeInformationController {
	
	@Autowired
	PartEmployeeInformationService service;
	
	@MyOperationLog(operationContent = "人事档案浏览--查看人事档案列表")
	@RequestMapping(value = "/partEmployeeInformation",method = RequestMethod.GET)
	public String partEmployeeInformationPage() {
		return "partEmployeeInformation";
	}
	
	
	//分页显示
	@ResponseBody
	@RequestMapping(value = "/partEmployeeInformations",method = RequestMethod.GET)
	public Msg partEmployeeInformations(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,String empName) {
		PageHelper.startPage(pageNum, 5);
		PartEmployeeInformation employee = new PartEmployeeInformation();
		employee.setEmpName(empName);
		List<PartEmployeeInformation> empInformations = service.selectPartEmployeeInformationBySelectQuery(employee);
		PageInfo page = new PageInfo(empInformations,5);
		return Msg.success().add("empInfor",page);
	}
	
	//删除员工信息
	@MyOperationLog(operationContent = "人事档案浏览--删除人事信息")
	@ResponseBody
	@RequestMapping(value = "/deletePartEmpInfo/{id}",method = RequestMethod.DELETE)
	public Msg deletePartEmpInfo(@PathVariable("id")Integer id) {
		service.deletePartEmployeeInformation(id);
		return Msg.success();
	}
	
	//批量删除员工信息
	@MyOperationLog(operationContent = "人事档案浏览--批量删除人事信息")
	@ResponseBody
	@RequestMapping(value = "/batchDeletePartEmpInfo/{id}",method = RequestMethod.DELETE)
	public Msg batchDeletePartEmpInfo(@PathVariable("id")String id) {
		List<Integer> batchId = GetBatchIdUtils.batchId(id);
		service.batchDeletePartEmployeeInformation(batchId);
		return Msg.success();
	}
	
	//查询用户名
	@ResponseBody
	@GetMapping("/getUserName")
	public Msg getUserName() {
		List<String> userName = service.selectUserName();
		return Msg.success().add("info",userName);
	}
	
	//查询文化程度类型
	@ResponseBody
	@GetMapping("/getCultureName")
	public Msg getCultureName() {
		List<Map<String, Integer>> cultureName = service.selectCultureTypeName();
		return Msg.success().add("info", cultureName);
	}
	
	//查询职位类型
	@ResponseBody
	@GetMapping("/getPositionName")
	public Msg getPositionName() {
		List<Map<String, Integer>> positionName = service.selectPositionTypeName();
		return Msg.success().add("info", positionName);
	}
	
	//查询部门类型
	@ResponseBody
	@GetMapping("/getDeptName")
	public Msg getDeptName() {
		List<Map<String, Integer>> deptName = service.selectDeptTypeName();
		return Msg.success().add("info", deptName);
	}
	
	//查询民族类型
	@ResponseBody
	@GetMapping("/getNationName")
	public Msg getNationName() {
		List<Map<String, Integer>> nationName = service.selectNationTypeName();
		return Msg.success().add("info", nationName);
	}
	
	//查询政治面貌类型
	@ResponseBody
	@GetMapping("/getPoliticalName")
	public Msg getPoliticalName() {
		List<Map<String, Integer>> politicalName = service.selectPoliticalTypeName();
		return Msg.success().add("info", politicalName);
	}
	
	//添加人事信息
	@MyOperationLog(operationContent = "人事档案浏览--添加人事信息")
	@ResponseBody
	@PostMapping("/insertEmpInfo")
	public Msg insertEmpInfo(PartEmployeeInformation2 employeeInformation) {
		service.insertEmpInfo(employeeInformation);
		return Msg.success();
	}
	
	//通过id查询数据
	@ResponseBody
	@GetMapping("/getEmpInfoById")
	public Msg selectEmpInfoById(Integer id) {
		PartEmployeeInformation2 empInfo = service.selectEmpInfoById(id);
		return Msg.success().add("empInfo", empInfo);
	}
	
	//修改人事信息
	@MyOperationLog(operationContent = "人事档案浏览--修改人事信息")
	@ResponseBody
	@PutMapping("/updateEmpInfo/{id}")
	public Msg updateEmpInfo(PartEmployeeInformation2 employeeInformation) {
		service.updateEmpInfo(employeeInformation);
		return Msg.success();
	}
}
