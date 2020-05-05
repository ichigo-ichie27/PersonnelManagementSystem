package com.graduationDesign.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RewardsRecords {

	private Integer id;// 主键
	private Date cancelTime;// 撤销时间
	private String cancelReason;// 撤销原因
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
	private Date rewardsTime;// 奖惩时间
	private String approver;// 批准人
	private Integer empId;// 员工id(外键)，关联员工信息表id
	private Integer rewardsTypeId;// 奖惩类型(外键)，关联基础信息表id
	
}
