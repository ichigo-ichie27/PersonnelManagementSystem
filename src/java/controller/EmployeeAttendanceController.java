package com.graduationDesign.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.AttendanceRecord;
import com.graduationDesign.service.EmployeeAttendanceService;
import com.graduationDesign.utils.Msg;

@Controller
public class EmployeeAttendanceController {
	@Autowired
	EmployeeAttendanceService service;

	@GetMapping("/clockIn")
	public String clockInPage(HttpServletRequest req) {
		String empName = req.getSession().getAttribute("userName").toString();
		Integer getEmpId = service.selectEmpIdByEmpName(empName);
		System.err.println(getEmpId);
		req.getSession().setAttribute("empId", getEmpId);
		return "clockIn";
	}
	
	//分页显示
	@MyOperationLog(operationContent = "上下班打卡--查看个人考勤记录列表")
	@ResponseBody
	@GetMapping("/empAttendanceRecord")
	public Msg employeeAttendance(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,String startTime,String endTime,HttpServletRequest req) {
		PageHelper.startPage(pageNum,3);
		String empName = req.getSession().getAttribute("userName").toString();
		AttendanceRecord record = new AttendanceRecord();
		record.setEmpUserName(empName);
		record.setSameDayTime(startTime);
		record.setSameDayTime2(endTime);
		List<AttendanceRecord> PersonnelAttendances = service.selectPersonnelAttendancesBySelectiveQuery(record);
		PageInfo page = new PageInfo(PersonnelAttendances,5);
		return Msg.success().add("pageInfo", page);
	}
	
//	//删除个人考勤记录
//	@ResponseBody
//	@DeleteMapping("/delEmpAttendance/{id}")
//	public Msg delEmpAttendance(@PathVariable("id")Integer id) {
//		service.deletePersonnelAttendance(id);
//		return Msg.success();
//	}
//	
//	//批量删除个人考勤记录
//	@ResponseBody
//	@DeleteMapping("/batchDelEmpAttendance/{id}")
//	public Msg batchDelEmpAttendance(@PathVariable("id")String id) {
//		List<Integer> batchId = BatchDeleteUtils.batchId(id);
//		service.batchDeletePersonnelAttendance(batchId);
//		return Msg.success();
//	}
	
	//添加员工打卡记录
	@MyOperationLog(operationContent = "上下班打卡--添加考勤记录")
	@ResponseBody
	@PostMapping("/addAttendance")
	public Msg addAttendance(String clockType,HttpServletRequest req) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(date);
		String str = req.getSession().getAttribute("empId").toString();
		AttendanceRecord record = new AttendanceRecord();
		record.setClockTime(new Date());
		record.setClockType(clockType);
		record.setSameDayTime(format);
		record.setEmpId(Integer.parseInt(str));
		service.insertEmpAttendance(record);
		return Msg.success();
	}
}
