package com.graduationDesign.entity;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OperationLog {

	private Integer id;// 主键
	private String operator;//操作人
	private String operatorIp;//操作人ip
	private String operationContent;// 操作内容
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date operationTime;// 操作时间
	private String operationCurrentTime;//用于查询字段
	private String operationCurrentTime2;//用于查询字段
}
