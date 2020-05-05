package com.graduationDesign.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceRecord {

	private Integer id;// 主键
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date clockTime;// 打卡时间
	private String clockType;// 打卡类型
	private Integer empId;// 员工id(外键)，关联员工信息表id
	private String sameDayTime;// 记录当天时间
	private String sameDayTime2;
	private String state;
	private String empUserName;
	
}
