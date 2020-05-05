package com.graduationDesign.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.service.PersonnelInformationService;
import com.graduationDesign.utils.Msg;

@Controller
public class PersonnelInformationController {
	@Autowired
	PersonnelInformationService service;
	
	@MyOperationLog(operationContent = "人事信息统计--查看人事信息统计图表")
	@GetMapping("/personnelInformation")
	public String personnelInformation() {
		return "personnelInformation";
	}
	
	//统计性别
	@ResponseBody
	@GetMapping("/countSex")
	public Msg countSex() {
		List<Map<String, Integer>> selectCountSex = service.selectCountSex();
		return Msg.success().add("countSex", selectCountSex);
	}
	
	// 民族统计
	@ResponseBody
	@GetMapping("/countNation")
	public Msg countNation() {
		List<Map<String, Integer>> selectCountNation = service.selectCountNationType();
		return Msg.success().add("countNation", selectCountNation);
	}
	
	// 政治面貌统计
	@ResponseBody
	@GetMapping("/countPolitical")
	public Msg countPolitical() {
		List<Map<String, Integer>> selectCountPolitical = service.selectCountPoliticalType();
		return Msg.success().add("countPolitical", selectCountPolitical);
	}
	
	// 文化程度统计
	@ResponseBody
	@GetMapping("/countCulture")
	public Msg countCulture() {
		List<Map<String, Integer>> selectCountCulture = service.selectCountCultureType();
		return Msg.success().add("countCulture", selectCountCulture);
	}
	
	// 工资类型统计
	@ResponseBody
	@GetMapping("/countWages")
	public Msg countWages() {
		List<Map<String, Integer>> selectCountWages = service.selectCountWagesType();
		return Msg.success().add("countWages",selectCountWages);
	}
	
	// 职位类型统计
	@ResponseBody
	@GetMapping("/countPosition")
	public Msg countPosition() {
		List<Map<String, Integer>> selectCountPosition = service.selectCountPositionType();
		return Msg.success().add("countPosition",selectCountPosition);
	}
	
	// 部门类型统计
	@ResponseBody
	@RequestMapping("countDept")
	public Msg countDept() {
		List<Map<String, Integer>> selectCountDept = service.selectCountDeptType();
		return Msg.success().add("countDept",selectCountDept);
	}
}
