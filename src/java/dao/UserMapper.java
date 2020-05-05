package com.graduationDesign.dao;


import java.util.List;
import java.util.Map;

import com.graduationDesign.entity.Users;
public interface UserMapper {
	
	//通过用户名、密码和角色类型查询用户
	Users getUserByUserInformation(Users user);
	
	//通过用户名、密码和角色类型查询用户可操作的模块名称
	List<Users> getUserOperationModuleName(Users user);
	
	//通过用户名、密码和角色类型查询用户可操作的模块id
	List<Users> getUserOperationModuleId(Users user);
	
	//有选择性查询
	List<Users> getUsersBySelectiveQuery(Users user);
	
	//根据id删除用户
	int moveUserById(Integer id);
	
	//批量删除用户
	int batchDeleteUsers(List<Integer> id);
	
	//查询角色类型 
	List<Map<String,Integer>> getRoleNameByBasicInfo();
	
	//添加用户
	int addUsers(Users user);
	
	//修改用户
	int editUsers(Users user);
	
}
