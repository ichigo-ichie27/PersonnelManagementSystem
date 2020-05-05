package com.graduationDesign.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.EmployeeInformation;
import com.graduationDesign.entity.WagesManagement;
import com.graduationDesign.service.StaffPersonnelInformationService;
import com.graduationDesign.utils.Msg;
import com.graduationDesign.utils.UploadImgUtils;

@Controller
public class StaffPersonnelInformationController {
	@Autowired
	StaffPersonnelInformationService service;
	@Autowired
	HttpServletRequest req;
	
	@MyOperationLog(operationContent = "个人信息设置--查看个人信息")
	@GetMapping("/userInformation")
	public String userInformationPage() {
		return "userInformation";
	}

	// 通过用户名获取员工信息
	@ResponseBody
	@GetMapping("/getStaffInfo")
	public Msg getStaffInfo() {
		String empUserName = req.getSession().getAttribute("userName").toString();
		EmployeeInformation staffInfo = service.selectStaffInfoByEmpUserName(empUserName);
		return Msg.success().add("staffInfo", staffInfo);
	}

	// 上传图片
	@MyOperationLog(operationContent = "个人信息设置--上传个人相片")
	@ResponseBody
	@RequestMapping("/editEmpPhoto")
	public Msg editEmpPhoto(MultipartFile file) throws Exception {
		String userName = req.getSession().getAttribute("userName").toString();
		String photoRelativePath = UploadImgUtils.returnRelativePath(file);
		service.updateEmpPhotoUrlByUserName(photoRelativePath, userName);
		return Msg.success();
	}
	
	//通过用户名修改员工信息
	@MyOperationLog(operationContent = "个人信息设置--修改个人信息")
	@ResponseBody
	@PutMapping("/updateStaffInfo/{empUserName}")
	public Msg editStaffInfo(EmployeeInformation emp) {
		service.updateEmpInfoByEmpUserName(emp);
		return Msg.success();
	}
	
	//通过用户名获取员工id
	@ResponseBody
	@GetMapping("/getStaffId")
	public Msg getEmpId() {
		String userName = req.getSession().getAttribute("userName").toString();
		Integer id = service.selectEmpIdByEmpUserName(userName);
		return Msg.success().add("id",id);
	}
	
	//分页显示员工工资记录
	@ResponseBody
	@GetMapping("/getEmpWages")
	public Msg getEmpWagesRecords(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,Integer id) {
		PageHelper.startPage(pageNum,4);
		List<WagesManagement> empWages = service.selectStaffWagesRecords(id);
		PageInfo pageInfo = new PageInfo(empWages,5);
		return Msg.success().add("pageInfo",pageInfo);
	}

}
