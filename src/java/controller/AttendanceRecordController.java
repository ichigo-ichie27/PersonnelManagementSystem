package com.graduationDesign.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.graduationDesign.dao.AttendanceRecordMapper;
import com.graduationDesign.entity.AttendanceRecord;
import com.graduationDesign.entity.RewardsRecords;
import com.graduationDesign.service.AttendanceRecordService;
import com.graduationDesign.service.RewardsRecordsService;
import com.graduationDesign.utils.GetBatchIdUtils;
import com.graduationDesign.utils.Msg;

@Controller
public class AttendanceRecordController {
	@Autowired
	AttendanceRecordService service;
	@Autowired
	RewardsRecordsService rewards;
	
	@MyOperationLog(operationContent = "考勤记录--查看考勤记录列表")
	@GetMapping("/attendanceRecord")
	public String attendanceRecordPage() {
		return "attendanceRecord";
	}
	
	//分页显示数据
	@ResponseBody
	@GetMapping("/attendanceInfo")
	public Msg attendanceRecords(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,String empName,String startTime,String endTime) {
		PageHelper.startPage(pageNum,5);
		AttendanceRecord aRecord = new AttendanceRecord();
		aRecord.setEmpUserName(empName);
		aRecord.setSameDayTime(startTime);
		aRecord.setSameDayTime2(endTime);
		List<AttendanceRecordMapper> selectAttendanceRecord = service.selectAttendanceRecordInfoBySelectQuery(aRecord);
		PageInfo page = new PageInfo(selectAttendanceRecord,5);
		return Msg.success().add("pageInfo", page); 
	}
	
	//修改状态
	@MyOperationLog(operationContent = "考勤记录--修改状态")
	@ResponseBody
	@PutMapping("/updateState")
	public Msg UpdateState(Integer id,String state,HttpServletRequest req) {
		AttendanceRecord aRecord = new AttendanceRecord();
		aRecord.setId(id);
		aRecord.setState(state);
		service.updateStateById(aRecord);
		return Msg.success();
	}
	
	//状态改变添加奖惩记录
	@MyOperationLog(operationContent = "考勤记录--添加奖惩记录")
	@ResponseBody
	@PostMapping("/insertRewards")
	public Msg insertRewards(Integer empId,Integer rewardsTypeId,HttpServletRequest req) {
		String userName = req.getSession().getAttribute("userName").toString();
		RewardsRecords re = new RewardsRecords();
		re.setEmpId(empId);
		re.setRewardsTypeId(rewardsTypeId);
		re.setRewardsTime(new Date());
		re.setApprover(userName);
		rewards.insertRewardsRecord(re);
		return Msg.success();
	}
	
	//删除数据
	@MyOperationLog(operationContent = "考勤记录--删除考勤记录")
	@ResponseBody
	@DeleteMapping("/deleteAttendance/{id}")
	public Msg deleteAttendance(@PathVariable("id")Integer id) {
		service.deleteAttendanceRecord(id);
		return Msg.success();
	}
	
	//批量删除数据
	@MyOperationLog(operationContent = "考勤记录--批量删除考勤记录")
	@ResponseBody
	@DeleteMapping("/batchDelete/{id}")
	public Msg batchDeleteAttendance(@PathVariable("id")String id) {
		List<Integer> batchId = GetBatchIdUtils.batchId(id);
		service.batchDeleteAttendanceRecord(batchId);
		return Msg.success();
	}
}
