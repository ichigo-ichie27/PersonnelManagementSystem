package com.graduationDesign.entity;
import java.sql.Date;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PartEmployeeInformation {
	
	private Integer id;// 主键
	private String empNumber;// 员工编号
	private String empName;// 员工姓名
	private String empSex;// 员工性别
	private String empPhone;// 电话
	private String empCultureTypeId;// 文化程度类型(外键)，关联基础信息表的id
	private Date empJoinTime;// 入职时间
	private String empPositionTypeId;// 职位类型(外键)，关联基础信息表的id
	private String empDeptTypeId;// 部门类型(外键)，关联基础信息表的id
	private String empUserName;//员工用户名
	

}
