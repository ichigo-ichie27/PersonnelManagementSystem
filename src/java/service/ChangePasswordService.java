package com.graduationDesign.service;

import com.graduationDesign.entity.Users;

public interface ChangePasswordService {

	// 通过用户名查询用户密码
	String selectUserPwdByuserName(String userName);

	// 通过用户名更新用户密码
	void updateUserPwdByuserName(Users users);

}
