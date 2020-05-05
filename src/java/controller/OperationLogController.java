package com.graduationDesign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.OperationLog;
import com.graduationDesign.service.OperationLogService;
import com.graduationDesign.utils.GetBatchIdUtils;
import com.graduationDesign.utils.Msg;

@Controller
public class OperationLogController {
	@Autowired
	OperationLogService service;
	
	@MyOperationLog(operationContent = "系统操作日志--查看系统操作日志列表")
	@GetMapping("/journal")
	public String journalPage() {
		return "journal";
	}
	
	//分页显示系统操作日志
	@ResponseBody
	@GetMapping("/getOperationLogs")
	public Msg getOperationLogs(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,String operator,String startTime,String endTime) {
		PageHelper.startPage(pageNum,5);
		OperationLog log = new OperationLog();
		log.setOperator(operator);
		log.setOperationCurrentTime(startTime);
		log.setOperationCurrentTime2(endTime);
		List<OperationLog> OperationLogs = service.selectOperationLogsBySelectiveQuery(log);
		PageInfo pageInfo = new PageInfo(OperationLogs,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	//删除日志记录
	@MyOperationLog(operationContent = "系统操作日志--删除日志记录")
	@ResponseBody
	@DeleteMapping("/deleteOperationLog/{id}")
	public Msg deleteOperationLog(@PathVariable("id")Integer id) {
		service.deleteOperationLogById(id);
		return Msg.success();
	}
	
	//批量删除日志记录
	@MyOperationLog(operationContent = "系统操作日志--批量删除日志记录")
	@ResponseBody
	@DeleteMapping("/batchDeleteOperationLogs/{id}")
	public Msg batchDeleteOperationLog(@PathVariable("id")String id) {
		List<Integer> batchId = GetBatchIdUtils.batchId(id);
		service.batchDeleteOperationLog(batchId);
		return Msg.success();
	}
}
