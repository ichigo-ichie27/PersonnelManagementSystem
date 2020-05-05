package com.graduationDesign.entity;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	
	private Integer id;// 主键
	private String userName;// 用户名
	private String userPwd;// 密码
	private String userIsStart; //是否启用账号(1:是  0:否)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date userCreateTime;// 用户创建时间
	private Integer userRoleId;// 用户角色id(外键)，关联基础信息表的id
	private String userRole;//用户角色
//	private BasicInformation basicInformation;// 关联基础信息表
//	private AuthorityManagement authorityManagement;// 关联权限表
//	private ModuleTable moduleTable;// 关联模块表
}
