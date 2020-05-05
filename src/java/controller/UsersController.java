package com.graduationDesign.controller;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.graduationDesign.entity.Users;
import com.graduationDesign.service.UserService;
import com.graduationDesign.utils.GetBatchIdUtils;
import com.graduationDesign.utils.Msg;
@Controller
public class UsersController {
	@Autowired
	UserService service;
	
	@MyOperationLog(operationContent = "用户管理--查看用户列表")
	@GetMapping("/user")
	public String userPage(Model model) {
		List<Map<String, Integer>> roleName = service.selectRoleNameByBasicInfo();
		model.addAttribute("role", roleName);
		return "user";
	}
	
	//分页显示
	@ResponseBody
	@GetMapping("/users")
	public Msg users(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNum,String userName,String userRole) {
		PageHelper.startPage(pageNum,5);
		Users user = new Users();
		user.setUserName(userName);
		user.setUserRole(userRole);
		List<Users> selectUsers = service.selectUsersBySelectiveQuery(user);
		PageInfo page = new PageInfo(selectUsers,5);
		return Msg.success().add("pageInfo", page);	
	}
	
	//删除用户
	@MyOperationLog(operationContent = "用户管理--删除用户")
	@ResponseBody
	@DeleteMapping("/deleteUser/{id}")
	public Msg deleteUserById(@PathVariable("id")Integer id) {
		service.deleteUserById(id);
		return Msg.success();
	}
	
	//批量删除用户
	@MyOperationLog(operationContent = "用户管理--批量删除用户")
	@ResponseBody
	@DeleteMapping("/batchDelUser/{id}")
	public Msg batchDeleteUser(@PathVariable("id")String id) {
		List<Integer> batchId = GetBatchIdUtils.batchId(id);
		service.batchDeleteUser(batchId);
		return Msg.success();
	}
	
	//查询角色类型
	@ResponseBody
	@GetMapping("/roleTypeName")
	public Msg selectRoleTypeName() {
		List<Map<String, Integer>> RoleTypeName = service.selectRoleNameByBasicInfo();
		return Msg.success().add("roleName",RoleTypeName);
	}
	
	//新增用户
	@MyOperationLog(operationContent = "用户管理--添加用户")
	@ResponseBody
	@PostMapping("/addUser")
	public Msg insertUser(Users user) {
		service.insertUsers(user);
		return Msg.success();
	}
	
	//通过id查询数据
	@ResponseBody
	@GetMapping("/getUserInfo")
	public Msg selectUserById(Integer id) {
		Users users = new Users();
		users.setId(id);
		List<Users> userInfo = service.selectUsersBySelectiveQuery(users);
		return Msg.success().add("userInfo",userInfo);
	}
	
	//通过id修改用户
	@MyOperationLog(operationContent = "用户管理--修改用户")
	@ResponseBody
	@PutMapping("/updateUsers/{id}")
	public Msg updateUser(Users user) {
		service.updateUsers(user);
		return Msg.success();
	}
}
