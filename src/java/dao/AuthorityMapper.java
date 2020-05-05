package com.graduationDesign.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AuthorityMapper {
	
	//通过角色id得到模块id
	String getModuleIdStrByRoleType(Integer roleId);
	
	//得到模块集合
	List<Map<String,Integer>> getModules();
	
	//通过模块id得到模块
	List<Integer> getModuleIds(List<Integer> id);
	
	//修改角色权限
	int editModuleIdByRoleType(@Param("moduleIdStr")String moduleIdStr,@Param("roleId")Integer roleId);
}
