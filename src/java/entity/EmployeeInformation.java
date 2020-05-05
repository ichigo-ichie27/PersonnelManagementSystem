package com.graduationDesign.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeInformation {

	private Integer id;// 主键
	private String empNumber;// 员工编号
	private String empName;// 员工姓名
	private String empSex;// 员工性别
	private String empPhone;// 电话
	private String empEmail;// 邮箱
	private String empBirthday;// 出生日期
	private Integer empAge;// 年龄
	private String empAddress;// 家庭地址
	private String empIdCard;// 身份证号码
	private String empNationTypeId;// 民族类型(外键)，关联基础信息表的id
	private Integer empPoliticalTypeId;// 政治面貌类型(外键)，关联基础信息表的id
	private Integer empCultureTypeId;// 文化程度类型(外键)，关联基础信息表的id
	private String empPhotoUrl;// 相片路径
	private String empSchool;// 毕业院校
	private String empMajor;// 主修专业
	private String empJoinTime;// 入职时间
	private String empPositionTypeId;// 职位类型(外键)，关联基础信息表的id
	private String empDeptTypeId;// 部门类型(外键)，关联基础信息表的id
	private String empUserName;//员工用户名
}
