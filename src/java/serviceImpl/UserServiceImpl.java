package com.graduationDesign.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.UserMapper;
import com.graduationDesign.entity.Users;
import com.graduationDesign.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;

	@Override
	public Users selectUserByUserInformation(Users user) {
		
		return userMapper.getUserByUserInformation(user);
	}

	@Override
	public List<Users> selectUserOperationModuleNameByUserInformation(Users user) {
		
		return userMapper.getUserOperationModuleName(user);
	}

	@Override
	public List<Users> selectUserOperationModuleIdByUserInformation(Users user) {
		
		return userMapper.getUserOperationModuleId(user);
	}

	@Override
	public List<Users> selectUsersBySelectiveQuery(Users user) {
		
		return userMapper.getUsersBySelectiveQuery(user);
	}

	@Override
	public void deleteUserById(Integer id) {
		
		userMapper.moveUserById(id);
	}

	@Override
	public void batchDeleteUser(List<Integer> id) {
		
		userMapper.batchDeleteUsers(id);
	}

	@Override
	public List<Map<String, Integer>> selectRoleNameByBasicInfo() {
		
		return userMapper.getRoleNameByBasicInfo();
	}

	@Override
	public void insertUsers(Users user) {
		userMapper.addUsers(user);
	}

	@Override
	public void updateUsers(Users user) {
		userMapper.editUsers(user);
		
	}	
}
