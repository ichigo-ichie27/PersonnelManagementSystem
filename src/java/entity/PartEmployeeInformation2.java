package com.graduationDesign.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PartEmployeeInformation2 {

	private Integer id;// 主键
	private String empNumber;// 员工编号
	private String empName;// 员工姓名
	private String empSex;// 员工性别
	private String empPhone;// 电话
	private Integer empCultureTypeId;// 文化程度类型(外键)，关联基础信息表的id
	private String empJoinTime;// 入职时间
	private Integer empPositionTypeId;// 职位类型(外键)，关联基础信息表的id
	private Integer empDeptTypeId;// 部门类型(外键)，关联基础信息表的id
	private Integer empNationTypeId;// 民族类型(外键)，关联基础信息表的id
	private Integer empPoliticalTypeId;// 政治面貌类型(外键)，关联基础信息表的id
	private String empUserName;//用户名(外键) ，关联用户表的user_name

}
