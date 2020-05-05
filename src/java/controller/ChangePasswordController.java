package com.graduationDesign.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.Users;
import com.graduationDesign.service.ChangePasswordService;
import com.graduationDesign.utils.Msg;

@Controller
public class ChangePasswordController {
	@Autowired
	ChangePasswordService service;
	
	@GetMapping("/changePassword")
	public String changePasswordPage() {
		return "changePassword";
	}
	
	@MyOperationLog(operationContent = "个人信息中心--修改密码")
	@ResponseBody
	@PostMapping("/updateUserPwd")
	public Msg editUserPwd(HttpServletRequest req,String oldPwd,String newPwd,String confirmPwd) {
		String userName = req.getSession().getAttribute("userName").toString();
		String userPwd = service.selectUserPwdByuserName(userName);
		Users user = new Users();
		user.setUserName(userName);
		user.setUserPwd(newPwd);
		if(oldPwd.equals(userPwd)) {
			if(newPwd.equals(confirmPwd)) {
				service.updateUserPwdByuserName(user);
				return Msg.success();
			}else {
				return Msg.fail().add("error","输入的确认密码与新密码不一致！");
			}
		}else {
			return Msg.fail().add("error","输入的旧密码不正确！");
		}
	}
}
