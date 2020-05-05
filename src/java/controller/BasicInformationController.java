package com.graduationDesign.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.BasicInformation;
import com.graduationDesign.service.BasicInformationService;
import com.graduationDesign.utils.GetBatchIdUtils;
import com.graduationDesign.utils.Msg;

@Controller
public class BasicInformationController {

	@Autowired
	BasicInformationService basicInformationService;
	
	//加载页面显示下拉列表内容
	@MyOperationLog(operationContent = "基础信息设置--查看基础信息列表")
	@RequestMapping(value = "/basicInformation",method = RequestMethod.GET)
	public String basic(Model model) {
		List<BasicInformation> marks = basicInformationService.selectMarks();
		model.addAttribute("marks",marks);
		return "basicInformation";  
	}
	
	//分页查询
	@ResponseBody
	@RequestMapping(value = "/informations",method = RequestMethod.GET)
	public Msg page(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,String data) {
		PageHelper.startPage(pageNum,5);
		BasicInformation basic = new BasicInformation();
		basic.setMark(data);
		List<BasicInformation> infor = basicInformationService.selectBasicInformationBySelectiveQuery(basic);
		System.err.println(infor);
		PageInfo page = new PageInfo(infor,5);
		return Msg.success().add("pageInfo",page);
	}
	
	//添加基础信息
	@MyOperationLog(operationContent = "基础信息设置--添加基础信息")
	@ResponseBody
	@RequestMapping(value = "/addbasicInfor",method = RequestMethod.POST)
	public Msg addBasicInformation(BasicInformation basic) {
		basicInformationService.insertBasicInformation(basic);
		return Msg.success();
	}
	
	//通过id查询数据
	@ResponseBody
	@RequestMapping(value = "/basicId",method = RequestMethod.GET)
	public Msg getBasicInformation(Integer id) {
		BasicInformation basic = new BasicInformation();
		basic.setId(id);
		List<BasicInformation> basicinfor = basicInformationService.selectBasicInformationBySelectiveQuery(basic);
		return Msg.success().add("information",basicinfor);
	}
	
	//更新基础信息
	@MyOperationLog(operationContent = "基础信息设置--修改基础信息")
	@ResponseBody
	@RequestMapping(value = "/updateBasicInfor/{id}",method = RequestMethod.PUT)
	public Msg updateBasicInformation(BasicInformation basic) {
		basicInformationService.updateBasicInformation(basic);
		return Msg.success();
	}
	
	//删除基础信息
	@MyOperationLog(operationContent = "基础信息设置--删除基础信息")
	@ResponseBody
	@RequestMapping(value = "/deleteBasicInfor/{id}",method = RequestMethod.DELETE)
	public Msg deleteBasicInformation(@PathVariable("id")Integer id) {
		basicInformationService.deleteBasicInformation(id);
		return Msg.success();
	}
	
	//批量删除基础信息
	@MyOperationLog(operationContent = "基础信息设置--批量删除基础信息")
	@ResponseBody
	@RequestMapping(value = "/batchDeleteBasicInfor/{id}",method = RequestMethod.DELETE)
	public Msg batchDelete(@PathVariable("id")String id) {
		List<Integer> batchId = GetBatchIdUtils.batchId(id);
		basicInformationService.batchDeletBasicInformation(batchId);
		return Msg.success();
	}
}
