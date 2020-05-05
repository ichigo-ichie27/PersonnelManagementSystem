package com.graduationDesign.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.WorkExperience;
import com.graduationDesign.service.WorkExperienceService;
import com.graduationDesign.utils.Msg;

@Controller
public class WorkExperienceController {
	@Autowired
	WorkExperienceService service;
	
	//获取员工工作经历
	@ResponseBody
	@GetMapping("/empWorkExperience")
	public Msg empWorkExperience(Integer id) {
		List<WorkExperience> empExperiences = service.selectEmpWorkExperience(id);
		return Msg.success().add("WorkExperience", empExperiences);
	}
	
	//添加工作经历
	@MyOperationLog(operationContent = "个人信息设置--添加个人工作经历")
	@ResponseBody
	@PostMapping("/insertWorkExperience")
	public Msg insertWorkExperience(WorkExperience work) {
		service.insertWorkExperience(work);
		return Msg.success();
	}
	
	//回显数据
	@ResponseBody
	@GetMapping("/getWorkInfo")
	public Msg selectStaffInfoById(Integer id) {
		WorkExperience staffInfo = service.selectStaffInfoById(id);
		return Msg.success().add("staffInfo", staffInfo);
	}
	
	//修改员工工作经历
	@MyOperationLog(operationContent = "个人信息设置--修改个人工作经历")
	@ResponseBody
	@PutMapping("/editStaffWorkInfo/{id}")
	public Msg updateStaffInfoById(WorkExperience work) {
		service.updateStaffInfoById(work);
		return Msg.success();
	}
	
	//删除员工工作经历
	@MyOperationLog(operationContent = "个人信息设置--删除个人工作经历")
	@ResponseBody
	@DeleteMapping("/deleteStaffWorkInfo/{id}")
	public Msg delStaffWorkInfo(@PathVariable("id")Integer id) {
		service.deleteStaffWorkInfo(id);
		return Msg.success();
	}
}
