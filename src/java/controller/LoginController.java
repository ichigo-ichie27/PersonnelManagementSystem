package com.graduationDesign.controller;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.graduationDesign.aop.MyOperationLog;
import com.graduationDesign.entity.BasicInformation;
import com.graduationDesign.entity.Users;
import com.graduationDesign.service.AuthorityService;
import com.graduationDesign.service.UserService;
import com.graduationDesign.utils.GetBatchIdUtils;
import com.graduationDesign.utils.Msg;
import com.graduationDesign.utils.VerificationCodeImageUtils;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	@Autowired
	AuthorityService authService;
	
	//请求到登录界面
	@RequestMapping("/login")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping("/home")
	public String toHome() {
		return "index";
	}
	
	@RequestMapping("/welcome")
	public String toWelcome() {
		return "welcome";
	}
	
	//退出系统
	@GetMapping("/signOut")
	public String signOut(HttpSession session) {
		//清除session
		session.invalidate();
		return "redirect:login";
	}
	
	//验证码
	@RequestMapping("/generate.png")
	public void generateVerificationCode(HttpServletRequest req,HttpServletResponse res) throws IOException {
		res.setContentType("image/jpg");
		HttpSession session = req.getSession();
		OutputStream out = res.getOutputStream();
		String strIdentify = VerificationCodeImageUtils.generateCodeImg(out);
		session.setAttribute("identifyCode",strIdentify);
		out.close();
	}
	
	//用户登录
	@MyOperationLog(operationContent = "登录系统")
	@ResponseBody
	@RequestMapping(value = "/userLogin",method = RequestMethod.POST)
	public Msg userLogin(@RequestParam("userName")String userName,
								  @RequestParam("password")String pwd,
								  @RequestParam("check")Integer roleId,
								  @RequestParam("identify")String identify,
								  HttpServletRequest req) {
		Users user = new Users();
		user.setUserName(userName);
		user.setUserPwd(pwd);
		user.setUserRoleId(roleId);
		Users userInformation = userService.selectUserByUserInformation(user);
		String roleIdStr = authService.selectModuleIdStrByRoleType(roleId);
		List<Integer> batchId = GetBatchIdUtils.batchId(roleIdStr);
		List<Integer> moduleIds = authService.selectModuleIds(batchId);
		String strIdentify = req.getSession().getAttribute("identifyCode").toString();
		if(userInformation!=null&&strIdentify.equalsIgnoreCase(identify)) {
			req.getSession().setAttribute("userName",userName);
			req.getSession().setAttribute("role",roleId);
			req.getSession().setAttribute("moduleIds", moduleIds);
			return Msg.success().add("userInfo", userInformation);
		}else {
			return Msg.fail();
		}
	}
	
}
