package com.graduationDesign.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasicInformation {

	private Integer id;// 主键
	private String mark;// 类型标示
	private String typeName;// 类型名称
	
}
