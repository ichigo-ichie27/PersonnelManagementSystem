package com.graduationDesign.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.service.AuthorityService;
import com.graduationDesign.service.UserService;
import com.graduationDesign.utils.Msg;

@Controller
public class AuthorityController {
	@Autowired
	AuthorityService service;
	@Autowired
	UserService uService;
	
	@MyOperationLog(operationContent = "权限管理--查看系统模块")
	@GetMapping("/authority")
	public String authorityPage(Model model) {
		List<Map<String, Integer>> role = uService.selectRoleNameByBasicInfo();
		model.addAttribute("role",role);
		return "authority";
	}
	
	//获取全部模块
	@ResponseBody
	@GetMapping("/getModules")
	public Msg getModules() {
		List<Map<String, Integer>> modules = service.selectModules();
		return Msg.success().add("modules",modules);
	}
	
	//修改角色权限
	@MyOperationLog(operationContent = "权限管理--授权角色权限")
	@ResponseBody
	@PutMapping("/updateAuthority/{roleId}")
	public Msg updateAuthorityByRole(String moduleIdStr,@PathVariable("roleId")Integer roleId) {
		service.updateModuleIdByRoleType(moduleIdStr, roleId);
		return Msg.success();
	}
}
