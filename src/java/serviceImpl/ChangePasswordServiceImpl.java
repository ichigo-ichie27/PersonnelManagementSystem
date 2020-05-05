package com.graduationDesign.serviceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.ChangePasswordMapper;
import com.graduationDesign.entity.Users;
import com.graduationDesign.service.ChangePasswordService;
@Service
public class ChangePasswordServiceImpl implements ChangePasswordService {
	
	@Autowired
	ChangePasswordMapper mapper;
	
	@Override
	public String selectUserPwdByuserName(String userName) {
		
		return mapper.getUserPwdByuserName(userName);
	}

	@Override
	public void updateUserPwdByuserName(Users users) {
		
		mapper.editUserPwdByuserName(users);
	}

}
