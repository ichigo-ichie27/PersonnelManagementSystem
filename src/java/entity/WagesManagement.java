package com.graduationDesign.entity;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WagesManagement {

	private Integer id;// 主键
	private Integer years;// 年份
	private Integer months;// 月份
	private BigDecimal monthlyWages;//月工资
	private BigDecimal performanceRoyalty;// 绩效提成
	private BigDecimal deduct;// 扣除
	private BigDecimal realPay;// 实发工资
	private Integer empId;// 员工id(外键)，关联员工信息表id
	private String empName;
	
}
