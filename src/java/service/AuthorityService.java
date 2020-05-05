package com.graduationDesign.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AuthorityService {

	// 通过角色id得到模块id
	String selectModuleIdStrByRoleType(Integer roleId);

	// 得到模块集合
	List<Map<String, Integer>> selectModules();

	// 通过模块id得到模块
	List<Integer> selectModuleIds(List<Integer> id);

	// 修改角色权限
	void updateModuleIdByRoleType(@Param("moduleIdStr") String moduleIdStr, @Param("roleId") Integer roleId);
}
