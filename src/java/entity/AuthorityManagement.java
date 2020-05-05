package com.graduationDesign.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthorityManagement {

	private Integer id;// 主键
	private String moduleId;// 模块id
	private Integer userRoleId;// 用户角色id(外键)，关联基础信息表id
}
