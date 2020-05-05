package com.graduationDesign.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduationDesign.dao.AuthorityMapper;
import com.graduationDesign.service.AuthorityService;
@Service
public class AuthorityServiceImpl implements AuthorityService {
	@Autowired
	AuthorityMapper mapper;
	
	@Override
	public String selectModuleIdStrByRoleType(Integer roleId) {
		
		return mapper.getModuleIdStrByRoleType(roleId);
	}

	@Override
	public List<Map<String, Integer>> selectModules() {
		
		return mapper.getModules();
	}

	@Override
	public List<Integer> selectModuleIds(List<Integer> id) {
		
		return mapper.getModuleIds(id);
	}

	@Override
	public void updateModuleIdByRoleType(String moduleIdStr, Integer roleId) {
		
		mapper.editModuleIdByRoleType(moduleIdStr, roleId);
	}

}
