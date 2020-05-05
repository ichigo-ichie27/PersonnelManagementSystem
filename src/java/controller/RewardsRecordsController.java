package com.graduationDesign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.graduationDesign.entity.RewardsRecords;
import com.graduationDesign.service.RewardsRecordsService;
import com.graduationDesign.utils.Msg;

import lombok.experimental.Helper;

@Controller
public class RewardsRecordsController {
	@Autowired
	RewardsRecordsService service;
	
	//获取员工奖惩记录
	@ResponseBody
	@GetMapping("/empRewardsRecords")
	public Msg empRewardsRecords(Integer id) {
		List<RewardsRecords> RewardsRecords = service.selectRewardsRecords(id);
		return Msg.success().add("RewardsRecords", RewardsRecords);
	}
	
	//分页显示员工奖惩记录
	@ResponseBody
	@GetMapping("/staffRewards")
	public Msg staffRewards(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,Integer id) {
		PageHelper.startPage(pageNum,4);
		List<RewardsRecords> rewardsRecords = service.selectRewardsRecords(id);
		PageInfo pageInfo = new PageInfo(rewardsRecords,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
}
