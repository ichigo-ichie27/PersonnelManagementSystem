package com.graduationDesign.service;

import java.util.List;
import java.util.Map;

import com.graduationDesign.entity.Users;

public interface UserService {

	// 通过用户信息查询用户
	Users selectUserByUserInformation(Users user);

	// 通过用户信息查询用户可操作的模块名称
	List<Users> selectUserOperationModuleNameByUserInformation(Users user);

	// 通过用户信息查询用户可操作的模块id
	List<Users> selectUserOperationModuleIdByUserInformation(Users user);

	// 有选择性查询
	List<Users> selectUsersBySelectiveQuery(Users user);

	// 根据id删除用户
	void deleteUserById(Integer id);

	// 批量删除用户
	void batchDeleteUser(List<Integer> id);

	// 查询角色类型
	List<Map<String, Integer>> selectRoleNameByBasicInfo();

	// 添加用户
	void insertUsers(Users user);

	// 修改用户
	void updateUsers(Users user);
}
