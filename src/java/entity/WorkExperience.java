package com.graduationDesign.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkExperience {

	private Integer id;// 主键
	private String startTime;// 开始时间
	private String endTime;// 结束时间
	private String dept;// 部门
	private String position;// 职务
	private String workCompany;// 工作单位
	private Integer empId;// 员工id(外键)，关联员工信息表id
	
}
