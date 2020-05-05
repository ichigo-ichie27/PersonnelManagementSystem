package com.graduationDesign.dao;

import com.graduationDesign.entity.Users;

public interface ChangePasswordMapper {
	
	//通过用户名查询用户密码
	String getUserPwdByuserName(String userName);
	
	//通过用户名更新用户密码
	int editUserPwdByuserName(Users users);
}
