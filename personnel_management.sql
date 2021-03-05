/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : personnel_management

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2021-03-04 18:21:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pm_attendance_record
-- ----------------------------
DROP TABLE IF EXISTS `pm_attendance_record`;
CREATE TABLE `pm_attendance_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clock_time` datetime NOT NULL,
  `clock_type` varchar(10) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `same_day_time` date DEFAULT NULL,
  `state` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '无',
  PRIMARY KEY (`id`),
  KEY `fk_emp_id3` (`emp_id`),
  CONSTRAINT `fk_emp_id3` FOREIGN KEY (`emp_id`) REFERENCES `pm_employee_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_attendance_record
-- ----------------------------
INSERT INTO `pm_attendance_record` VALUES ('37', '2020-04-15 15:16:48', '下班', '134', '2020-04-15', '早退');
INSERT INTO `pm_attendance_record` VALUES ('38', '2020-04-15 23:43:52', '下班', '135', '2020-04-15', '无');
INSERT INTO `pm_attendance_record` VALUES ('39', '2020-04-24 15:11:41', '下班', '135', '2020-04-24', '早退');
INSERT INTO `pm_attendance_record` VALUES ('40', '2020-05-20 10:35:43', '上班', '134', '2020-05-20', '迟到');

-- ----------------------------
-- Table structure for pm_authority_management
-- ----------------------------
DROP TABLE IF EXISTS `pm_authority_management`;
CREATE TABLE `pm_authority_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_id` (`user_role_id`),
  CONSTRAINT `fk_user_role_Id` FOREIGN KEY (`user_role_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_authority_management
-- ----------------------------
INSERT INTO `pm_authority_management` VALUES ('8', '1,2,3,4,5,6,7', '1');
INSERT INTO `pm_authority_management` VALUES ('9', '1,2,3,4,6,7', '2');
INSERT INTO `pm_authority_management` VALUES ('10', '6,7', '3');

-- ----------------------------
-- Table structure for pm_basic_information
-- ----------------------------
DROP TABLE IF EXISTS `pm_basic_information`;
CREATE TABLE `pm_basic_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mark` varchar(50) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_basic_information
-- ----------------------------
INSERT INTO `pm_basic_information` VALUES ('1', '角色类型', '管理员');
INSERT INTO `pm_basic_information` VALUES ('2', '角色类型', '人事经理');
INSERT INTO `pm_basic_information` VALUES ('3', '角色类型', '员工');
INSERT INTO `pm_basic_information` VALUES ('4', '部门类型', '研发部');
INSERT INTO `pm_basic_information` VALUES ('5', '部门类型', '销售部');
INSERT INTO `pm_basic_information` VALUES ('6', '部门类型', '人事部');
INSERT INTO `pm_basic_information` VALUES ('7', '文化程度类型', '专科');
INSERT INTO `pm_basic_information` VALUES ('8', '文化程度类型', '本科');
INSERT INTO `pm_basic_information` VALUES ('9', '文化程度类型', '硕士');
INSERT INTO `pm_basic_information` VALUES ('10', '政治面貌类型', '群众');
INSERT INTO `pm_basic_information` VALUES ('11', '政治面貌类型', '团员');
INSERT INTO `pm_basic_information` VALUES ('12', '政治面貌类型', '党员');
INSERT INTO `pm_basic_information` VALUES ('16', '职位类型', '工程师');
INSERT INTO `pm_basic_information` VALUES ('17', '职位类型', '技术员');
INSERT INTO `pm_basic_information` VALUES ('18', '职位类型', '部门经理');
INSERT INTO `pm_basic_information` VALUES ('19', '民族类型', '汉族');
INSERT INTO `pm_basic_information` VALUES ('20', '民族类型', '回族');
INSERT INTO `pm_basic_information` VALUES ('21', '民族类型', '壮族');
INSERT INTO `pm_basic_information` VALUES ('22', '奖惩类型', '迟到');
INSERT INTO `pm_basic_information` VALUES ('23', '奖惩类型', '早退');

-- ----------------------------
-- Table structure for pm_employee_information
-- ----------------------------
DROP TABLE IF EXISTS `pm_employee_information`;
CREATE TABLE `pm_employee_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_number` varchar(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_sex` varchar(10) DEFAULT NULL,
  `emp_phone` varchar(50) DEFAULT NULL,
  `emp_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `emp_age` int(10) DEFAULT NULL,
  `emp_address` varchar(200) DEFAULT NULL,
  `emp_id_card` varchar(100) DEFAULT NULL,
  `emp_nation_type_id` int(10) DEFAULT NULL,
  `emp_political_type_id` int(10) DEFAULT NULL,
  `emp_culture_type_id` int(10) DEFAULT NULL,
  `emp_photo_url` varchar(200) DEFAULT NULL,
  `emp_school` varchar(50) DEFAULT NULL,
  `emp_major` varchar(50) DEFAULT NULL,
  `emp_join_time` date DEFAULT NULL,
  `emp_position_type_id` int(10) DEFAULT NULL,
  `emp_dept_type_id` int(10) DEFAULT NULL,
  `emp_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_nation_type` (`emp_nation_type_id`),
  KEY `fk_culture_type` (`emp_culture_type_id`),
  KEY `fk_dept_type` (`emp_dept_type_id`),
  KEY `fk_position_type` (`emp_position_type_id`),
  KEY `fk_political_type` (`emp_political_type_id`),
  CONSTRAINT `fk_culture_type` FOREIGN KEY (`emp_culture_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_dept_type` FOREIGN KEY (`emp_dept_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_nation_type` FOREIGN KEY (`emp_nation_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_political_type` FOREIGN KEY (`emp_political_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_position_type` FOREIGN KEY (`emp_position_type_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_employee_information
-- ----------------------------
INSERT INTO `pm_employee_information` VALUES ('134', '200101', '马超', '男', '13898090934', 'machao666@qq.com', '1993-03-12', '27', '重庆市铜梁区白龙大道15号', '123243989349324345', '19', '10', '7', '/upload/d4a8ed738001496a95028978dc31a42b.jpg', '云南民族大学', '计算机软件工程', '2020-01-01', '16', '4', '马超666');
INSERT INTO `pm_employee_information` VALUES ('135', '200102', '项羽', '男', '16894343948', null, null, null, null, null, '20', '11', '8', null, null, null, '2020-04-08', '17', '5', '项羽666');
INSERT INTO `pm_employee_information` VALUES ('136', '200103', '李白', '男', '13648598340', null, null, null, null, null, '21', '12', '9', null, null, null, '2020-04-09', '16', '4', '李白666');
INSERT INTO `pm_employee_information` VALUES ('137', '200104', '貂蝉', '女', '16894343948', 'diaochan@163.com', '2000-02-15', '20', '重庆市铜梁区白龙大道15号', '532622199704534345', '19', '12', '9', '/upload/6a1c74a408d842599c7ad61ec50bd019.jpg', '北京大学', '经济管理', '2020-04-23', '18', '6', 'manager');

-- ----------------------------
-- Table structure for pm_module_table
-- ----------------------------
DROP TABLE IF EXISTS `pm_module_table`;
CREATE TABLE `pm_module_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_module_table
-- ----------------------------
INSERT INTO `pm_module_table` VALUES ('1', '基础信息管理');
INSERT INTO `pm_module_table` VALUES ('2', '人事管理');
INSERT INTO `pm_module_table` VALUES ('3', '考勤管理');
INSERT INTO `pm_module_table` VALUES ('4', '工资管理');
INSERT INTO `pm_module_table` VALUES ('5', '系统管理');
INSERT INTO `pm_module_table` VALUES ('6', '员工考勤');
INSERT INTO `pm_module_table` VALUES ('7', '个人信息中心');

-- ----------------------------
-- Table structure for pm_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `pm_operation_log`;
CREATE TABLE `pm_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(50) DEFAULT NULL,
  `operator_ip` varchar(255) DEFAULT NULL,
  `operation_content` varchar(500) DEFAULT NULL,
  `operation_time` datetime DEFAULT NULL,
  `operation_current_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pm_operation_log
-- ----------------------------
INSERT INTO `pm_operation_log` VALUES ('448', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 15:48:11', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('449', 'admin', '127.0.0.1', '登录系统', '2020-04-15 19:11:56', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('450', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-15 19:12:00', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('451', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 19:12:01', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('452', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 19:12:02', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('453', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-15 19:12:04', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('454', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-15 19:12:05', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('455', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-15 19:12:06', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('456', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-15 19:12:07', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('457', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-15 19:12:08', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('458', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 19:12:09', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('459', '马超666', '127.0.0.1', '登录系统', '2020-04-15 19:14:36', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('460', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:14:40', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('461', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:14:40', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('462', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:14:43', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('463', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:23:46', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('464', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:23:48', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('465', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:26:06', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('466', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:26:07', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('467', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:26:16', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('468', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:26:25', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('469', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:27:02', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('470', '马超666', '127.0.0.1', '登录系统', '2020-04-15 19:30:37', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('471', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:30:49', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('472', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:30:50', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('473', '马超666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-15 19:30:56', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('474', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 19:31:03', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('475', 'admin', '127.0.0.1', '登录系统', '2020-04-15 19:31:30', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('476', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 19:31:38', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('477', 'admin', '127.0.0.1', '登录系统', '2020-04-15 19:33:58', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('478', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 19:34:01', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('479', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 19:34:49', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('480', 'admin', '127.0.0.1', '退出系统', '2020-04-15 19:35:04', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('481', 'admin', '127.0.0.1', '登录系统', '2020-04-15 19:35:15', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('482', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 19:35:21', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('483', 'admin', '127.0.0.1', '退出系统', '2020-04-15 19:35:38', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('484', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-15 19:35:44', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('485', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-15 19:35:44', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('486', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-15 19:35:45', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('487', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-15 19:35:47', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('488', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-15 19:46:58', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('489', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-15 19:46:58', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('490', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-15 19:47:00', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('491', 'admin', '127.0.0.1', '登录系统', '2020-04-15 19:47:36', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('492', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 19:47:49', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('493', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-15 19:48:11', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('494', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 19:48:14', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('495', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-15 19:48:14', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('496', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-15 19:48:15', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('497', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 19:48:17', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('498', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 19:48:17', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('499', 'admin', '127.0.0.1', '登录系统', '2020-04-15 23:13:39', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('500', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-15 23:13:44', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('501', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:13:45', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('502', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 23:13:46', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('503', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-15 23:13:47', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('504', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-15 23:13:49', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('505', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-15 23:13:49', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('506', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-15 23:13:50', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('507', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-15 23:13:51', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('508', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 23:13:51', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('509', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:13:55', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('510', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:13:56', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('511', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:14:00', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('512', 'admin', '127.0.0.1', '登录系统', '2020-04-15 23:31:13', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('513', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:31:47', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('514', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:31:48', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('515', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:32:08', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('516', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:32:09', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('517', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:32:40', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('518', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:32:41', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('519', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:32:42', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('520', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:32:42', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('521', '马超666', '127.0.0.1', '登录系统', '2020-04-15 23:33:31', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('522', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:33:34', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('523', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:33:35', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('524', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:33:44', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('525', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:33:49', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('526', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:33:51', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('527', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:35:42', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('528', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:35:42', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('529', 'admin', '127.0.0.1', '登录系统', '2020-04-15 23:35:55', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('530', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:35:58', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('531', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:35:58', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('532', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:36:02', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('533', 'admin', '127.0.0.1', '登录系统', '2020-04-15 23:38:15', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('534', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:38:18', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('535', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:38:18', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('536', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:38:22', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('537', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:38:23', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('538', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:38:27', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('539', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 23:38:28', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('540', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-15 23:38:30', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('541', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:38:57', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('542', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 23:38:58', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('543', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:38:59', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('544', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 23:39:00', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('545', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:39:00', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('546', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 23:39:01', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('547', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:39:02', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('548', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:39:12', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('549', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:39:12', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('550', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:39:20', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('551', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-15 23:39:26', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('552', 'admin', '127.0.0.1', '用户管理--添加用户', '2020-04-15 23:39:57', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('553', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:40:06', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('554', 'admin', '127.0.0.1', '人事档案浏览--添加人事信息', '2020-04-15 23:41:11', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('555', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:41:19', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('556', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 23:41:20', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('557', '项羽666', '127.0.0.1', '登录系统', '2020-04-15 23:41:47', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('558', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:41:49', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('559', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:41:50', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('560', '项羽666', '127.0.0.1', '登录系统', '2020-04-15 23:43:27', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('561', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:43:33', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('562', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:43:33', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('563', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-15 23:43:38', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('564', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-15 23:43:47', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('565', '项羽666', '127.0.0.1', '上下班打卡--添加考勤记录', '2020-04-15 23:43:52', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('566', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-15 23:43:54', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('567', 'admin', '127.0.0.1', '登录系统', '2020-04-15 23:44:13', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('568', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-15 23:44:16', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('569', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-15 23:44:21', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('570', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-15 23:44:21', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('571', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-15 23:44:25', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('572', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-15 23:44:25', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('573', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-15 23:44:54', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('574', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-15 23:45:06', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('575', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-15 23:45:06', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('576', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-15 23:45:27', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('577', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-15 23:45:32', '2020-04-15');
INSERT INTO `pm_operation_log` VALUES ('578', 'admin', '127.0.0.1', '登录系统', '2020-04-16 09:46:06', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('579', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-16 09:46:17', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('580', 'admin', '127.0.0.1', '用户管理--添加用户', '2020-04-16 09:48:38', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('581', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-16 09:48:45', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('582', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 09:49:35', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('583', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-16 09:51:39', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('584', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-16 09:51:44', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('585', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-16 09:56:31', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('586', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 09:56:39', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('587', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 09:58:19', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('588', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 09:58:55', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('589', 'admin', '127.0.0.1', '登录系统', '2020-04-16 10:48:03', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('590', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 10:48:06', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('591', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 10:49:42', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('592', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-16 10:49:43', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('593', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-16 10:49:45', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('594', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 10:49:47', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('595', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-16 10:49:48', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('596', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 10:49:49', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('597', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-16 10:50:01', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('598', 'admin', '127.0.0.1', '用户管理--添加用户', '2020-04-16 10:50:33', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('599', '貂蝉666', '127.0.0.1', '登录系统', '2020-04-16 10:51:05', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('600', '貂蝉666', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 10:51:13', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('601', '貂蝉666', '127.0.0.1', '人事档案浏览--添加人事信息', '2020-04-16 10:52:07', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('602', '貂蝉666', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-16 10:52:31', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('603', '貂蝉666', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-16 10:52:31', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('604', '貂蝉666', '127.0.0.1', '工资记录--添加工资记录', '2020-04-16 10:52:58', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('605', '貂蝉666', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-16 10:53:06', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('606', '貂蝉666', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-16 10:53:06', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('607', '貂蝉666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 10:54:01', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('608', '貂蝉666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 10:54:02', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('609', '貂蝉666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 10:54:05', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('610', '李白666', '127.0.0.1', '登录系统', '2020-04-16 10:55:01', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('611', '李白666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 10:55:04', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('612', '李白666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 10:55:05', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('613', 'admin', '127.0.0.1', '登录系统', '2020-04-16 13:04:19', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('614', '貂蝉666', '127.0.0.1', '登录系统', '2020-04-16 13:05:52', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('615', '貂蝉666', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-16 13:06:00', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('616', '貂蝉666', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 13:06:01', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('617', '貂蝉666', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-16 13:06:02', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('618', '貂蝉666', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 13:08:57', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('619', '貂蝉666', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-16 13:08:58', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('620', '貂蝉666', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-16 13:09:00', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('621', '貂蝉666', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-16 13:09:02', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('622', '貂蝉666', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-16 13:09:02', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('623', '貂蝉666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 13:09:08', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('624', '貂蝉666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 13:09:09', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('625', 'admin', '127.0.0.1', '登录系统', '2020-04-16 14:14:44', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('626', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-16 14:14:58', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('627', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-16 14:17:58', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('628', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-16 14:25:12', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('629', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-16 14:26:04', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('630', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-16 14:28:52', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('631', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-16 14:28:53', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('632', '项羽666', '127.0.0.1', '登录系统', '2020-04-16 15:26:10', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('633', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 15:26:16', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('634', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-16 15:26:17', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('635', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-16 15:26:39', '2020-04-16');
INSERT INTO `pm_operation_log` VALUES ('636', 'admin', '127.0.0.1', '登录系统', '2020-04-23 13:07:21', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('637', 'admin', '127.0.0.1', '登录系统', '2020-04-23 13:56:52', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('638', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 13:57:00', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('639', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 14:01:57', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('640', 'admin', '127.0.0.1', '登录系统', '2020-04-23 14:38:54', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('641', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 14:38:59', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('642', 'admin', '127.0.0.1', '登录系统', '2020-04-23 15:58:39', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('643', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 15:58:42', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('644', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 16:21:31', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('645', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 16:31:52', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('646', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 16:31:54', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('647', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 16:31:54', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('648', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 16:31:57', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('649', 'admin', '127.0.0.1', '登录系统', '2020-04-23 16:53:52', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('650', 'admin', '127.0.0.1', '登录系统', '2020-04-23 16:54:43', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('651', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 16:55:42', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('652', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 16:55:42', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('653', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 16:55:42', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('654', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 16:55:44', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('655', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 16:55:45', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('656', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-23 16:55:47', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('657', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-23 16:55:48', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('658', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-23 16:55:49', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('659', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 16:56:24', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('660', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 16:56:49', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('661', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 16:57:26', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('662', 'admin', '127.0.0.1', '工资记录--删除工资记录', '2020-04-23 16:58:18', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('663', 'admin', '127.0.0.1', '工资记录--删除工资记录', '2020-04-23 16:58:20', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('664', 'admin', '127.0.0.1', '工资记录--删除工资记录', '2020-04-23 16:58:23', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('665', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 16:59:09', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('666', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 16:59:35', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('667', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 17:00:19', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('668', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 17:00:49', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('669', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 17:01:19', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('670', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 17:01:48', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('671', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 17:02:19', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('672', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 17:03:23', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('673', 'admin', '127.0.0.1', '工资记录--添加工资记录', '2020-04-23 17:03:49', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('674', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-23 17:03:54', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('675', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-23 17:03:54', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('676', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-23 17:03:55', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('677', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-23 17:03:55', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('678', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-23 17:04:21', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('679', 'admin', '127.0.0.1', '登录系统', '2020-04-23 18:19:30', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('680', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 18:19:32', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('681', 'admin', '127.0.0.1', '登录系统', '2020-04-23 19:10:16', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('682', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 19:10:38', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('683', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 19:44:52', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('684', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 20:00:58', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('685', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 20:13:58', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('686', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 20:18:17', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('687', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 20:18:34', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('688', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-23 20:19:08', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('689', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 20:19:16', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('690', 'admin', '127.0.0.1', '人事档案浏览--添加人事信息', '2020-04-23 20:19:59', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('691', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-23 20:20:11', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('692', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 20:20:13', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('693', 'admin', '127.0.0.1', '登录系统', '2020-04-23 21:00:48', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('694', 'admin', '127.0.0.1', '登录系统', '2020-04-23 21:08:28', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('695', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 21:12:34', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('696', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 21:12:35', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('697', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-23 21:12:37', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('698', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 21:12:38', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('699', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-23 22:47:37', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('700', 'admin', '127.0.0.1', '权限管理--授权角色权限', '2020-04-23 22:47:44', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('701', 'admin', '127.0.0.1', '登录系统', '2020-04-23 22:48:03', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('702', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-23 22:49:38', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('703', 'admin', '127.0.0.1', '权限管理--授权角色权限', '2020-04-23 22:49:41', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('704', 'admin', '127.0.0.1', '登录系统', '2020-04-23 22:50:11', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('705', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 23:03:35', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('706', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-23 23:03:42', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('707', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-23 23:04:29', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('708', 'admin', '127.0.0.1', '登录系统', '2020-04-23 23:55:35', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('709', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-23 23:55:37', '2020-04-23');
INSERT INTO `pm_operation_log` VALUES ('710', 'admin', '127.0.0.1', '登录系统', '2020-04-24 10:02:53', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('711', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-24 10:05:09', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('712', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-24 10:05:09', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('713', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-24 10:17:22', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('714', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-24 10:17:22', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('715', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-24 10:19:57', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('716', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-24 10:19:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('717', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-24 10:22:05', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('718', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-24 10:22:05', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('719', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-24 10:23:41', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('720', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-24 10:23:41', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('721', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-24 10:23:42', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('722', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-24 10:23:42', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('723', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-24 10:26:44', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('724', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-24 10:26:44', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('725', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-24 10:55:02', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('726', 'admin', '127.0.0.1', '登录系统', '2020-04-24 11:34:53', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('727', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('728', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('729', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('730', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('731', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('732', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('733', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('734', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('735', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('736', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('737', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('738', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('739', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('740', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('741', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('742', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('743', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('744', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('745', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('746', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('747', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('748', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('749', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('750', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('751', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('752', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('753', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('754', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('755', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('756', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('757', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('758', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('759', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('760', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('761', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('762', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('763', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('764', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('765', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('766', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-24 11:36:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('767', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-24 11:37:40', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('768', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-24 11:37:42', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('769', 'admin', '127.0.0.1', '登录系统', '2020-04-24 12:43:33', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('770', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-24 12:43:36', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('771', 'admin', '127.0.0.1', '登录系统', '2020-04-24 13:33:56', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('772', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-24 13:34:00', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('773', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-24 13:41:54', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('774', 'admin', '127.0.0.1', '登录系统', '2020-04-24 15:02:06', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('775', 'admin', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:03:24', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('776', 'admin', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:03:37', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('777', 'admin', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:03:41', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('778', 'admin', '127.0.0.1', '登录系统', '2020-04-24 15:10:36', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('779', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-24 15:10:41', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('780', '项羽666', '127.0.0.1', '登录系统', '2020-04-24 15:11:16', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('781', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:11:26', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('782', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:11:32', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('783', '项羽666', '127.0.0.1', '上下班打卡--添加考勤记录', '2020-04-24 15:11:41', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('784', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:11:43', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('785', '貂蝉666', '127.0.0.1', '登录系统', '2020-04-24 15:12:44', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('786', '貂蝉666', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-24 15:12:52', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('787', '貂蝉666', '127.0.0.1', '考勤记录--修改状态', '2020-04-24 15:12:57', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('788', '貂蝉666', '127.0.0.1', '考勤记录--添加奖惩记录', '2020-04-24 15:12:57', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('789', '貂蝉666', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-24 15:12:59', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('790', '项羽666', '127.0.0.1', '登录系统', '2020-04-24 15:14:28', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('791', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:14:32', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('792', '貂蝉666', '127.0.0.1', '登录系统', '2020-04-24 15:17:33', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('793', '貂蝉666', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-24 15:17:37', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('794', '貂蝉666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:17:42', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('795', '貂蝉666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:17:42', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('796', '项羽666', '127.0.0.1', '登录系统', '2020-04-24 15:19:16', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('797', '项羽666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-24 15:25:09', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('798', '项羽666', '127.0.0.1', '登录系统', '2020-04-24 15:59:38', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('799', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:59:42', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('800', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:59:43', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('801', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:59:44', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('802', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:59:46', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('803', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:59:47', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('804', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:59:48', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('805', '项羽666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 15:59:49', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('806', '李白666', '127.0.0.1', '登录系统', '2020-04-24 16:00:13', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('807', '李白666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:00:15', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('808', '李白666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:00:15', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('809', 'admin', '127.0.0.1', '登录系统', '2020-04-24 16:00:47', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('810', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-24 16:00:55', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('811', '马超666', '127.0.0.1', '登录系统', '2020-04-24 16:01:30', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('812', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:01:37', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('813', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:01:38', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('814', '马超666', '127.0.0.1', '个人信息设置--上传个人相片', '2020-04-24 16:05:47', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('815', '马超666', '127.0.0.1', '个人信息设置--上传个人相片', '2020-04-24 16:05:54', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('816', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:05:58', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('817', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:06:00', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('818', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:06:01', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('819', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:06:01', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('820', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:06:02', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('821', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:06:02', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('822', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:06:03', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('823', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-24 16:06:03', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('824', '项羽666', '127.0.0.1', '登录系统', '2020-04-24 16:48:00', '2020-04-24');
INSERT INTO `pm_operation_log` VALUES ('825', 'admin', '127.0.0.1', '登录系统', '2020-04-25 12:37:55', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('826', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-25 12:38:03', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('827', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-25 12:58:39', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('828', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-04-25 12:59:49', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('829', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-25 13:00:28', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('830', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-04-25 13:00:31', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('831', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-04-25 13:13:03', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('832', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-04-25 13:21:24', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('833', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-04-25 13:33:17', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('834', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-04-25 13:33:18', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('835', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-04-25 13:44:02', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('836', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-04-25 13:49:08', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('837', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-04-25 13:55:53', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('838', 'admin', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-04-25 14:02:17', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('839', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-25 14:05:44', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('840', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-04-25 14:05:45', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('841', 'admin', '127.0.0.1', '登录系统', '2020-04-25 15:10:22', '2020-04-25');
INSERT INTO `pm_operation_log` VALUES ('842', 'admin', '127.0.0.1', '登录系统', '2020-05-07 19:33:27', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('843', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-07 19:33:52', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('844', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-07 19:33:54', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('845', 'admin', '127.0.0.1', '基础信息设置--添加基础信息', '2020-05-07 19:34:15', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('846', 'admin', '127.0.0.1', '基础信息设置--修改基础信息', '2020-05-07 19:34:32', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('847', 'admin', '127.0.0.1', '基础信息设置--删除基础信息', '2020-05-07 19:34:39', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('848', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-07 19:34:50', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('849', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-07 19:34:52', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('850', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-07 19:35:11', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('851', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-07 19:35:13', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('852', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-07 19:38:41', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('853', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-07 19:40:11', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('854', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-07 19:40:13', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('855', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-07 19:40:14', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('856', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-07 19:40:14', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('857', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-07 19:40:14', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('858', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-07 19:40:15', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('859', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-07 19:40:15', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('860', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-07 19:40:16', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('861', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-07 19:40:17', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('862', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-07 19:40:18', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('863', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-07 19:40:19', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('864', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-07 19:40:19', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('865', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-07 19:40:20', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('866', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-07 19:40:20', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('867', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-07 19:40:21', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('868', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-07 19:40:22', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('869', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-07 19:40:25', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('870', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-07 19:40:26', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('871', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-07 19:40:26', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('872', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-07 19:40:29', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('873', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-07 19:40:31', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('874', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-07 19:40:33', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('875', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-07 19:40:34', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('876', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-07 19:42:45', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('877', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-07 19:42:45', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('878', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-07 19:42:46', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('879', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-07 19:42:47', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('880', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-07 19:42:47', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('881', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-07 19:42:50', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('882', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-07 19:42:51', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('883', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-07 19:42:53', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('884', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-07 19:42:54', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('885', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-07 19:42:54', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('886', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-07 19:42:55', '2020-05-07');
INSERT INTO `pm_operation_log` VALUES ('887', 'admin', '127.0.0.1', '登录系统', '2020-05-20 10:32:50', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('888', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-20 10:32:57', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('889', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-20 10:32:57', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('890', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-20 10:33:01', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('891', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-20 10:33:03', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('892', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-20 10:33:03', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('893', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-20 10:33:04', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('894', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-20 10:33:05', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('895', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-20 10:33:07', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('896', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-20 10:33:09', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('897', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-20 10:33:09', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('898', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-20 10:33:11', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('899', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-20 10:33:11', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('900', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-20 10:33:12', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('901', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:33:16', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('902', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:33:16', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('903', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:33:20', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('904', '马超666', '127.0.0.1', '登录系统', '2020-05-20 10:34:08', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('905', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:34:13', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('906', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:34:13', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('907', '马超666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-05-20 10:35:37', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('908', '马超666', '127.0.0.1', '上下班打卡--添加考勤记录', '2020-05-20 10:35:43', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('909', '马超666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-05-20 10:35:46', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('910', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:36:08', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('911', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:36:09', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('912', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:36:09', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('913', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:36:10', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('914', '马超666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-20 10:36:13', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('915', '貂蝉666', '127.0.0.1', '登录系统', '2020-05-20 10:37:31', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('916', '貂蝉666', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-20 10:37:34', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('917', '貂蝉666', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-20 10:37:39', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('918', '貂蝉666', '127.0.0.1', '考勤记录--修改状态', '2020-05-20 10:37:47', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('919', '貂蝉666', '127.0.0.1', '考勤记录--添加奖惩记录', '2020-05-20 10:37:47', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('920', '貂蝉666', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-20 10:37:52', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('921', '貂蝉666', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-20 10:38:32', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('922', '貂蝉666', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-20 10:38:33', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('923', '貂蝉666', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-20 10:38:48', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('924', '貂蝉666', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-20 10:38:51', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('925', '貂蝉666', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-20 10:38:52', '2020-05-20');
INSERT INTO `pm_operation_log` VALUES ('926', 'admin', '127.0.0.1', '登录系统', '2020-05-21 21:33:33', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('927', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-21 21:34:08', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('928', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-21 21:34:41', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('929', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-21 21:34:43', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('930', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-21 21:36:27', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('931', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-21 21:37:03', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('932', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-21 21:37:03', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('933', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-21 21:37:10', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('934', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-21 21:37:12', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('935', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-21 21:37:13', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('936', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-21 21:37:31', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('937', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-21 21:37:32', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('938', 'admin', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-05-21 21:37:56', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('939', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-21 21:38:00', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('940', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-21 21:38:01', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('941', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-21 21:38:02', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('942', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-21 21:38:07', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('943', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-21 21:38:11', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('944', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-21 21:38:13', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('945', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-21 21:38:13', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('946', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-21 21:38:15', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('947', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-21 21:38:16', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('948', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-21 21:38:16', '2020-05-21');
INSERT INTO `pm_operation_log` VALUES ('949', 'admin', '127.0.0.1', '登录系统', '2020-05-23 10:29:29', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('950', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-23 10:29:34', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('951', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:29:35', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('952', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:32:26', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('953', 'admin', '127.0.0.1', '用户管理--修改用户', '2020-05-23 10:33:21', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('954', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:33:31', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('955', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-23 10:33:32', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('956', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-23 10:33:33', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('957', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-23 10:33:34', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('958', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:33:34', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('959', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-23 10:33:35', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('960', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-23 10:33:41', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('961', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-23 10:33:43', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('962', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-23 10:33:43', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('963', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-23 10:34:12', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('964', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-23 10:34:22', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('965', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:34:24', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('966', 'admin', '127.0.0.1', '人事档案浏览--修改人事信息', '2020-05-23 10:34:42', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('967', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:35:47', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('968', 'admin', '127.0.0.1', '用户管理--修改用户', '2020-05-23 10:36:02', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('969', '李白666', '127.0.0.1', '登录系统', '2020-05-23 10:38:07', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('970', '李白666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:38:09', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('971', '李白666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:38:10', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('972', '李白666', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:38:15', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('973', '李白666', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-05-23 10:38:18', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('974', 'admin', '127.0.0.1', '登录系统', '2020-05-23 10:38:52', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('975', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:38:56', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('976', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:39:23', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('977', 'manager', '127.0.0.1', '登录系统', '2020-05-23 10:40:09', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('978', 'manager', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:40:18', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('979', 'manager', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:40:18', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('980', 'manager', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:40:26', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('981', 'manager', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-05-23 10:40:38', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('982', 'manager', '127.0.0.1', '上下班打卡--添加考勤记录', '2020-05-23 10:40:43', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('983', 'manager', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-05-23 10:40:45', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('984', 'manager', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-23 10:40:50', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('985', 'manager', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:41:21', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('986', 'manager', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-23 10:42:35', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('987', 'manager', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-23 10:42:35', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('988', 'admin', '127.0.0.1', '登录系统', '2020-05-23 10:42:57', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('989', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:43:00', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('990', 'admin', '127.0.0.1', '用户管理--添加用户', '2020-05-23 10:43:49', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('991', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:44:21', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('992', 'admin', '127.0.0.1', '用户管理--修改用户', '2020-05-23 10:45:01', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('993', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-23 10:45:06', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('994', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-23 10:45:06', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('995', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-23 10:45:07', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('996', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:45:09', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('997', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-23 10:45:09', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('998', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:45:13', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('999', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-23 10:45:20', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1000', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:45:22', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1001', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:45:34', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1002', 'admin', '127.0.0.1', '用户管理--修改用户', '2020-05-23 10:45:42', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1003', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:45:44', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1004', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-23 10:45:46', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1005', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:45:47', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1006', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-23 10:45:47', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1007', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:45:49', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1008', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:54:54', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1009', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-05-23 10:54:58', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1010', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-05-23 10:55:02', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1011', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-05-23 10:55:02', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1012', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-05-23 10:55:09', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1013', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-05-23 10:55:09', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1014', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-05-23 10:55:10', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1015', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:55:14', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1016', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:55:15', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1017', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:55:16', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1018', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:55:16', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1019', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:55:19', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1020', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-23 10:55:21', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1021', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:55:22', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1022', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-23 10:55:23', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1023', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 10:55:24', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1024', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-05-23 10:55:26', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1025', 'manager', '127.0.0.1', '登录系统', '2020-05-23 10:56:00', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1026', 'manager', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:56:04', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1027', 'manager', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 10:56:04', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1028', 'manager', '127.0.0.1', '个人信息设置--上传个人相片', '2020-05-23 11:00:42', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1029', 'manager', '127.0.0.1', '个人信息设置--修改个人信息', '2020-05-23 11:01:40', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1030', 'manager', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 11:01:44', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1031', 'manager', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 11:01:45', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1032', 'manager', '127.0.0.1', '人事档案浏览--修改人事信息', '2020-05-23 11:02:06', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1033', 'manager', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 11:02:16', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1034', 'manager', '127.0.0.1', '个人信息设置--查看个人信息', '2020-05-23 11:02:16', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1035', 'manager', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-05-23 11:02:32', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1036', 'manager', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-05-23 11:02:32', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1037', 'admin', '127.0.0.1', '登录系统', '2020-05-23 11:02:53', '2020-05-23');
INSERT INTO `pm_operation_log` VALUES ('1038', 'admin', '127.0.0.1', '登录系统', '2020-09-01 18:34:11', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1039', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-09-01 18:35:15', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1040', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-09-01 18:35:18', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1041', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-09-01 18:35:20', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1042', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-09-01 18:35:27', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1043', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-09-01 18:35:32', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1044', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-09-01 18:35:33', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1045', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-09-01 18:35:46', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1046', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-09-01 18:35:51', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1047', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-09-01 18:36:03', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1048', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-09-01 18:36:04', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1049', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-09-01 18:36:06', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1050', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-09-01 18:36:16', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1051', 'admin', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-09-01 18:36:37', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1052', 'admin', '127.0.0.1', '上下班打卡--查看个人考勤记录列表', '2020-09-01 18:36:40', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1053', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-09-01 18:36:47', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1054', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-09-01 18:36:48', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1055', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-09-01 18:36:49', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1056', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-09-01 18:36:50', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1057', 'admin', '127.0.0.1', '个人信息设置--查看个人信息', '2020-09-01 18:36:58', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1058', 'admin', '127.0.0.1', '基础信息设置--查看基础信息列表', '2020-09-01 18:37:04', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1059', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-09-01 18:37:06', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1060', 'admin', '127.0.0.1', '人事档案浏览--查看人事档案列表', '2020-09-01 18:37:54', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1061', 'admin', '127.0.0.1', '人事信息统计--查看人事信息统计图表', '2020-09-01 18:37:58', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1062', 'admin', '127.0.0.1', '考勤记录--查看考勤记录列表', '2020-09-01 18:38:04', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1063', 'admin', '127.0.0.1', '工资记录--查看工资记录列表', '2020-09-01 18:38:05', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1064', 'admin', '127.0.0.1', '工资记录--查看工资统计图表', '2020-09-01 18:38:06', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1065', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-09-01 18:38:07', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1066', 'admin', '127.0.0.1', '权限管理--查看系统模块', '2020-09-01 18:38:08', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1067', 'admin', '127.0.0.1', '系统操作日志--查看系统操作日志列表', '2020-09-01 18:38:08', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1068', 'admin', '127.0.0.1', '用户管理--查看用户列表', '2020-09-01 18:38:10', '2020-09-01');
INSERT INTO `pm_operation_log` VALUES ('1069', 'admin', '127.0.0.1', '登录系统', '2020-09-01 19:03:56', '2020-09-01');

-- ----------------------------
-- Table structure for pm_rewards_records
-- ----------------------------
DROP TABLE IF EXISTS `pm_rewards_records`;
CREATE TABLE `pm_rewards_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cancel_time` datetime DEFAULT NULL,
  `cancel_reason` varchar(500) DEFAULT NULL,
  `rewards_time` date DEFAULT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `rewards_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emp_id2` (`emp_id`),
  KEY `fk_reward_type_id` (`rewards_type_id`),
  CONSTRAINT `fk_emp_id2` FOREIGN KEY (`emp_id`) REFERENCES `pm_employee_information` (`id`),
  CONSTRAINT `fk_reward_type_id` FOREIGN KEY (`rewards_type_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_rewards_records
-- ----------------------------
INSERT INTO `pm_rewards_records` VALUES ('32', null, null, '2020-04-15', 'admin', '134', '23');
INSERT INTO `pm_rewards_records` VALUES ('33', null, null, '2020-04-24', 'manager', '135', '23');
INSERT INTO `pm_rewards_records` VALUES ('34', null, null, '2020-05-20', 'manager', '134', '22');

-- ----------------------------
-- Table structure for pm_users
-- ----------------------------
DROP TABLE IF EXISTS `pm_users`;
CREATE TABLE `pm_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_is_start` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '是',
  `user_create_time` datetime DEFAULT NULL,
  `user_role_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bl_users` (`user_role_id`),
  CONSTRAINT `fk_bl_users` FOREIGN KEY (`user_role_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pm_users
-- ----------------------------
INSERT INTO `pm_users` VALUES ('1', 'admin', 'admin', '是', '2019-11-28 09:42:25', '1');
INSERT INTO `pm_users` VALUES ('15', '马超666', 'machao', '是', '2020-03-15 17:08:01', '3');
INSERT INTO `pm_users` VALUES ('25', '项羽666', 'xiangyu', '是', '2020-04-15 23:39:32', '3');
INSERT INTO `pm_users` VALUES ('26', 'manager', 'manager', '是', '2020-04-16 09:47:02', '2');
INSERT INTO `pm_users` VALUES ('27', '李白666', 'libai', '是', '2020-04-16 10:50:06', '3');
INSERT INTO `pm_users` VALUES ('28', '鲁班666', 'luban', '是', '2020-05-23 10:43:03', '1');

-- ----------------------------
-- Table structure for pm_wages_management
-- ----------------------------
DROP TABLE IF EXISTS `pm_wages_management`;
CREATE TABLE `pm_wages_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `years` int(11) NOT NULL,
  `months` int(11) NOT NULL,
  `monthly_wages` decimal(18,2) DEFAULT NULL,
  `performance_royalty` decimal(18,2) DEFAULT NULL,
  `deduct` decimal(18,2) DEFAULT NULL,
  `real_pay` decimal(18,2) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_wages_management
-- ----------------------------
INSERT INTO `pm_wages_management` VALUES ('32', '2020', '1', '3000.00', '200.00', null, '3200.00', '134');
INSERT INTO `pm_wages_management` VALUES ('33', '2020', '1', '3000.00', '200.00', '50.00', '3150.00', '135');
INSERT INTO `pm_wages_management` VALUES ('34', '2020', '1', '3000.00', '300.00', null, '3300.00', '136');
INSERT INTO `pm_wages_management` VALUES ('38', '2020', '2', '4000.00', '300.00', null, '4300.00', '134');
INSERT INTO `pm_wages_management` VALUES ('39', '2020', '2', '4000.00', '3000.00', '100.00', '4200.00', '135');
INSERT INTO `pm_wages_management` VALUES ('40', '2020', '2', '4000.00', '300.00', null, '4300.00', '136');
INSERT INTO `pm_wages_management` VALUES ('41', '2020', '3', '4000.00', '500.00', null, '4500.00', '134');
INSERT INTO `pm_wages_management` VALUES ('42', '2020', '3', '4000.00', '300.00', null, '4300.00', '135');
INSERT INTO `pm_wages_management` VALUES ('43', '2020', '3', '4000.00', '500.00', '100.00', '4400.00', '136');
INSERT INTO `pm_wages_management` VALUES ('44', '2020', '4', '4000.00', '400.00', null, '4400.00', '134');
INSERT INTO `pm_wages_management` VALUES ('45', '2020', '4', '4000.00', '500.00', null, '4500.00', '135');
INSERT INTO `pm_wages_management` VALUES ('46', '2020', '4', '4000.00', '600.00', '200.00', '4400.00', '136');

-- ----------------------------
-- Table structure for pm_work_experience
-- ----------------------------
DROP TABLE IF EXISTS `pm_work_experience`;
CREATE TABLE `pm_work_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `work_company` varchar(100) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_work_experience
-- ----------------------------
INSERT INTO `pm_work_experience` VALUES ('39', '2020-04-15', '2020-04-15', '研发部', '测试工程师', '范鹏天地互娱有限公司', '134');
